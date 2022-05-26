<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_number',
        'reuse_self',    // 是否提供自備舊衣改造
        'reuse_self_delivery',    // 自備舊衣寄送方式
        'reuse_self_picture',    // 圖案保留
        'reuse_self_memo',    // 備註
        'name',    // 收件人姓名
        'phone',    // 收件人手機號碼
        'email',    // 收件人Email
        'address',    // 收件地址
        'deliver',    // 商品配送方式
        'receipt',    // 發票開立
        'corpName',    // 發票抬頭
        'taxIDnumber',    // 統一編號
        'pay_type', // 付款方式
        'delivery_fee', // 運費
        'total', // 總金額
    ];

    protected $casts = [
        'created_at' => 'timestamp',
    ];

    protected $appends = ['upload_image_url'];

    /**
     * 項目明細
     *
     * @return void
     */
    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    /**
     * 取得付款方式
     *
     * @return void
     */
    public function payments()
    {
        return $this->hasMany(PaymentRequest::class);
    }

    public function getUploadImageUrlAttribute()
    {
        if($this->file)
            return Storage::url($this->file);
        return null;
    }

    /**
     * 取得付款網址
     *
     * @return void
     */
    public function getPaymentUrl()
    {
        $params = [
            'WebNo' => config('paynow.WebNo'),               // 賣家登入帳號，如身分證開頭請為大寫 傳送。
            'ECPlatform' => config('paynow.ECPlatform'),     // 商家網站名稱 (例 : XXX 購物網、對外 商店名稱)
            'ReceiverName' => $this->name,                   // 消費者姓名
            'ReceiverID' => $this->phone,                    // 消費者ID 消費者身分證/Email/手機號碼
            'ReceiverTel' => $this->phone,                   // 消費者電話 若沒有手機可填入聯絡電 話
            'ReceiverEmail' => $this->email,                 // 消費者 Email
            'OrderNo' => $this->order_number,                // 商家自訂訂單編號
            'TotalPrice' => $this->total
                          + $this->delivery_fee,             // 交易金額
            'PayType' => data_get($this, 'pay_type', '01'),  // 付款方式
            'AtmRespost' => 0,                               // 需回傳虛擬擬帳號
            'DeadLine' => 0,                                 // 繳款期限
            'PayEN' => 0,                                    // 中英文付款頁面
            'EPT' => 1,                                      // 系統分系代數
            // 'Note1' => '',                                   // 備註 1
            // 'Note2' => '',                                   // 備註 2
        ];

        // if($params['PayType'] == '03')
        //     $params['AtmRespost'] = 1;                       // 需回傳虛擬擬帳號

        if($params['PayType'] == '05')
            $params['CodeType'] = 1;                         // 代碼繳費服務辨識代號

        // 驗證碼 將以下的順序組合起來成一字串 : ( WebNo+OrderNo+Total Price+商 家交易密碼) 並使用 SHA-1 雜湊函數 取得組合字串的雜湊值後轉大寫
        $params['PassCode'] = strtoupper(sha1(
            $params['WebNo']
          . $params['OrderNo']
          . $params['TotalPrice']
          . config('paynow.WebSecret')
        ));

        // 商家自訂交易訊息
        $params['OrderInfo'] = "";
        foreach($this->items as $item) {
            $params['OrderInfo'] .= sprintf("%s, %s x %s, %s%s\n",
                data_get(config('order'), 'products.' . $item->product_id . '.title'),
                $item->size,
                $item->quantity,
                config('order.price_prefix'),
                $item->quantity * data_get(config('order'), 'products.' . $item->product_id . '.price')
            );
        }

        $payment = PaymentRequest::create(array_merge([
            'order_id' => $this->id,
        ], $params));

        return $payment->url();
    }
}
