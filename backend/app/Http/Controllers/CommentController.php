<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Facades\Validator;

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
        $rules = [
            'comment' => 'required|string',
            'itemId' => 'required|string',
            'user_id' => 'required|exists:users,id'
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()->all()], 400);
        }

        $comment = Comment::create($request->all());

        return response()->json(['status' => 'success', 'data' => $comment], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $comment = Comment::findOrFail($id);
            return response()->json(['status' => 'success', 'data' => $comment], 200);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json(['status' => 'error', 'message' => 'Comment not found'], 404);
        }
    }

    /**
     * Display comments for a specific item.
     */
    public function showCommentsForItem(string $itemId)
    {
        try {
            $comments = Comment::where('itemId', $itemId)->get();
            return response()->json(['status' => 'success', 'data' => $comments], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error retrieving comments for the item'], 400);
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
