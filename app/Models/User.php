<?php

namespace App\Models;

use Illuminate\Auth\AuthManager;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Auth;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }

    public function findForPassport($username)
    {
        filter_var($username, FILTER_VALIDATE_EMAIL) ? $credentials['email'] = $username : $credentials['name'] = $username;
        return self::where($credentials)->first();
    }

    public static function info(){
       return  Auth::guard('api')->user();
    }

    public function addresses(){
        return $this->hasMany(UserAddress::class);
    }

    public function favoriteProducts(){
        return $this->belongsToMany(Product::class, 'user_favorite_products')
            ->withTimestamps()
            ->orderBy('user_favorite_products.created_at', 'desc');
    }

    public function cartItems(){
        return $this->hasMany(CartItem::class);
    }

    public function order(){
        return $this->hasMany(Order::class);
    }

    public function history(){
        return $this->hasMany(History::class);
    }
}
