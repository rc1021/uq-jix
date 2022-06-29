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
        // 因為訂單編號不能重覆，所以這依據建立payment的次數變更值的不同
        $order_no = $this->order_number;
        $count = $this->payments->count();
        if($count > 0)
            $order_no .= '_' . str_pad($count+1, 2, '0', STR_PAD_LEFT);

        $params = [
            'WebNo' => config('paynow.WebNo'),
            'ECPlatform' => 'REHOW',
            'ReceiverName' => $this->name,
            'ReceiverID' => $this->email,
            'ReceiverTel' => $this->phone,
            'ReceiverEmail' => $this->email,
            'OrderNo' => $order_no,
            'TotalPrice' => $this->total
                          + $this->delivery_fee,
            'PayType' => data_get($this, 'pay_type', '01'),
            'AtmRespost' => 0,
            'DeadLine' => 0,
            'PayEN' => 0,
            'EPT' => 1,
            // 'Note1' => '',                                   // 備註 1
            // 'Note2' => '',                                   // 備註 2
        ];

        if($params['PayType'] == '03')
            $params['DeadLine'] = 1; // DeadLine = 0 , 的狀況下會送0天交易期限給銀行，銀行不接受交易期間小於一天，建議DeadLine帶入1，這部分會再向銀行反應, 系統顯示的DueDate因為不允許小於今天，所以都會是顯示今天的最後時間
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
