<?php

namespace App\Http\Responses;

use Illuminate\Http\JsonResponse;

class Response
{

    /**
     * @param array $data
     * @param int $statusCode
     * @return JsonResponse
     */
    public static function success(array $data, int $statusCode = 200): JsonResponse
    {
        return response()
            ->json($data, $statusCode);
    }

    public static function error(array $data, int $statusCode = 400)
    {
        return response()
            ->json($data, $statusCode);
    }

    /**
     * @return JsonResponse
     */
    public static function missingModel(): JsonResponse
    {
        return response()->json([
            'message' => 'Record not found'
        ], 422);
    }
}
