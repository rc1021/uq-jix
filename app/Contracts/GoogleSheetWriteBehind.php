<?php

namespace App\Contracts;

use Closure;

interface GoogleSheetWriteBehind
{
    /**
     * 唯讀模式, 同一時間只有 1個 $callback被執行
     *
     * @param  mixed $callback
     * @return bool
     */
    public function Lock(Closure $callback): bool;
    /**
     * 尋找報名資料
     *
     * @param  mixed $mobile
     * @return array
     */
    public function Find($mobile = null);
    /**
     * 取得 Spreadsheet 所有資料
     *
     * @param  mixed $cached
     * @return void
     */
    public function Get($cached = true);
    /**
     * 加一筆資料
     *
     * @param  mixed $data
     * @param  mixed $place
     * @return void
     */
    public function Append($data = [], $place = null);
    /**
     * 同步暫存資料到 Spreadsheet
     *
     * @return void
     */
    public function Sync();
}
