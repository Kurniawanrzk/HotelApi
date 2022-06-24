<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{AuthController,PenggunaController};
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix("pengguna")->group(function(){
    // Setiap Pengguna Login, Token Akan Mengenerate Token Baru
    Route::post("auth",[AuthController::class,"pengguna_login"]);
    // Setiap Pengguna Logoute, Token Akan Terhapus
    Route::get("unauth",[AuthController::class,"pengguna_logout"]);
        Route::middleware("TokenAuth")->group(function(){
            // Return Semua Kota
            Route::get("kota",[PenggunaController::class,"index_kota"]);    
            // Return Semua kamar Hotel
            Route::get("kamar_hotel",[PenggunaController::class,"index_kamar_hotel"]);
            // Return Semua Hotel Berdasarkan Kota
            Route::get("kamar_hotel_kota/{id}",[PenggunaController::class,"index_kamar_hotel_kota"]);
            // Return Semua Hotel Dengan Harga Di Bawah 150 Ribu
            Route::get("kamar_hotel/murah",[PenggunaController::class,"index_kamar_hotel_murah"]);
            // Post Reservasi Kamar / Booking
            Route::post("booking/store",[PenggunaController::class,"store_booking"]);
            // Return Riwayat Booking by id
            Route::get("booking/{id}",[PenggunaController::class,"index_riwayat_booking"]);
        });
});

Route::prefix("pemilik")->group(function(){
    Route::post("auth",[AuthController::class,"pemilik_login"]);
    Route::get("unauth",[AuthController::class,"pemilik_logout"]);
    });
    
