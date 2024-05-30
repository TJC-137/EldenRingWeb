<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class User extends Model
{

    protected $fillable = ['name', 'email', 'password'];
    protected $hidden = ['password'];
    protected $with = ['comments', 'favorites'];

    use HasFactory;

    public function comments(): HasMany{
        return $this->hasMany(Comment::class);
    }

    public function favorites(): HasMany{
        return $this->hasMany(Favorite::class);
    }
}
