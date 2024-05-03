<?php

use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\Api\UserController;
use App\Http\Responses\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['prefix' => 'users'], function () {
    Route::post('/login', [UserController::class, 'login'])->name('api.users.login');
    Route::post('/register', [UserController::class, 'register'])->name('api.users.register');

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/logout', [UserController::class, 'logout'])->name('api.users.logout');
        Route::put('/update/email', [UserController::class, 'updateEmail'])->name('api.users.update.email');
        Route::put('/update/password', [UserController::class, 'updatePassword'])->name('api.users.update.password');
    });
});

Route::group(['prefix' => 'posts'], function () {
    Route::get('/', [PostController::class, 'allPosts'])->name('api.posts.all-posts');
    Route::get('/{post}', [PostController::class, 'getPost'])->name('api.posts.get')->missing(fn() => Response::missingModel());

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('/create', [PostController::class, 'create'])->name('api.posts.create');
        Route::delete('/{post}/delete', [PostController::class, 'delete'])->name('api.posts.delete')->missing(fn() => Response::missingModel());
        Route::put('/{post}/update', [PostController::class, 'updatePost'])->name('api.posts.update')->missing(fn() => Response::missingModel());
    });
});
