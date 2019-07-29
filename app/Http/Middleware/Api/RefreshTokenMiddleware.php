<?php

namespace App\Http\Middleware\Api;

use App\Exceptions\InvalidRequestException;
use Auth;
use Closure;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;

class RefreshTokenMiddleware extends BaseMiddleware
{
    public function handle($request, Closure $next)
    {
        return $next($request);
//            $this->checkForToken($request);
//        try {
//            // 检测用户的登录状态，如果正常则通过
//            if ($this->auth->parseToken()->authenticate()) {
//                return $next($request);
//            }
//            throw new UnauthorizedHttpException('jwt-auth', '未登录');
//        }catch (TokenExpiredException $exception){
//           throw new UnauthorizedHttpException('jwt-auth', $exception->getMessage());
//        }
    }
}