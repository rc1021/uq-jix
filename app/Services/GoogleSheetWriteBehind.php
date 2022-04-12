<?php

namespace App\Services;

use App\Contracts\GoogleSheetWriteBehind as ContractsGoogleSheetWriteBehind;
use Closure;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Revolution\Google\Sheets\Facades\Sheets;

class GoogleSheetWriteBehind implements ContractsGoogleSheetWriteBehind
{
    const PrefixKeySpreadsheet = 'spreadsheet_';
    const PrefixKeyAppend = 'append_';
    const PlaceLimit = ['UNIQLO TAIPEI 台北旗艦店' => 50, '台中崇德路店' => 40, '台南文賢路店' => 40];
    const DateRange  = ['2022/04/16', '2022/04/23', '2022/04/30'];
    const TimeRange  = ['11:00-13:00', '13:00-15:00', '15:00-17:00', '17:00-19:00', '19:00-21:00'];
    const ItemRange  = [
        'item1' => '風格抱枕 NT$790',
        'item2' => '寵物帽T NT$790',
        'item3' => '寵物風衣 NT$1,290'
    ];
    const DefindCols = [
        'name' => '姓名',
        'mobile' => '電話',
        'email' => '信箱',
        'place' => '預約店點',
        'date' => '希望預約日期',
        'time' => '希望預約時間',
        'item1' => '風格抱枕 $790',
        'item2' => '寵物帽T $790',
        'item3' => '寵物風衣 $1290',
    ];
    protected $spreadsheet_id;

    function __construct()
    {
        $this->spreadsheet_id = env('SPREADSHEET_ID');
    }

    public function Lock(Closure $callback): bool
    {
        $lock = Cache::lock('google_sheet_write_behind', 10);
        if ($lock->get()) {
            try {
                $callback($this);
            }
            finally {
                $lock->release();
            }
            return true;
        }
        return false;
    }

    public static function getInstance()
    {
        return new static;
    }

    /**
     * 將表單索引取代為 Sheet 的欄位
     *
     * @param  array $input
     * @return array
     */
    public function replaceKeys(array $input, $reverse = false)
    {
        $cols = ($reverse) ? collect(static::DefindCols)->flip()->all() : static::DefindCols;
        $keys = collect(array_keys($input))->map(fn ($k) => data_get($cols, $k, null))->filter()->all();
        return array_combine($keys, $input);
    }

    /**
     * 取得每個時段人數限制
     * ex:
     * [
     *  '台北旗艦店_2022/4/16_11:00-13:00' => 50, ...
     * ]
     *
     * @return void
     */
    public function getLimit() {
        $arr = [];
        foreach(static::PlaceLimit as $p => $l) {
            foreach(static::DateRange as $d) {
                foreach(static::TimeRange as $t) {
                    $arr[implode('_', [$p, $d, $t])] = $l;
                }
            }
        }
        return $arr;
    }

    public function Find($mobile = null)
    {
        $mobile = $mobile ?: request()->input('mobile');
        $data = $this->Get();
        $d = data_get($data, 'items.' . $mobile, []);
        $items = [];
        foreach($d as $k => $v) {
            if(in_array($k, static::ItemRange)) {
                array_push($items, $k);
                unset($d[$k]);
            }
        }
        $d = array_filter($d);
        $items = implode(', ', $items);
        $d = $this->replaceKeys($d, true);
        $d['items'] = $items;
        return $d;
    }

    public function Get($cached = true)
    {
        $key = static::PrefixKeySpreadsheet . $this->spreadsheet_id;
        if($cached and Cache::has($key))
            return Cache::get($key);

        // 所有工作表內容
        $spreadsheet = Sheets::spreadsheet($this->spreadsheet_id);
        $sheet_names = $spreadsheet->sheetList();
        $collect = collect($sheet_names)
                    ->map(function ($name) use ($spreadsheet) {
                        $rows = $spreadsheet->sheet($name)->get();
                        $header = $rows->pull(0);
                        $header_col_count = count($header);
                        $rows = $rows->filter(fn($row) => count($row) > 0);
                        $data = Sheets::collection($header, $rows)
                            ->filter(function ($row) {
                                $first_time = explode('-', $row[static::DefindCols['time']]);
                                return $row[static::DefindCols['date']] . ' ' . array_shift($first_time) >= date('Y/m/d H:i');
                            })
                            ->map(function ($row) {
                                foreach(static::ItemRange as $item) {
                                    if(empty(data_get($row, $item)))
                                        unset($row[$item]);
                                }
                                return $row;
                            })
                            ->toArray();
                        return compact('name', 'data');
                    })->pluck('data', 'name');

        return tap([
            // 工作表名稱
            'sheet_names' => $sheet_names,
            // 取得每個地點有效人數
            'countable_place' => $collect->mapWithKeys(function ($sheet, $key) {
                return collect($sheet)->countBy(fn ($item) => $key);
            })->filter(fn ($row, $key) => !empty($key))->all(),
            // 取得每天有效人數
            'countable_date' => $collect->mapWithKeys(function ($sheet, $key) {
                return collect($sheet)->countBy(fn ($item) => $key . '_' . $item[static::DefindCols['date']]);
            })->filter(fn ($row, $key) => !empty($key))->all(),
            // 取得每個時段目前人數
            'countable' => $collect->mapWithKeys(function ($sheet, $key) {
                return collect($sheet)->countBy(fn ($item) => implode('_', [$key, $item[static::DefindCols['date']], $item[static::DefindCols['time']]]));
            })->filter(fn ($row, $key) => !empty($key))->all(),
            // 已預約的電話號碼資料
            'items' => $collect->mapWithKeys(function ($sheet, $key) {
                return collect($sheet)->mapWithKeys(function ($item) use ($key) {
                    $item[static::DefindCols['place']] = $key;
                    return [$item[static::DefindCols['mobile']] => $item];
                });
            })->all(),
        ], fn(array $data) => Cache::put($key, $data));
    }

    public function Append($input = [], $place = null)
    {
        $data = $this->Get();

        // 驗證電話號碼是否已報名
        Validator::make($input, [
            'mobile' => [
                function ($attribute, $value, $fail) use ($data) {
                    if(array_key_exists($value, $data['items'])) {
                        $fail('您之前已報名，請使用 查詢預約狀態 進行查詢');
                        //
                        // $d = data_get($data, 'items.' . $value, []);
                        // $items = [];
                        // foreach($d as $k => $v) {
                        //     if(in_array($k, static::ItemRange)) {
                        //         array_push($items, $k);
                        //         unset($d[$k]);
                        //     }
                        // }
                        // $d = array_filter($d);
                        // $d['預約項目'] = implode(', ', $items);
                        // $fail("您之前已報名：資訊如下：\n" . implode("\n", collect($d)->map(fn($v, $k) => $k . ':' . $v)->all()));
                    }
                },
            ],
        ])->validate();

        // 驗證其它欄位
        $error_messages = [
            'name.required' => '請輸入姓名',
            'mobile.required' => '請輸入手機號碼',
            'email.required' => '請輸入電子信箱',
            'place.required' => '請選擇預約店點',
            'date.required' => '請選擇希望預約日期',
            'time.required' => '請選擇希望預約時間',
            'item1.required_without_all' => '請選擇其中一個項目',
        ];
        $a = Validator::make($input, [
            // 驗證是否有勾選項目
            'item1' => 'required_without_all:item2,item3',
            // 驗證預約店點是否存在
            'place' => [
                'required',
                function ($attribute, $value, $fail) use ($data) {
                    if(!in_array($value, $data['sheet_names'])) {
                        $fail('預約店點不存在');
                    }
                },
            ],
            // 驗證
            'name' => 'required',
            // 驗證
            'email' => 'required',
            // 驗證電話號碼是否輸入
            'mobile' => 'required',
            // 驗證是否選擇日期
            'date' => 'required',
            // 驗證時段是否已額滿
            'time' => [
                'required',
                function ($attribute, $value, $fail) use ($data, $input) {
                    $key = implode('_', [data_get($input, 'place'), data_get($input, 'date'), $value]);
                    // 目前人數 + 1 vs 上限人數
                    if((data_get($data, 'countable.' . $key, 0) + 1) > data_get($this->getLimit(), $key))
                        $fail('本場次已報名額滿');
                },
            ],
        ], $error_messages)->validateWithBag('form');

        // 加入已報名名單中
        // 更新 Spreadsheet 暫存資料
        $key = implode('_', [data_get($input, 'place'), data_get($input, 'date'), data_get($input, 'time')]);
        if(!array_key_exists($key, $data['countable']))
            $data['countable'][$key] = 0;
        $data['countable'][$key]++;
        $data['items'][data_get($input, 'mobile')] = $this->replaceKeys($input);
        Cache::put(static::PrefixKeySpreadsheet . $this->spreadsheet_id, $data);
        // 在暫存區加入一筆資料
        tap(static::PrefixKeyAppend . $this->spreadsheet_id, function ($key) use ($data, $input) {
            reset($data['sheet_names']);
            $place = data_get($input, 'place', current($data['sheet_names']));
            if(array_key_exists('place', $input)) {
                unset($input['place']);
                $input = array_filter($input);
            }
            $appends = Cache::get($key);
            if(is_null($appends)) {
                $appends = array_fill(0, count($data['sheet_names']), []);
                $appends = array_combine($data['sheet_names'], $appends);
            }
            array_push($appends[$place], $this->replaceKeys($input));
            Cache::put($key, $appends);
        });
    }

    public function Sync()
    {
        $this->Lock(function () {
            $key = static::PrefixKeyAppend . $this->spreadsheet_id;
            if(Cache::has($key)) {
                $spreadsheet = Sheets::spreadsheet($this->spreadsheet_id);
                $sheets = Cache::get($key);
                foreach($sheets as $name => $data) {
                    $count = count($data);
                    if($count > 0) {
                        $spreadsheet->sheet($name)->append($data);
                        Log::info('[' . date('Y/m/d H:i:s') . ']寫 ' . $count . ' 筆資料到 "' . $name . '"。', $data);
                    }
                }
                Cache::forget($key);
            }
            Cache::forget(static::PrefixKeySpreadsheet . $this->spreadsheet_id);
        });
    }
}
