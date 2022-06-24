<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kota extends Model
{
    use HasFactory;
    protected $table = "tbl_kota";
    protected $primaryKey = "id_kota";
    protected $fillable = ["nama_kota"];
}
