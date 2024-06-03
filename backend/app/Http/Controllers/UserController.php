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
            $data['url'] = url('http://127.0.0.1:8000/upload/img/avatar.png');


            $tupla=User::create($data);


            return response()->json(['status' => 'success', 'data' => $tupla], 200, [], JSON_UNESCAPED_SLASHES);

        }

    }

    // Login
    public function login(Request $request)
    {
        $user = User::where('email',$request->input('email'))->first();
        if($user && Hash::check($request->input('password'), $user->password)){           
            return response()->json(['status' => 'Login Ok','data' => $user], 200, [], JSON_UNESCAPED_SLASHES);
        } else {
            return response()->json(['status' => 'Wrong data'],401);
        };

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
            return response()->json(['status' => 'error', 'message' => 'User not found'], 400);
        }
    }

    // Update name

    public function updateName(Request $request, string $id)
    {
        $user = User::where('id', $id)->first();
        if ($user) {
            $user->name = $request->input('name');
            $user->save();
            return response()->json(['status' => 'success', 'data' => $user], 200);
        }
    }

    // Update Img
    public function updateImg(Request $request, string $id)
    {
        $mensajes = [
            'foto.mimes' => 'Se requiere jpeg, bmp, o png',
            'foto.max' => 'Excedido el tamaño máximo',
            'foto.required' => 'Falta la foto'
        ];

        $validacion = Validator::make($request->all(), [
            'foto' => 'required|mimes:jpg,jpeg,bmp,png|max:1024'], $mensajes);

            if (!$validacion->fails()) {
                $original_filename = $request->file('foto')->getClientOriginalName();
                $original_filename_arr = explode('.', $original_filename);
                $file_ext = end($original_filename_arr);

                $destination_path = public_path('upload/img/');
                $image = 'img' . $id . '' . time() . '.' . $file_ext;

                $user = User::where('id', $id)->first();

                if ($user) {
                    if ($request->file('foto')->move($destination_path, $image)) {
                    $user->url = url('upload/img/' . $image);
                    $user->save();
                    return response()->json(['status' => 'success', 'data' => $user], 200);
                }}

            } else {
                return response()->json([ 'status' => 'error','message'=>$validacion->errors()->all() ], 400);
            }
    }

    // Update Email
    public function updateEmail(Request $request, string $id)
    {
        $user = User::where('id', $id)->first();
        if ($user) {
            $user->email = $request->input('email');
            $user->save();
            return response()->json(['status' => 'success', 'data' => $user], 200);
        }
    }

    // Update Password
    public function updatePassword(Request $request, string $id)
    {
        $user = User::where('id', $id)->first();
        if ($user) {
            $user->password = Hash::make($request->input('password'));
            $user->save();
            return response()->json(['status' => 'success', 'data' => $user], 200);
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
