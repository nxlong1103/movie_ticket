<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Theater extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'location', 'phone'];

    public function screens()
    {
        return $this->hasMany(Screen::class);
    }
}
