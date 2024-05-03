<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostCreateRequest;
use App\Http\Resources\Api\PostResource;
use App\Services\PostService;
use Illuminate\Http\JsonResponse;
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

        return response()->json([
            'message' => 'Failed to create post'
        ], 422);
    }
}
