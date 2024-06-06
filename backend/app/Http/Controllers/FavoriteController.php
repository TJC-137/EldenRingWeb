<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Favorite;
use Illuminate\Support\Facades\Validator;

class FavoriteController extends Controller
{
    public function store(Request $request)
    {
        $rules = [
            'user_id' => 'required|exists:users,id',
            'category' => 'required|string',
            'itemId' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()->all()], 400);
        }

        try {
            $existingFavorite = Favorite::where('user_id', $request->user_id)
                                        ->where('itemId', $request->itemId)
                                        ->first();

            if ($existingFavorite) {
                return response()->json(['status' => 'error', 'message' => 'Favorite already exists'], 400);
            }

            $favorite = Favorite::create($request->all());
            return response()->json(['status' => 'success', 'data' => $favorite], 201);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error al añadir favorito'], 500);
        }
    }

    public function getFavoritesByUser($userId)
    {
        try {
            $favorites = Favorite::where('user_id', $userId)->get();
            return response()->json(['status' => 'success', 'data' => $favorites], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error fetching favorites'], 400);
        }
    }

    public function destroy(string $id)
    {
        try {
            $favorite = Favorite::findOrFail($id);
            $favorite->delete();
            return response()->json(['status' => 'success', 'message' => 'Favorite deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Error deleting favorite'], 500);
        }
    }
}
?>
