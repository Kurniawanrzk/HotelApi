<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class PemilikHotel extends Authenticatable
{
    use HasFactory;
    protected $guarded = [];
    protected $table = "tbl_pemilik_hotel";
    protected $primaryKey = "id_pemilik_hotel";
    protected $fillable = [
        "nama_pemilik_hotel",
        "email",
        "id_kota",
        "password",
        "api_token",
    ];
    protected $hidden = [
        "password",
        "api_token"
    ];
}
