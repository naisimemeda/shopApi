<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\User;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function add(AddCartRequest $request){
        $user = User::info();
        $skuId  = $request->input('sku_id');
        $amount = $request->input('amount');
        $a = $user->cartItems()->get();
        if ($cart = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
            $cart->update([
               'amount' =>  $cart->amount + $amount,
            ]);
        }else{
            $cart = New CartItem;
            $cart->user()->associate($user);
            $cart->productSku()->associate($skuId);
            $cart->save();
        }
        return $this->setStatusCode(201)->success('成功');
    }
}
