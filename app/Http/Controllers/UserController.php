<?php

namespace App\Http\Controllers;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function store(UserRequest $request){
        User::query()->create($request->all());
        $token = Auth::guard('api')->attempt(['name'=>$request->name,'password'=>$request->password]);
        if($token) {
            return $this->setStatusCode(201)->success([
                'name' => $request->name,
                'token' => 'bearer ' . $token
            ]);
        }
        return $this->failed('注册失败',400);
    }
    public function login(Request $request){
        $token = Auth::guard('api')->attempt([
            'email'=>$request->input('email'),
            'password'=>$request->input('password')
        ]);
        if($token) {
            return $this->setStatusCode(201)->success(['token' => 'bearer ' . $token]);
        }
    }

    public function logout(){
        return $this->success(Auth::guard('api')->logout());
    }
    public function info(){
        return $this->success(Auth::guard('api')->user());
    }
}