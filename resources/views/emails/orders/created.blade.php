@component('mail::message')
# 訂單通知 #{{ $order->order_number }}

親爱的顧客您好:

已收到您的訂購資訊，感謝您訂購REHOW的優質產品！本通知函只是通知您本系統已收到您的訂購訊息、並供您再次自行核對之用，不代表交易已完成。

提醒您！

REHOW不會以電話通知更改付款方式或要求改以ATM重新轉帳。

亦不會委託廠商以電話通知變更付款方式或要求提供ATM匯款帳號。

---

**訂單明細**

@component('mail::table')
| 品名 | 尺寸 | 數量 | 金額 |
|:------------- |:------------- |:------------- | --------:|
@foreach ($order->items as $item)
| {{ config('order.products.'.$item->product_id.'.title') }} | {{ $item->size }} | {{ $item->quantity }} | {{ $item->quantity * config('order.products.'.$item->product_id.'.price') }} |
@endforeach
@endcomponent

---

**訂購人資訊**

@component('mail::table')
| 姓名 | 聯絡電話 | Email | 地址 |
|:------------- |:------------- |:------------- |:------------- |
| {{ $order->name }} | {{ $order->phone }}| {{ $order->email }} | {{ $order->address }} |
@endcomponent

@component('mail::button', ['url' => $url, 'color' => 'success'])
前往訂單
@endcomponent

謝謝,<br>
{{ config('app.name') }}
@endcomponent
