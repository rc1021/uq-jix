<?php

return [

    'price_prefix' => 'NT$',

    'products' => [
        [
            'title' => '風格抱枕',
            'price' => 790,
            'size_select' => false,
        ],
        [
            'title' => '寵物帽T',
            'price' => 790,
            'size_select' => true,
        ],
    ],

    'paytype' => [
        '01' => '信用卡',
        '03' => '虛擬帳號',
    ],

    'shipping' => [
        [
            'title' => '郵局寄送 運費NT$80',
            'price' => 80,
        ],
    ],

    'invoice' => ['二聯式發票', '三聯式發票 (三聯式請填寫抬頭與統編)'],

    // 是否提供自備舊衣改造
    'reuse_self' => ['是 (使用個人二手衣製作)', '否 (使用回收舊衣製作，顏色不指定)'],

    // 自備舊衣寄送方式
    'reuse_self_shipping' => ['郵寄/快遞寄送', '親送面交'],

    // 圖案保留
    'reuse_self_picture' => ['正面', '背面'],

];
