<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('welcome');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $uq_jix 訂單編號
     * @return \Illuminate\Http\Response
     */
    public function show($uq_jix)
    {
        $orders = Order::with(['items', 'payments.rep'])->where('order_number', $uq_jix)->orWhere('phone', $uq_jix)->get();
        if($orders->count() > 0)
            return view('welcome', compact('orders'));
        return view('welcome', ['message' => '找不到訂單']);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->merge(['quantity_count' => array_sum(data_get($request->input(), 'quantity', []))]);
        $validated = $request->validate([
            'name' => 'bail|required',
            'phone' => 'bail|required',
            'email' => 'bail|required',
            'address' => 'bail|required',
            'corpName' => 'bail|required_if:receipt,1',
            'taxIDnumber' => 'bail|required_if:receipt,1',
            'quantity_count' => 'bail|min:1',
            // 'file' => 'file|size:' . (1024 * 5),
        ]);

        // 圖檔儲存
        $filepath = '';
        if($request->hasFile('file')){
            $filepath = $request->file->store('public/uploads');
        }

        $items = collect([]);
        collect($request->input('size'))
            ->zip($request->input('quantity'))
            ->zip($request->input('product_id'))
            ->each(function ($row) use ($items) {
                $pid  = data_get($row, '1');
                $size = data_get($row, '0.0');
                $quantity = data_get($row, '0.1');
                if($quantity > 0) {
                    $item = $items->first(fn($f) => $f['product_id'] == $pid && $f['size'] == $size);
                    if($item)
                        $item['quantity'] += $quantity;
                    else {
                        $items->push(new OrderItem([
                            'product_id' => $pid,
                            'size' => $size,
                            'quantity' => (int)$quantity,
                        ]));
                    }
                }
            });

        // 建立訂單明細
        $order = Order::create(array_merge([
            // 訂單編號
            'order_number' => snowflake(),
            // 取得運費
            'delivery_fee' => data_get(config('order'), 'shipping.' . $request->input('deliver') . '.price', 0),
            // 總金額
            'total' => $items->sum(fn ($item) => (int)config('order.products.' . $item['product_id'] . '.price') * $item['quantity']),
        ], $request->only([
            'reuse_self',           // 是否提供自備舊衣改造
            'reuse_self_delivery',  // 自備舊衣寄送方式
            'reuse_self_picture',   // 圖案保留
            'reuse_self_memo',      // 備註
            'name',                 // 收件人姓名
            'phone',                // 收件人手機號碼
            'email',                // 收件人Email
            'address',              // 收件地址
            'deliver',              // 商品配送方式
            'pay_type',             // 付款方式
            'receipt',              // 發票開立
            'corpName',             // 發票抬頭
            'taxIDnumber',          // 統一編號
        ])));

        // 圖檔儲存
        if (!empty($filepath)) {
            $order->file = $filepath;
            $order->save();
        }

        // 加入項目
        $order->items()->saveMany($items);

        // 製作付款網址
        $payurl = $order->getPaymentUrl();

        return response()->json(compact('order', 'payurl'));
    }
}