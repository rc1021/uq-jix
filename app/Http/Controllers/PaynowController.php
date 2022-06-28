<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\PaymentResponse;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

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
            $order = data_get($rep, 'req.order');
            try {
                // 付款成功寄通知
                $order->fresh();
                if($order->is_paied == 2)
                    Mail::to($order->email)->send(new \App\Mail\PaymentResponse($order));
            }
            catch(Exception $e) {}
            return redirect()->route('uq-jix.show', [
                'uq_jix' => $order->order_number,
            ]);
        }
        abort(401);
    }

    public function repay(Request $request, $number)
    {
        $order = Order::where('order_number', $number)->first();
        if($order) {
            return redirect($order->getPaymentUrl());
        }
        return redirect()->route('uq-jix.show', ['uq_jix' => $number]);
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
        Log::info('交易結果接收網址〈信用卡、WebATM〉', $request->input());
        $note1 = [];
        try {
            $note1 = json_decode(urldecode($request->input('Note1')), true);
        }
        catch(Exception $e) {}

        // 新增 response
        return tap(PaymentResponse::create(collect($request->input())->only([
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
        ])->transform(fn ($val, $key) => urldecode($val))->merge($note1)->toArray()), function ($rep) {
            $order = data_get($rep, 'req.order');
            if($order) {
                if(data_get($rep, 'TranStatus') == 'S') {
                    $order->is_paied = 2;
                }
                else {
                    $order->is_paied = 3;
                }
                $order->save();
            }
            else {
                Log::error('交易結果接收網址〈信用卡、WebATM〉失敗，找不到訂單', compact('rep'));
            }
        });
    }

    /**
     * 離線付款回傳網址〈虛擬帳號轉帳〉
     *
     * @param  mixed $request
     * @return void
     */
    private function offlinepay(Request $request)
    {
        Log::info('離線付款回傳網址〈虛擬帳號轉帳〉', $request->input());
        $note1 = [];
        try {
            $note1 = json_decode(urldecode($request->input('Note1')), true);
        }
        catch(Exception $e) {}

        // 新增 response
        return tap(PaymentResponse::create(collect($request->input())->only([
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
        ])->transform(fn ($val, $key) => urldecode($val))->merge($note1)->toArray()), function ($rep) {
            $order = data_get($rep, 'req.order');
            if($order) {
                if(data_get($rep, 'TranStatus') == 'S') {
                    $order->is_paied = 2;
                }
                else {
                    $order->is_paied = 3;
                }
                $order->save();
            }
            else {
                Log::error('離線付款回傳網址〈虛擬帳號轉帳〉失敗，找不到訂單', compact('rep'));
            }
        });
    }

    /**
     * 已撥款回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function givepay(Request $request)
    {
        Log::info('已撥款回傳網址', $request->input());
    }

    /**
     * 請款回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function alreadpay(Request $request)
    {
        Log::info('請款回傳網址', $request->input());
    }

    /**
     * 物流結果回傳網址
     *
     * @param  mixed $request
     * @return void
     */
    private function package(Request $request)
    {
        Log::info('物流結果回傳網址', $request->input());
    }
}
