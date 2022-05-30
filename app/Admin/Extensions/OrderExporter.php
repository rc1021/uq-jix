<?php

namespace App\Admin\Extensions;

use Encore\Admin\Grid;
use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithMapping;

class OrderExporter extends ExcelExporter implements WithMapping
{
    public function __construct(Grid $grid = null)
    {
        parent::__construct($grid);
        $this->fileName = '訂單列表_' . date('YmdHi') . '.xlsx';
    }

    protected $headings = [
            '建立日期',
            '訂單編號',
            '收件人姓名',
            '手機號碼',
            'Email',
            '收件地址',
            '運費',
            '商品金額',
            '總金額',
            '付款方式',
            '付款狀態',
            '是否提供自備舊衣改造',
            '自備舊衣寄送方式',
            '圖案保留',
            '毛小孩照片分享',
            '備註',
            '商品配送方式',
            '發票開立格式',
            '發票抬頭',
            '統一編號',
            '風格抱枕',
            '寵物帽T(XS)',
            '寵物帽T(S)',
            '寵物帽T(M)',
            '寵物帽T(L)',
            '寵物帽T(XL)',
            '寵物帽T(2XL)',
            '寵物帽T(3XL)',
            '寵物帽T(4XL)',
            '寵物帽T(5XL)',
    ];

    public function map($order) : array
    {
        $items = $order->items
            ->groupBy(fn($item) => config('order.products.' . $item->product_id . '.title') . '-' . $item->size)
            ->map(fn($g) => count($g))->toArray();
        $is_paied = '尚未付款';
        if($order->is_paied == 2)
            $is_paied = '已付款';
        else if($order->is_paied == 3)
            $is_paied = '付款失敗';
        return [
            date('Y-m-d H:i', data_get($order, 'created_at')),
            "'" . data_get($order, 'order_number'),
            data_get($order, 'name'),
            data_get($order, 'phone'),
            data_get($order, 'email'),
            data_get($order, 'address'),
            data_get($order, 'delivery_fee', 0),
            data_get($order, 'total', 0),
            data_get($order, 'delivery_fee', 0) + data_get($order, 'total', 0),
            config('order.paytype.' . data_get($order, 'pay_type')),
            $is_paied,
            config('order.reuse_self.' . data_get($order, 'reuse_self')),
            data_get($order, 'reuse_self') ? '' : config('order.reuse_self_shipping.' . data_get($order, 'reuse_self_delivery')),
            data_get($order, 'reuse_self') ? '' : config('order.reuse_self_picture.' . data_get($order, 'reuse_self_picture')),
            (data_get($order, 'reuse_self') && !empty($order->file)) ? config('app.url') . data_get($order, 'upload_image_url') : '',
            data_get($order, 'reuse_self_memo'),
            config('order.shipping.' . data_get($order, 'deliver') . '.title'),
            config('order.invoice.' . data_get($order, 'receipt')),
            data_get($order, 'corpName'),
            data_get($order, 'taxIDnumber'),
            data_get($items, '風格抱枕-one size', 0),
            data_get($items, '寵物帽T-XS', 0),
            data_get($items, '寵物帽T-S', 0),
            data_get($items, '寵物帽T-M', 0),
            data_get($items, '寵物帽T-L', 0),
            data_get($items, '寵物帽T-XL', 0),
            data_get($items, '寵物帽T-2XL', 0),
            data_get($items, '寵物帽T-3XL', 0),
            data_get($items, '寵物帽T-4XL', 0),
            data_get($items, '寵物帽T-5XL', 0),
        ];
    }
}
