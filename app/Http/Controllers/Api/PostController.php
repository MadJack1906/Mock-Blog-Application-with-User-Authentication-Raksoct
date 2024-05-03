<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\PostCreateRequest;
use App\Http\Resources\Api\PostResource;
use App\Http\Responses\Response;
use App\Models\Post;
use App\Services\PostService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function __construct(
        private PostService $service
    ) {}

    /**
     * Create Post method
     *
     * @param PostCreateRequest $request
     * @return \Illuminate\Http\JsonResponse | PostResource
     */
    public function create(PostCreateRequest $request) : JsonResponse | PostResource
    {
        $data = $request->validated();

        $post = $this->service->create(Auth::user(), $data);

        if ($post) {
            return new PostResource($post);
        }

        return Response::error([
            'message' => 'Failed to create post'
        ], 422);
    }

    /**
     * Getting the post
     *
     * @param Post $post
     * @return PostResource
     */
    public function getPost(Post $post): PostResource
    {
        return new PostResource($post);
    }

    /**
     * Gets all the posts
     *
     * @return AnonymousResourceCollection
     */
    public function allPosts(): AnonymousResourceCollection
    {
        $posts = Post::paginate(10);

        return PostResource::collection($posts);
    }

    public function updatePost()
    {

    }
}
