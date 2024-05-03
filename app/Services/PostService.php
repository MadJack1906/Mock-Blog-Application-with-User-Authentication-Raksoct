<?php

namespace App\Services;

use App\Models\Post;
use App\Models\User;

class PostService
{
    public function __construct(
        private PostAuditLogService $logService,
    ) {}

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

        $this->logService->createLog($post, $user);

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
        $prevTitle = $post->title;
        $prevContent = $post->content;

        $title = data_get($data, 'title');
        $content = data_get($data, 'content');

        $status = $post->update([
            'title' => $title,
            'content' => $content,
        ]);

        if ($post->title !== $prevTitle) {
            $this->logService->updateLog($post, $user, 'title', $prevTitle, $title);
        }

        if ($post->content !== $prevContent) {
            $this->logService->updateLog($post, $user, 'content', $prevContent, $content);
        }

        if ($status) {
            return $post;
        }

        return false;
    }

    /**
     * Deletes the post
     *
     * @param Post $post
     * @param User $user
     * @return bool|null
     */
    public function delete(Post $post, User $user): ?bool
    {
        $status = $post->delete();

        $this->logService->deleteLog($post, $user);

        return $status;
    }
}
