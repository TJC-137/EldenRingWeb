<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Comment;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try{           
            $comments = Comment::all();
            return response()->json(['status' => 'succes','data' => $comments], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error de búsqueda de comentarios'], 400);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
