<?php

namespace App\Http\Controllers;

use App\Models\PaymentResponse;
use Exception;
use Illuminate\Http\Request;

class PaynowController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request, $method)
    {
        if(method_exists($this, $method)) {
            $rep = $this->$method($request);
            return redirect()->route('uq-jix.show', [
                'uq_jix' => data_get($rep, 'req.order.order_number', ''),
            ]);
        }
        abort(401);
    }


    /**
     * 交易結果接收網址〈信用卡、WebATM〉
     * PowerPayNow交易結果接收網址〈Paynow連結網址交易〉
     * 3D交易結果接收網址
     *
     * @param  mixed $request
     * @return void
     */
    private function biller(Request $request)
    {
        $note1 = [];
        try {
            $note1 = json_decode(urldecode($request->input('Note1')), true);
        }
        catch(Exception $e) {}

        // 新增 response
        return PaymentResponse::create(collect($request->input())->only([
            'payment_request_id',
            'BuysafeNo',
            'PassCode',
            'OrderNo',
            'TotalPrice',
            'PayType',
            'TranStatus',
            'WebNo',
            'ErrDesc',
            'pan_no4',
            'Card_Foreign',
        ])->transform(fn ($val, $key) => urldecode($val))->merge($note1)->toArray());
    }

    /**
     * 離線付款回傳網址〈虛擬帳號轉帳〉
     *
     * @param  mixed $request
     * @return void
     */
    private function offlinepay(Request $request)
    {
        $note1 = [];
        try {
            $note1 = json_decode(urldecode($request->input('Note1')), true);
        }
        catch(Exception $e) {}

        // 新增 response
        return PaymentResponse::create(collect($request->input())->only([
            'payment_request_id',
            'BuysafeNo',
            'OrderNo',
            'PassCode',
            'TotalPrice',
            'PayType',
            'TranStatus',
            'ATMNo',
            'BankCode',
            'BranchCode',
            'NewDate',
            'DueDate',
        ])->transform(fn ($val, $key) => urldecode($val))->merge($note1)->toArray());
    }

    /**
     * 已撥款回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function givepay(Request $request)
    {

    }

    /**
     * 請款回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function alreadpay(Request $request)
    {

    }

    /**
     * 物流結果回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function package(Request $request)
    {

    }
}
