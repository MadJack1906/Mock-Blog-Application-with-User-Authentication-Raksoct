<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;

class PostService
{
    public function create(User $user, array $data)
    {
        $title = data_get($data, 'title');
        $content = data_get($data, 'content');

        $post = Post::create([
            'title' => $title,
            'content' => $content,
            'user_id' => $user->id
        ]);

        if ($post?->id !== null) {
            return $post;
        }

        return false;
    }
}
