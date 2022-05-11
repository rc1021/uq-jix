<?php

use App\Services\GoogleSheetWriteBehind;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;
use Revolution\Google\Sheets\Facades\Sheets;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('view', function () {
//     GoogleSheetWriteBehind::getInstance()->Get();
//     return [
//         'tmp' => Cache::get(GoogleSheetWriteBehind::PrefixKeyAppend . env('SPREADSHEET_ID')),
//         'get' => Cache::get(GoogleSheetWriteBehind::PrefixKeySpreadsheet . env('SPREADSHEET_ID')),
//     ];
// });

Route::get('/', function () {
    return redirect()->route('index');
});

Route::get('/uq-jix', function () {
    // $instance = GoogleSheetWriteBehind::getInstance();
    // $data = $instance->Get();
    return view('welcome', [
        'places' => array_keys(GoogleSheetWriteBehind::PlaceLimit),
        'date_range' => GoogleSheetWriteBehind::DateRange,
        'time_range' => GoogleSheetWriteBehind::TimeRange,
        'items' => GoogleSheetWriteBehind::ItemRange,
        // 'countable' => $data['countable'],
        // 'limitable' => $instance->getLimit(),
        'countable' => [],
        'limitable' => [],
    ]);
})->name('index');

Route::post('/search', function () {
    if($mobile = request()->input('mobile')) {
        $instance = GoogleSheetWriteBehind::getInstance();
        return redirect()->route('index')->with([
            'search' => true,
            'data' => $instance->Find($mobile),
        ]);
    }
    return redirect()->route('index');
})->name('form.search');

Route::post('/', function () {
    $inputs = request()->only(array_keys(GoogleSheetWriteBehind::DefindCols));
    do {
        // 使用原子鎖執行任務
        $appended = GoogleSheetWriteBehind::getInstance()->Lock(function ($instance) use ($inputs) {
            // 寫入暫存區
            $instance->Append($inputs);
        });
        // 是否已寫入, 已寫入暫存區則跳出迴圈並做出回應
        if($appended)
            break;
        // 等待 1 秒後再試寫一次
        sleep(1);
    } while(true);
    $instance = GoogleSheetWriteBehind::getInstance();
    return redirect()->route('index')->with([
        'status' => '已報名成功',
        'data' => $instance->replaceKeys($inputs)
    ]);
})->name('form.post');
