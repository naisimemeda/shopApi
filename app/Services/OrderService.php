<?php

namespace App\Services;

use App\Models\CartItem;
use App\Models\OrderItem;
use App\Models\User;
use App\Models\UserAddress;
use App\Models\Order;
use App\Models\ProductSku;
use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;
use Carbon\Carbon;

class OrderService{
    public function store(User $user, UserAddress $address, $remark, $items){
        $order = \DB::transaction(function () use ($user, $address, $remark, $items){
            $address->update(['last_used_at' => Carbon::now()]);
            $order = New Order([
                'address'      => [ // 将地址信息放入订单中
                    'address'       => $address->full_address,
                    'zip'           => $address->zip,
                    'contact_name'  => $address->contact_name,
                    'contact_phone' => $address->contact_phone,
                ],
               'remake' => $remark,
               'total_amount' => 0,
            ]);
            $order->user()->associate($user);
            $order->save();
            $totalAmount = 0;
            foreach ($items as $data){
                $sku   = ProductSku::find($data['sku_id']);
                $item = $order->items()->make([
                    'amount' => $data['amount'],
                    'price'  => $sku->price,
                ]);
                $item->product()->associate($sku->product_id);
                $item->productSku()->associate($sku);
                $item->save();
                $totalAmount += $sku->price * $data['amount'];
                if ($sku->decreaseStock($data['amount']) <= 0) {
                    throw new InvalidRequestException('该商品库存不足');
                }
            }
            $order->update(['total_amount' => $totalAmount]);
            $skuIds = collect($items)->pluck('sku_id');
            app(CartService::class)->remove($skuIds);
        });
        dispatch(new CloseOrder($order, config('app.order_ttl')));
        return $order;
    }
}