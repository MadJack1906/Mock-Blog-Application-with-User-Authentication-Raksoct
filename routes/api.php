<?php

use App\Http\Controllers\Api\UserController;
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
