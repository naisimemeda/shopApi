<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $fillable = ['amount', 'price', 'rating', 'review', 'reviewed_at'];
    protected $dates = ['reviewed_at'];
    public $timestamps = false;

    public function order(){
        return $this->hasMany(Order::class);
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function productSku(){
        return $this->belongsTo(ProductSku::class);
    }
}
