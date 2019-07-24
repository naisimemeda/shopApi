<?php

namespace App\Services;

use App\Models\User;
use Auth;
use App\Models\CartItem;

class CartService
{
    public function get(){
        return User::info()->cartItems()->with(['productSku.product'])->get();
    }

    public function add($skuId, $amount){
        $user = User::info();
        if ($item = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
            // 如果存在则直接叠加商品数量
            $item->update([
                'amount' => $item->amount + $amount,
            ]);
        } else {
            // 否则创建一个新的购物车记录
            $item = new CartItem(['amount' => $amount]);
            $item->user()->associate($user);
            $item->productSku()->associate($skuId);
            $item->save();
        }

        return $item;
    }
    public function remove($skuIds)
    {
        // 可以传单个 ID，也可以传 ID 数组
        if (!is_array($skuIds)) {
            $skuIds = [$skuIds];
        }
        User::info()->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
    }
}