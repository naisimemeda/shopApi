<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Product extends Model
{
    protected $fillable = [
        'title', 'description', 'image', 'on_sale',
        'rating', 'sold_count', 'review_count', 'price', 'type',
    ];
    protected $casts = [
        'on_sale' => 'boolean', // on_sale 是一个布尔类型的字段
    ];

    protected $appends = ['image_url'];

    const TYPE_NORMAL = 'normal';
    const TYPE_CROWDFUNDING = 'crowdfunding';

    public static $typeMap = [
        self::TYPE_NORMAL  => '普通商品',
        self::TYPE_CROWDFUNDING => '众筹商品',
    ];

    public function Skus(){
        return $this->hasMany(ProductSku::class);
    }

    public function getImageUrlAttribute(){
        if (Str::startsWith($this->attributes['image'], ['http://', 'https://'])) {
            return $this->attributes['image'];
        }
        return \Storage::disk('public')->url($this->attributes['image']);
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function crowdfunding() {
        return $this->hasOne(CrowdfundingProduct::class);
    }

    public function history()
    {
        return $this->morphMany(History::class, 'historytable');
    }
}
