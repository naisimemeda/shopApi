<?php

namespace App\Http\Controllers;

use App\Models\History;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index(){
        $result = User::info()->history()
            ->where('historytable_type', Product::class)
            ->with(['historytable'])->latest('updated_at')
            ->get();
        //User::whereBetween('created_at', [$start, $end]);
        return $this->setStatusCode(200)->success($result);
    }

    public function delete(History $history){
        $history->delete();
        return $this->setStatusCode(200)->success('成功');
    }
}
