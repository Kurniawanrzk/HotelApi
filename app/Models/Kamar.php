<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kamar extends Model
{
    use HasFactory;
    protected $table = "tbl_kamar";
    protected $primaryKey = "id_kamar";
    protected $fillable = [
        "id_pemilik_hotel",
        "nama_kamar",
        "harga_per_kamar",
        "jumlah_kamar",
        "gambar",
        'deskripsi',
        "fasilitas"
    ];
}
