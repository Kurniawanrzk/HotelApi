<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;
    protected $table = "tbl_booking";
    protected $primaryKey = "id_booking";
    protected $fillable = [
        "id_kamar",
        "id_pengguna",
        "status",
        "tanggal_checkin",
        "tanggal_checkout"
    ];
}
