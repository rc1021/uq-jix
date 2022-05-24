<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_requests', function (Blueprint $table) {
            $table->id();
            $table->foreignId("order_id");
            $table->string("WebNo");
            $table->string("ECPlatform");
            $table->string("ReceiverName");
            $table->string("ReceiverID");
            $table->string("ReceiverTel");
            $table->string("ReceiverEmail");
            $table->string("OrderNo");
            $table->string("TotalPrice");
            $table->string("PayType");
            $table->string("AtmRespost");
            $table->string("DeadLine");
            $table->string("PayEN");
            $table->string("EPT");
            $table->string("PassCode");
            $table->string("OrderInfo");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_requests');
    }
}
