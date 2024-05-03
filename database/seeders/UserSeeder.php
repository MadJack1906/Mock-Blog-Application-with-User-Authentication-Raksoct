<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = [
            'name' => 'John Doe',
            'email' => 'john_doe_mock_2024@mailinator.com',
            'password' => Hash::make('qweqwe123'),
        ];

        User::create($user);;
    }
}
