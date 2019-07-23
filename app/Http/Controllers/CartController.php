<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\ProductSku;
use App\Models\User;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index(){
        $user = User::info();
        return $this->setStatusCode(200)->success($user->cartItems()->with(['productSku.product'])->get());
    }

    public function add(AddCartRequest $request){
        $user = User::info();
        $skuId  = $request->input('sku_id');
        $amount = $request->input('amount');
        if ($cart = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
            $cart->update([
               'amount' =>  $cart->amount + $amount,
            ]);
        }else{
            $cart = new CartItem(['amount' => $amount]);
            $cart->user()->associate($user);
            $cart->productSku()->associate($skuId);
            $cart->save();
        }
        return $this->setStatusCode(200)->success('成功');
    }

    public function remove(ProductSku $sku){
        User::info()->cartItems()->where('product_sku_id', $sku->id)->delete();
        return $this->setStatusCode(200)->success('成功');
    }
}
