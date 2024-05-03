<?php

namespace App\Service;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserService
{
    /**
     * Creates the user
     *
     * @param array $data
     * @param bool $isWithToken
     * @return User
     */
    public function createUser(array $data, bool $isWithToken = true): User
    {
        $user = User::create([
            'name' => data_get($data, 'name'),
            'email' => data_get($data, 'email'),
            'password' => Hash::make(data_get($data, 'password')),
        ]);

        if ($isWithToken) {
            $user['bearerToken'] = $user->createToken('bearer-token')->plainTextToken;
        }

        return $user;
    }
}
