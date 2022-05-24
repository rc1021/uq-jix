<?php

use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaynowController;
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
    return redirect()->route('uq-jix.index');
});

Route::resource('uq-jix', OrderController::class)->only(['index', 'store', 'show']);

Route::post('paynow/{method}', PaynowController::class)->name('paynow');
