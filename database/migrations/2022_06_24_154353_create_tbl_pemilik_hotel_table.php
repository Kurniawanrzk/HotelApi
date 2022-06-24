<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblPemilikHotelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_pemilik_hotel', function (Blueprint $table) {
            $table->id("id_pemilik_hotel");
            $table->string("nama_pemilik");
            $table->string("email");
            $table->string("password");
            $table->unsignedBigInteger("id_kota");
            $table->string("api_token")
            ->nullable()
            ->default(null);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_pemilik_hotel');
    }
}
