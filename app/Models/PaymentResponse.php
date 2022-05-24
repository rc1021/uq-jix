<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentResponse extends Model
{
    use HasFactory;

    protected $fillable = [
        'payment_request_id',

        'BuysafeNo',
        'PassCode',
        'OrderNo',
        'TotalPrice',
        'PayType',
        'TranStatus',   // 繳款狀態

        // 付款方式為信用卡、WebATM
        'WebNo',
        'ErrDesc',
        'pan_no4',
        'Card_Foreign',

        // 超商條碼產生日期(繳款日) or 虛擬帳號產生日期(繳款日)
        'NewDate',

        // 繳款期限
        'DueDate',

        // 付款方式為虛擬帳號
        'ATMNo',
        'BankCode',
        'BranchCode',

        // 付款方式為超商代收
        'BarCode1',
        'BarCode2',
        'BarCode3',
    ];

    public function req()
    {
        return $this->belongsTo(PaymentRequest::class, 'payment_request_id', 'id');
    }
}
