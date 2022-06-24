<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Pengguna extends Authenticatable
{
    use HasFactory;
    protected $guarded = [];
    protected $table = "tbl_pengguna";
    protected $primaryKey = "id_pengguna";
    protected $fillable = [
        "nama_depan",
        "nama_belakang",
        "email",
        "phone_number",
        "password",
        "api_token",
    ];
    protected $hidden = [
        "password",
        "api_token"
    ];
}
