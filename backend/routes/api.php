<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\FavoriteController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('users', [UserController::class, 'index']);


Route::get('comments', [CommentController::class, 'index']);


Route::get('favorites', [FavoriteController::class, 'index']);