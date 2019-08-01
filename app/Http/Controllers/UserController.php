<?php

namespace App\Http\Controllers;
use App\Http\Requests\UserRequest;
use App\Models\User;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Zend\Diactoros\Response as Psr7Response;
use League\OAuth2\Server\AuthorizationServer;
use League\OAuth2\Server\Exception\OAuthServerException;
use League\OAuth2\Server\RequestTypes\AuthorizationRequest;
use Psr\Http\Message\ServerRequestInterface;

class UserController extends Controller
{
    public function store(UserRequest $request){
        User::query()->create($request->all());
        $token = Auth::guard('api')->attempt(['name'=> $request->input('name'),'password'=>$request->password]);
        if($token) {
            return $this->setStatusCode(201)->success([ 
                'name' => $request->name,
                'token' => 'bearer ' . $token
            ]);
        }
        return $this->failed('注册失败',400);
    }

    public function login(AuthorizationRequest $originRequest, AuthorizationServer $server, ServerRequestInterface $serverRequest)
    {
        try {
            return $a = $server->respondToAccessTokenRequest($serverRequest, new Psr7Response);
        } catch(OAuthServerException $e) {
            return $this->success($e->getMessage());
        }
    }

    public function update(AuthorizationServer $server, ServerRequestInterface $serverRequest)
    {
        try {
            return $server->respondToAccessTokenRequest($serverRequest, new Psr7Response);
        } catch(OAuthServerException $e) {
            return $this->success($e->getMessage());
        }
    }

    public function logout(AuthManager $auth){
        return $this->success($auth->guard('api')->user()->token()->revoke());
    }
    public function info(AuthManager $auth){
        return $this->success($auth->guard('api')->user());
    }
}