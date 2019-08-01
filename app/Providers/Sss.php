<?php


namespace App\Providers;


use App\Http\Controllers\Controller;
use App\Models\Order;

class Sss extends Controller
{
    protected $order;
    public function __construct(Order $order){
        $this->order = $order;
    }
    public function web(){
        return $this->order;
    }
}