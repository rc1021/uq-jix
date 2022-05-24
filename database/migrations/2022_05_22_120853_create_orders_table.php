<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_number');    // 訂單編號
            $table->tinyInteger('reuse_self');    // 是否提供自備舊衣改造
            $table->tinyInteger('reuse_self_delivery');    // 自備舊衣寄送方式
            $table->string('reuse_self_picture');    // 圖案保留
            $table->string('reuse_self_memo')->nullable();    // 備註
            $table->string('file')->nullable();    // 寵物照片
            $table->string('name');    // 收件人姓名
            $table->string('phone');    // 收件人手機號碼
            $table->string('email');    // 收件人Email
            $table->string('address');    // 收件地址
            $table->tinyInteger('deliver');    // 商品配送方式
            $table->tinyInteger('receipt');    // 發票開立
            $table->string('corpName')->nullable();    // 發票抬頭
            $table->string('taxIDnumber')->nullable();    // 統一編號
            $table->string('pay_type')->default('01'); // 付款方式
            $table->integer('delivery_fee')->default(0); // 運費
            $table->integer('total'); // 總金額
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
        Schema::dropIfExists('orders');
    }
}
