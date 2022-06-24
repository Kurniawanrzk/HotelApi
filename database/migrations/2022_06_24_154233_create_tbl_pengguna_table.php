<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblPenggunaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_pengguna', function (Blueprint $table) {
            $table->id("id_pengguna");
            $table->string("nama_depan");
            $table->string("nama_belakang");
            $table->string("email");
            $table->string("phone_number");
            $table->string("password");
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
        Schema::dropIfExists('tbl_pengguna');
    }
}
