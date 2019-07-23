<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserAddressRequest;
use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserAddressesController extends Controller
{
    public function index(){
        $user = User::info()->addresses;
        return $this->setStatusCode(200)->success($user);
    }

    public function store(UserAddressRequest  $request){
        User::info()->addresses()->create($request->only([
            'province', 'city', 'district','address',
            'zip', 'contact_name', 'contact_phone',
        ]));
        return $this->setStatusCode(200)->success('成功');
    }
    public function edit(UserAddress $user_address)
    {
        $this->authorize('own', $user_address);
        return $this->setStatusCode(200)->success($user_address);
    }
    public function update(UserAddress $user_address, UserAddressRequest $request){
        $this->authorize('own', $user_address);
        $user_address->update($request->only([
            'province', 'city', 'district','address',
            'zip', 'contact_name', 'contact_phone',
        ]));
        return $this->setStatusCode(200)->success('成功');
    }

    public function destroy(UserAddress $user_address){
        $this->authorize('own', $user_address);
        $user_address->delete();
        return $this->setStatusCode(200)->success('成功');
    }
}
