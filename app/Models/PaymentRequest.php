<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        "order_id",
        "WebNo",
        "ECPlatform",
        "ReceiverName",
        "ReceiverID",
        "ReceiverTel",
        "ReceiverEmail",
        "OrderNo",
        "TotalPrice",
        "PayType",
        "AtmRespost",
        "DeadLine",
        "PayEN",
        "EPT",
        "PassCode",
        "OrderInfo",
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function rep()
    {
        return $this->hasOne(PaymentResponse::class, 'payment_request_id', 'id');
    }

    public function url()
    {
        $params = $this->toArray();
        unset($params['id']);
        unset($params['order_id']);
        unset($params['created_at']);
        unset($params['updated_at']);
        $params['Note1'] = json_encode(['payment_request_id' => $this->id]);

        return config('paynow.PostUrl') . '?' . implode('&', collect($params)->map(fn($value, $key) => $key . '=' . urlencode($value))->toArray());
    }
}
