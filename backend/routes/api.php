<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\FavoriteController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'users'], function () {
    Route::get('', [UserController::class, 'index']);
    Route::post('', [UserController::class, 'store']);
    Route::get('{id}', [UserController::class, 'show']);
    Route::delete('{id}', [UserController::class, 'destroy']);
    Route::put('{id}', [UserController::class, 'updateName']);
    Route::put('email/{id}', [UserController::class, 'updateEmail']);
    Route::put('password/{id}', [UserController::class, 'updatePassword']);
    Route::post('login', [UserController::class, 'login']);
    Route::post('img/{id}', [UserController::class, 'updateImg']);
});

    
Route::get('users', [UserController::class, 'index']);

Route::group(['prefix' => 'comments'], function () {
    Route::get('', [CommentController::class, 'index']);
    Route::post('', [CommentController::class, 'store']);
    Route::get('{id}', [CommentController::class, 'show']);
    Route::get('item/{itemId}', [CommentController::class, 'showCommentsForItem']);

});


Route::group(['prefix' => 'favorites'], function () {
    Route::get('', [FavoriteController::class, 'index']); // Obtener todos los favoritos
    Route::post('', [FavoriteController::class, 'store']); // Crear un nuevo favorito
    Route::get('{id}', [FavoriteController::class, 'show']); // Mostrar un favorito específico
    Route::put('{id}', [FavoriteController::class, 'update']); // Actualizar un favorito específico
    Route::delete('{id}', [FavoriteController::class, 'destroy']);
    Route::get('user/{userId}', [FavoriteController::class, 'getFavoritesByUser']); // Obtener favoritos por usuario
});




?>