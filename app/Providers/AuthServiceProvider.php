<?php

namespace App\Providers;

use Carbon\Carbon;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // 使用 Gate::guessPolicyNamesUsing 方法来自定义策略文件的寻找逻辑
        Gate::guessPolicyNamesUsing(function ($class) {
            // class_basename 是 Laravel 提供的一个辅助函数，可以获取类的简短名称
            // 例如传入 \App\Models\User 会返回 User
            return '\\App\\Policies\\'.class_basename($class).'Policy';
        });

        // Passport 的路由
        Passport::routes();
        // access_token 过期时间
        Passport::tokensExpireIn(Carbon::now()->addDays(15));
        // refreshTokens 过期时间
        Passport::refreshTokensExpireIn(Carbon::now()->addDays(30));
    }
}
