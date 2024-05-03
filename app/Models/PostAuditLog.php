<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PostAuditLog extends Model
{
    use HasFactory;

    public const ACTION_CREATE = 'create';
    public const ACTION_UPDATE = 'update';
    public const ACTION_DELETE = 'delete';

    protected $fillable = [
        'action',
        'post_id',
        'user_id',
        'column',
        'before',
        'after',
        'timestamp',
    ];

    /**
     * @return BelongsTo
     */
    public function user() : BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function post() : BelongsTo
    {
        return $this->belongsTo(Post::class);
    }
}
