<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(){
        $result = User::info()->history()
            ->where('historytable_type', 'App\Models\Product')
            ->with(['historytable'])->latest('updated_at')
            ->get();
        return $this->setStatusCode(200)->success($result);
    }
}
