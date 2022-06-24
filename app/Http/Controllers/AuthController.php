<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\{Pengguna,PemilikHotel};
use Illuminate\Support\Facades\{Auth,Hash,Validator};
use Str;
class AuthController extends Controller
{
    // Pengguna Auth
    public function pengguna_login(Request $request)
    {
        $validator = Validator::make($request->all(),[
            "email"=>"required",
            "password"=>"required"
        ]);

        if($validator->fails()){
            return response()->json([
                "status"=>false,
                "message"=>"gagal login"
            ],422);
        }

        if(
            Auth::guard("pengguna")
            ->attempt([
                "email"=>$request->email,
                "password"=>$request->password,
            ])){
                $token = Str::random(60);
                $pengguna = Auth::guard("pengguna")->user();
                $pengguna->forceFill([
                    "api_token"=>bcrypt($token)
                ])->save();
                return response()->json([
                    "status"=>true,
                    "message"=>"login_berhasil",
                    "pengguna"=>$pengguna,
                    "token"=>$token,
                ],200);
            }else{
                return response()->json([
                    "status"=>false,
                    "message"=>"login gagal",
                ],400);
            }
    }

    public function pengguna_logout(Request $request)
    {
        $token = $request->bearerToken();
        $email_pengguna = Pengguna::where("email",$request->email)->first();
        if(Hash::check($token, $email_pengguna->api_token)){
            $email_pengguna->forceFill([
                "api_token"=>NULL
            ])->save();
            return response()->json([
                "status"=>true,
                "message"=>"logout berhasil"
            ],200);
        }
        return response()->json([
            "status"=>false,
            "message"=>"logout gagal"
        ],400);
    }
    // Pengguna Auth

    // Pemilik Hotel Auth
    public function pemilik_login(Request $request)
    {
        $validator = Validator::make($request->all(),[
            "email"=>"required",
            "password"=>"required"
        ]);

        if($validator->fails()){
            return response()->json([
                "status"=>false,
                "message"=>"gagal login"
            ],422);
        }

        if(
            Auth::guard("pemilik")
            ->attempt([
                "email"=>$request->email,
                "password"=>$request->password,
            ])){
                $token = Str::random(60);
                $pemilik = Auth::guard("pemilik")->user();
                $pemilik->forceFill([
                    "api_token"=>bcrypt($token)
                ])->save();
                return response()->json([
                    "status"=>true,
                    "message"=>"login_berhasil",
                    "pengguna"=>$pemilik,
                    "token"=>$token,
                ],200);
            }else{
                return response()->json([
                    "status"=>false,
                    "message"=>"login gagal",
                ],400);
            }
    }

    public function pemilik_logout(Request $request)
    {
        $token = $request->bearerToken();
        $email_pemilik = PemilikHotel::where("email",$request->email)->first();
        if(Hash::check($token, $email_pemilik->api_token)){
            $email_pemilik->forceFill([
                "api_token"=>NULL
            ])->save();
            return response()->json([
                "status"=>true,
                "message"=>"logout berhasil"
            ],200);
        }
        return response()->json([
            "status"=>false,
            "message"=>"logout gagal"
        ],400);
    }
    // Pemilik Hotel Auth
}
