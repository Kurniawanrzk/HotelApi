<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Hash;
use App\Models\{Pengguna,PemilikHotel};
class TokenAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $pengguna_email = Pengguna::where("email",$request->email)->first();
        $pemilik_email = PemilikHotel::where("email",$request->email)->first();
        if($pengguna_email && Hash::check($request->bearerToken(), $pengguna_email->api_token)|| $pemilik_email && Hash::check($request->bearerToken(), $pemilik_email->api_token)){
        return $next($request);
        }
        return response()->json([
            "status"=>false,
            "message"=>"forbidden",
        ]);
    }
}
