<?php

namespace App\Services;

use App\Models\Post;
use App\Models\PostAuditLog;
use App\Models\User;

class PostAuditLogService
{
    /**
     * Log for created post
     *
     * @param Post $post
     * @param User $user
     * @return void
     */
    public function createLog(Post $post, User $user): void
    {
        PostAuditLog::query()->create([
            'action' => PostAuditLog::ACTION_CREATE,
            'post_id' => $post->id,
            'user_id' => $user->id,
            'timestamp' => now()
        ]);
    }

    /**
     * Creates an Update Log
     *
     * @param Post $post
     * @param User $user
     * @param string $column
     * @param string $before
     * @param string $after
     * @return void
     */
    public function updateLog(Post $post, User $user, string $column, string $before, string $after): void
    {
        PostAuditLog::query()->create([
            'action' => PostAuditLog::ACTION_UPDATE,
            'post_id' => $post->id,
            'user_id' => $user->id,
            'column' => $column,
            'before' => $before,
            'after' => $after,
            'timestamp' => now()
        ]);
    }

    /**
     * Creates a Delete Log
     *
     * @param Post $post
     * @param User $user
     * @return void
     */
    public function deleteLog(Post $post, User $user): void
    {
        PostAuditLog::query()->create([
            'action' => PostAuditLog::ACTION_DELETE,
            'post_id' => $post->id,
            'user_id' => $user->id,
            'timestamp' => now()
        ]);
    }
}
