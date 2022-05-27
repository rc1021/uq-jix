<?php

namespace App\Mail;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class PaymentResponse extends Mailable
{
    use Queueable, SerializesModels;

    protected $order;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $order = $this->order;
        $url = route('uq-jix.show', ['uq_jix' => $order->order_number]);
        return $this->subject('《REHOW x JUST IN XX 舊衣新生工坊》 訂單付款成功通知')
            ->cc(explode(';', env('Order_Created_Mail_CC')))
            ->markdown('emails.orders.payment_response', compact('order', 'url'));
    }
}
