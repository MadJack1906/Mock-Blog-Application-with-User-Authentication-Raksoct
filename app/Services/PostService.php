<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;

class PostService
{
    /**
     * @param User $user
     * @param array $data
     * @return Post|false
     */
    public function create(User $user, array $data): false | Post
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

    /**
     * @param Post $post
     * @param array $data
     * @param User $user
     * @return false|Post
     */
    public function update(Post $post, array $data, User $user) : bool|Post
    {
        $title = data_get($data, 'title');
        $content = data_get($data, 'content');

        $status = $post->update([
            'title' => $title,
            'content' => $content,
        ]);


        if ($status) {
            return $post;
        }

        return false;
    }
}
