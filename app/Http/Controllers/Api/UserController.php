<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginUserRequest;
use App\Http\Requests\Api\UserRegisterRequest;
use App\Http\Requests\Api\UserUpdateEmailRequest;
use App\Http\Requests\Api\UserUpdatePasswordRequest;
use App\Http\Resources\Api\UserLoginResource;
use App\Http\Resources\Api\UserResource;
use App\Http\Responses\Response;
use App\Services\UserService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{

    public function __construct(
        private UserService $service
    ) {}

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

            $token = $user->createToken('bearer-token')->plainTextToken;
            $user['bearerToken'] = $token;

            return new UserLoginResource($user);
        }

        return Response::error([
            'message' => 'Invalid login credentials'
        ], 422);
    }

    /**
     * User logout controller method
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|void
     */
    public function logout()
    {
        $user = Auth::user();

        if ($user->currentAccessToken()->delete()) {
            return Response::success([
                'message' => 'Logout Succes'
            ]);
        }

        return Response::error([
            'message' => 'Failed to logout'
        ], 422);
    }

    /**
     * User signup controller method
     *
     * @param UserRegisterRequest $request
     * @return JsonResponse|UserLoginResource
     */
    public function register(UserRegisterRequest $request) : JsonResponse | UserLoginResource
    {
        $input = $request->validated();

        $user = $this->service->createUser($input);

        if ($user?->id !== null) {
            return new UserLoginResource($user);
        }

        return Response::error([
            'message' => 'Failed to signup the user'
        ], 422);
    }

    /**
     * Method to update the user information
     *
     * @param UserUpdateEmailRequest $request
     * @return UserResource|JsonResponse
     */
    public function updateEmail(UserUpdateEmailRequest $request) : UserResource | JsonResponse
    {
        $email = $request->validated('email');

        $user = $this->service->updateEmail(Auth::user(), $email);

        if ($user) {
            return new UserResource($user);
        }

        return Response::error([
            'message' => "Failed to update the user's email"
        ], 422);
    }

    /**
     * Updates the password of the user
     *
     * @param UserUpdatePasswordRequest $request
     * @return JsonResponse
     */
    public function updatePassword(UserUpdatePasswordRequest $request) : JsonResponse
    {
        $data = $request->validated('new_password');

        $user = $this->service->updatePassword(Auth::user(), $data);

        if ($user) {
            return Response::success([
                'message' => "Password Updated Successfully"
            ]);
        }

        return Response::error([
            'message' => "Failed to update the password"
        ], 422);
    }
}
