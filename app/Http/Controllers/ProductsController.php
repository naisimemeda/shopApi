<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index(){
        $product = Product::query()->where('on_sale', true)->paginate();
        return $this->setStatusCode(201)->success($product);
    }
}
