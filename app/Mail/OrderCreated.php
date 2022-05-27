<?php

namespace App\Mail;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderCreated extends Mailable
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
        return $this->subject(config('app.name') . '訂購通知 #' . $order->order_number)
            ->cc(explode(';', env('Order_Created_Mail_CC')))
            ->markdown('emails.orders.created', compact('order', 'url'));
    }
}
