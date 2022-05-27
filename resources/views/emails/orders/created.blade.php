@component('mail::message')
# 訂單通知 #{{ $order->order_number }}

親愛的顧客您好:

感謝您的訂購，與我們一起支持永續行動！謹以此 Email 通知您本系統已收到您的訂購訊息，不代表交易完成。

訂單付款成功後商品將會進入製作流程，並於完成後盡速寄出給您，商品寄出時我們亦會寄發出貨通知信給您，請您放心。

**訂單明細**

@component('mail::table')
| 品名 | 尺寸 | 數量 | 金額 |
|:------------- |:------------- |:------------- | --------:|
@foreach ($order->items as $item)
| {{ config('order.products.'.$item->product_id.'.title') }} | {{ $item->size }} | {{ $item->quantity }} | {{ $item->quantity * config('order.products.'.$item->product_id.'.price') }} |
@endforeach
@endcomponent

**訂購人資訊**
- 姓名：{{ $order->name }}
- 聯絡電話：{{ $order->phone }}
- Email：{{ $order->email }}
- 地址：{{ $order->address }}

@component('mail::button', ['url' => $url, 'color' => 'success'])
前往訂單
@endcomponent

提醒您！
- 請務必至 《REHOW x JUST IN XX 舊衣新生》活動官網 中的 [查詢訂單]({{ $url }}) 確認完成付款。
- 若付款完成後訂單狀態仍在待付款，則需請您連繫客服並提供轉帳明細資訊，以便客服人員協助確認。

[防詐騙提醒]

{{ config('app.name') }}不會以電話通知更改付款方式或要求改以ATM重新轉帳。亦不會委託廠商以電話通知變更付款方式或要求提供ATM匯款帳號。

※服務說明請詳參 FAQ [常見問題]({{ config('app.url') . '/uq-jix#FAQ' }}) ，若您需要幫助歡迎您聯繫客服，電洽客服0909-590963。電話客服受理時間：周一至周六 (周二公休) 10:00-18:00

謝謝,<br>
{{ config('app.name') }}
@endcomponent
