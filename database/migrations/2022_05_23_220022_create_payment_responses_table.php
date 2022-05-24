<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentResponsesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_responses', function (Blueprint $table) {
            $table->id();

            $table->foreignId('payment_request_id');

            $table->string('BuysafeNo');
            $table->string('PassCode');
            $table->string('OrderNo');
            $table->string('TotalPrice');
            $table->string('PayType');
            $table->string('TranStatus');   // 繳款狀態

            // 付款方式為信用卡、WebATM
            $table->string('WebNo')->nullable();
            $table->string('ErrDesc')->nullable();
            $table->string('pan_no4')->nullable();
            $table->string('Card_Foreign')->nullable();

            // 超商條碼產生日期(繳款日) or 虛擬帳號產生日期(繳款日)
            $table->string('NewDate')->nullable();

            // 繳款期限
            $table->string('DueDate')->nullable();

            // 付款方式為虛擬帳號
            $table->string('ATMNo')->nullable();
            $table->string('BankCode')->nullable();
            $table->string('BranchCode')->nullable();

            // 付款方式為超商代收
            $table->string('BarCode1')->nullable();
            $table->string('BarCode2')->nullable();
            $table->string('BarCode3')->nullable();

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
        Schema::dropIfExists('payment_responses');
    }
}
