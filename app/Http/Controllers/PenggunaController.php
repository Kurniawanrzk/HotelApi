<?php

namespace App\Http\Controllers;
use App\Models\{Pengguna,PemilikHotel,Kamar,Booking,Kota};
use Illuminate\Support\Facades\{Hash,Validator};
use Str;
use Illuminate\Http\Request;

class PenggunaController extends Controller
{
    
    public function index_kota()
    {
        $data = Kota::all();
        return response()->json([
            "status"=>true,
            "data"=>$data,
        ],200);
    }

    public function index_kamar_hotel()
    {
        $data = Kamar::all();
        return response()->json([
            "status"=>true,
            "data"=>$data,
        ],200);
    }


    public function index_kamar_hotel_kota($id)
    {
        $pemilik_hotel= PemilikHotel::where("id_kota",$id)->get();
        $id = [];
           foreach($pemilik_hotel as $item){
            $id[] = $item->id_pemilik_hotel;
           }
           $kamar = [];
           foreach($id as $item){
            $kamar[] =  Kamar::where("id_pemilik_hotel",$item)->get();
           }
           return response()->json([
            "status"=>true,
            "data"=>$kamar,
           ]);
    }
    
    public function index_kamar_hotel_murah()
    {
        $data = Kamar::where("harga_per_kamar","<",150.000)->get();
        return response()->json([
            "status"=>true,
            "data"=>$data
        ]);
    }

    public function store_booking(Request $request)
    {   
        $validator = Validator::make($request->all(),[
            "id_kamar"=>"required",
            "id_pengguna"=>"required",
            "status"=>"required",
            "tanggal_checkin"=>"required",
            "tanggal_checkout"=>"required",
        ]);

        if($validator->fails()){
            return response()->json([
                "status"=>false,
                "message"=>"Gagal Booking Kamar Baru"
            ]);
        }
        
        $booking = New Booking;
        $store_booking = $booking
        ->create($request->all())
        ->save();
        return response()->json([
            "status"=>true,
            "message"=>"Berhasil Booking kamar"
        ]);
        
        if(!$store_booking){
            return response()->json([
                "status"=>false,
                "message"=>"Gagal Booking Kamar Baru"
            ]); 
        }
    }

    public function index_riwayat_booking($id)
    {
        $data = Booking::where("id_pengguna",$id)->get();
        return response()->json([
            "status"=>true,
            "data"=>$data
        ]);

    }

}
