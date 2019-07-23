<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserAddressesController extends Controller
{
    public function index(){
        $user = Auth::guard('api')->user()->addresses;
        return $this->setStatusCode(201)->success($user);
    }
}
