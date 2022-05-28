<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Widgets\Tab;
use Encore\Admin\Widgets\InfoBox;
use \App\Models\Order;
use Illuminate\Support\Facades\URL;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '訂單管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());
        $grid->model()->orderBy('created_at','desc');

        $grid->column('created_at', __('建立日期'))->display(fn($created_at) => date('Y-m-d H:i', $created_at))->sortable();
        $grid->column('order_number', __('訂單編號'))->expand(function ($model) {
            $tab = new Tab();
            $tab->add('訂購明細', new Table([
                __('品名'),
                __('尺寸'),
                __('數量'),
                __('金額小計'),
            ],
            $model->items->map(function ($item, $ind) {
                return [
                    config('order.products.' . $item->product_id . '.title'),
                    $item->size,
                    $item->quantity,
                    $item->quantity * config('order.products.' . $item->product_id . '.price'),
                ];
            })->toArray()));
            $table = '';
            if($model->reuse_self) {
                $table = new Table([
                    __('是否提供自備舊衣改造'),
                    __('備註'),
                    __('毛小孩照片分享'),
                ], [
                    [
                        config('order.reuse_self.' . $model->reuse_self),
                        $model->reuse_self_memo,
                        (empty($model->file)) ? '' : '<a href="'.$model->upload_image_url.'" target="_blank"><img src="'.$model->upload_image_url.'" width="300"></a>',
                    ]
                ]);
            }
            else {
                $table = new Table([
                    __('是否提供自備舊衣改造'),
                    __('自備舊衣寄送方式'),
                    __('圖案保留'),
                    __('備註'),
                ], [
                    [
                        config('order.reuse_self.' . $model->reuse_self),
                        config('order.reuse_self_shipping.' . $model->reuse_self_delivery),
                        config('order.reuse_self_picture.' . $model->reuse_self_picture),
                        $model->reuse_self_memo,
                    ]
                ]);
            }
            $tab->add('衣物改造', $table);
            $tab->add('商品配送及發票', new Table([
                __('商品配送方式'),
                __('發票開立格式'),
                __('發票抬頭'),
                __('統一編號'),
            ], [
                [
                    config('order.shipping.' . $model->deliver . '.title'),
                    config('order.invoice.' . $model->receipt),
                    $model->corpName,
                    $model->taxIDnumber,
                ]
            ]));
            $tab2 = new Tab();
            $tab2->add('付款方式及紀錄', new Table([
                __('建立日期'),
                __('付款方式'),
                __('預計付款費用'),
                __('付款狀態'),
                __('其它資訊'),
            ], $model->payments->map(function ($payment) {
                $other = '';
                if($payment->PayType == '01' && $payment->rep) {
                    $cf = ($payment->rep->Card_Foreign) ? '國外卡' : '國內卡';
                    $other = <<<EOF
信用卡末四碼：{$payment->rep->pan_no4}<br>
卡類：{$cf}
EOF;
                }
                return [
                    $payment->created_at,
                    config('order.paytype.' . $payment->PayType),
                    $payment->TotalPrice,
                    (!$payment->rep) ? '' : sprintf("%s%s",
                        ($payment->rep->TranStatus == 'S') ? '<span style="color:green;">成功</span>' : '<span style="color:red;">失敗</span>',
                        (is_null($payment->rep->ErrDesc)) ? '' : '：' . $payment->rep->ErrDesc
                    ),
                    $other
                ];
            })->toArray()));
            return $tab->render() . $tab2->render();
        });
        $grid->column('name', __('收件人姓名'));
        $grid->column('phone', __('手機號碼'));
        $grid->column('email', __('Email'));
        $grid->column('address', __('收件地址'));
        $grid->column('delivery_fee', __('運費'));
        $grid->column('total', __('商品金額'));
        $grid->column('allprice', __('總金額'))->display(function($allprice) {
            return $this->total + $this->delivery_fee;
        });
        $grid->column('payments', __('付款方式'))->display(function($payments) {
            return config('order.paytype.' . $this->pay_type) . '(' . count($payments) . '筆' . ')';
        });
        $grid->column('is_paied', __('付款狀態'))->using([
            2 => '已付款',
            3 => '付款失敗',
        ], '尚未付款')->dot([
            2 => 'success',
            3 => 'danger',
        ], 'warning')->sortable();

        $grid->filter(function($filter){
            $filter->disableIdFilter();
            $filter->like('order_number', __('訂單編號'));
            $filter->like('name', __('收件人姓名'));
            $filter->like('phone', __('手機號碼'));
            $filter->like('email', __('Email'));
            $filter->equal('is_paied', __('付款狀態'))->radio([
                ''   => '全部',
                1    => '尚未付款',
                2    => '已付款',
                3    => '付款失敗',
            ]);
        });
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableActions();

        return $grid;
    }

}
