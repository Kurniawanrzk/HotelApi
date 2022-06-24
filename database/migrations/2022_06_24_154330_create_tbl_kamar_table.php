<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblKamarTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_kamar', function (Blueprint $table) {
            $table->id("id_kamar");
            $table->unsignedBigInteger("id_pemilik_hotel");
            $table->string("nama_kamar");
            $table->decimal("harga_per_kamar",9,3);
            $table->mediumInteger("jumlah_kamar");
            $table->string("gambar");
            $table->string("deskripsi");
            $table->string("fasilitas");
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
        Schema::dropIfExists('tbl_kamar');
    }
}
