<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Widgets\Tab;
use \App\Models\Order;
use Illuminate\Support\Facades\URL;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Order';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());

        $grid->column('id', __('序號'));
        $grid->column('created_at', __('建立日期'))->display(fn($created_at) => date('Y-m-d H:i', $created_at));
        $grid->column('order_number', __('訂單編號'))->expand(function ($model) {
            $tab = new Tab();
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
            $tab->add('商品配送、付款及發票', new Table([
                __('商品配送方式'),
                __('付款方式'),
                __('發票開立格式'),
                __('發票抬頭'),
                __('統一編號'),
            ], [
                [
                    config('order.shipping.' . $model->deliver . '.title'),
                    ($this->is_paied) ? config('order.paytype.' . $model->pay_type) : sprintf('<del style="color: red;">%s</del>', config('order.paytype.' . $model->pay_type)),
                    config('order.invoice.' . $model->receipt),
                    $model->corpName,
                    $model->taxIDnumber,
                ]
            ]));
            return $tab->render();
        });
        $grid->column('name', __('收件人姓名'));
        $grid->column('phone', __('手機號碼'));
        $grid->column('email', __('Email'));
        $grid->column('address', __('收件地址'));
        $grid->column('delivery_fee', __('運費'));
        $grid->column('total', __('商品金額'));
        $grid->column('allprice', __('總金額'))->display(function($allprice) {
            return sprintf('%s %s', $this->total + $this->delivery_fee, ($this->is_paied)
                ? '&nbsp;<small style="color: green;">已付款</small>'
                : '&nbsp;<small style="color: red;">尚未付款</small>');
        });

        $grid->filter(function($filter){
            $filter->disableIdFilter();
            $filter->like('order_number', __('訂單編號'));
            $filter->like('name', __('收件人姓名'));
            $filter->like('phone', __('手機號碼'));
            $filter->like('email', __('Email'));
        });
        $grid->disableActions();
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableActions();

        return $grid;
    }

}
