<?php

namespace App\Jobs;

use App\Models\Post;
use App\Models\User;
use App\Notifications\NewPost;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendNewPostNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct(
        private Post $post
    ) { }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $notification = new NewPost($this->post);

        User::chunk(100, static function ($users) use ($notification) {
            foreach ($users as $user) {
                if ($user instanceof User) {
                    $user->notify($notification);
                }
            }
        });
    }
}
