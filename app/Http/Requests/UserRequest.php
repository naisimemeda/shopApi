<?php

namespace App\Http\Requests;

class UserRequest extends Request
{
    public function rules()
    {

        switch ($this->method()) {
            case 'GET':
                {
                    return [
                        'id' => ['required,exists:shop_user,id']
                    ];
                }
            case 'POST':
                {
                    return [
                        'email' => ['required',  'unique:users,email'],
                        'name' => ['required', 'max:12'],
                        'password' => ['required', 'max:16', 'min:6']
                    ];
                }
            case 'PUT':
            case 'PATCH':
            case 'DELETE':
            default:
                {
                    return [

                    ];
                }
        }
    }

    public function messages()
    {
        return [
            'id.required'=>'用户ID必须填写',
            'id.exists'=>'用户不存在',
            'email.unique' => '用户名已经存在',
            'password.required' => '密码不能为空',
            'password.max' => '密码长度不能超过16个字符',
            'name.max' => '名字不能超过12个字符',
            'password.min' => '密码长度不能小于6个字符'
        ];
    }
}