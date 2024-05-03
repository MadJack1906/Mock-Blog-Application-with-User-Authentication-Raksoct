<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginUserRequest;
use App\Http\Resources\UserLoginResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{

    /**
     * Login Method for the UserController
     *
     * @param LoginUserRequest $request
     * @return UserLoginResource|\Illuminate\Http\JsonResponse
     */
    public function login(LoginUserRequest $request)
    {
        $credentials = $request->validated();

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            $user->tokens()->delete();

            $token = $user->createToken('bearer-token')->plainTextToken;
            $user['bearerToken'] = $token;

            return new UserLoginResource($user);
        }

        return response()->json([
            'message' => 'Invalid login credentials'
        ], 422);
    }

}
