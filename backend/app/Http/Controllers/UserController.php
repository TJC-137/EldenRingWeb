<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try{           
            $users = User::all();
            return response()->json(['status' => 'succes','data' => $users], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error de búsqueda de usuarios'], 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'email' => ['required', 'email', 'unique:users,email'],
            'password' => 'required'
        ];

        $messages = [
            'name.required' => 'El nombre es obligatorio',
            'email.required' => 'El correo es obligatorio',
            'email.email' => 'El correo no es valido',
            'email.unique' => 'El correo ya existe',
            'password.required' => 'La contrasenya es obligatoria',
        ];
        
        $validation = Validator::make($request->all(), $rules, $messages);
        if ($validation->fails()) {
            // Convertir los errores a un array de strings
            $errorMessages = [];
            foreach ($validation->errors()->all() as $error) {
                $errorMessages[] = $error;
            }
            return response()->json(['status' => 'error', 'message' => $errorMessages], 400);
            
        } else {

            $api_key=base64_encode(Str::random(40));
            
            $data = $request->all();
            $data['token'] = $api_key;
            $data['password'] = Hash::make($data['password']);
            $data['url'] = 'http://127.0.0.1:8000/upload/img/avatar.png';


            $tupla=User::create($data);

            return response()->json(['status' => 'success', 'data' => $tupla->token], 200);
        }

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $tupla = User::findOrFail($id);
            return response()->json(['status' => 'success', 'data' => $tupla], 200);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['status' => 'error', 'message' => 'Usuario no encontrado'], 400);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
