<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddCartRequest;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\ProductSku;
use App\Models\User;
use App\Services\CartService;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartService;
    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function index(){
        return $this->setStatusCode(200)->success($this->cartService->get());
    }

    public function add(AddCartRequest $request){
        $this->cartService->add($request->input('sku_id'), $request->input('amount'));
        return $this->setStatusCode(200)->success('成功');
    }

    public function remove(ProductSku $sku){
        $this->cartService->remove($sku->id);
        return $this->setStatusCode(200)->success('成功');
    }
}
