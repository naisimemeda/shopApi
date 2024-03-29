<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    protected $fillable = [
        'user_id', 'created_at', 'updated_at'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function historytable()
    {
        return $this->morphTo();
    }
}
