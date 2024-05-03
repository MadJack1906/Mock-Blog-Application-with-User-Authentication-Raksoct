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

    /**
     * Updates the email of the user
     *
     * @param User $user
     * @param string $email
     * @return User|false
     */
    public function updateEmail(User $user, string $email) : User | false
    {
        $user->update([
            'email' => $email
        ]);

        if ($user->email === $email) {
            return $user;
        }

        return false;
    }

    /**
     * Updates the password of the user
     *
     * @param User $user
     * @param string $password
     * @return User|bool
     */
    public function updatePassword(User $user, string $password) : User | bool
    {
        $isUpdateSuccess = $user->update([
            'password' => $password
        ]);

        if ($isUpdateSuccess) {
            return $user;
        }

        return false;
    }
}
