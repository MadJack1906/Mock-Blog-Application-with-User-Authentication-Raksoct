-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2024 at 06:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mock_exam_blog_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_03_010821_create_personal_access_tokens_table', 1),
(6, '2024_05_03_024816_create_posts_table', 2),
(9, '2024_05_03_052305_add_softdeletes_in_posts_table', 3),
(10, '2024_05_03_052159_create_post_audit_logs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'bearer-token', '8f7cb2a5fe2eefefb64095a25a52289ddf94036bbb633fec36c0ad954384302b', '[\"*\"]', NULL, NULL, '2024-05-02 17:29:36', '2024-05-02 17:29:36'),
(2, 'App\\Models\\User', 1, 'bearer-token', 'f18a916699cec033b9c90aa86c18ecab00dc22daa7b2d1b0a99ab4dea977242c', '[\"*\"]', NULL, NULL, '2024-05-02 17:30:00', '2024-05-02 17:30:00'),
(4, 'App\\Models\\User', 1, 'bearer-token', '8d02201f8227fce8ad833ec9919106804ed78547a1927fdf3c22d66769765e50', '[\"*\"]', NULL, NULL, '2024-05-02 17:46:09', '2024-05-02 17:46:09'),
(6, 'App\\Models\\User', 1, 'bearer-token', '972c0b0bc64a1acecf65899a21f24b6e1aed04c8bba1fd8dc2b4ea7f2d0288a2', '[\"*\"]', NULL, NULL, '2024-05-02 17:47:59', '2024-05-02 17:47:59'),
(7, 'App\\Models\\User', 2, 'bearer-token', '82414d484f8082527995c9eb4c1a169d44f4bbc4f52f85a9e522bf8f7fa351f2', '[\"*\"]', NULL, NULL, '2024-05-02 18:06:45', '2024-05-02 18:06:45'),
(8, 'App\\Models\\User', 1, 'bearer-token', 'b53b14b22692d968302582697a679499c30a4e6551521b736375be8981ba72b6', '[\"*\"]', '2024-05-02 19:14:00', NULL, '2024-05-02 18:18:43', '2024-05-02 19:14:00'),
(9, 'App\\Models\\User', 1, 'bearer-token', '26288838a5c8b39548cfdc3d4e0cef85a5df68faa677346f427484d36daf491a', '[\"*\"]', NULL, NULL, '2024-05-02 19:14:22', '2024-05-02 19:14:22'),
(10, 'App\\Models\\User', 1, 'bearer-token', 'b8f898207b741acfdcb15d794e63c2c91412c300f2650e906a6857d819b4a44a', '[\"*\"]', '2024-05-02 21:58:49', NULL, '2024-05-02 19:14:29', '2024-05-02 21:58:49'),
(11, 'App\\Models\\User', 2, 'bearer-token', 'ecc7823a057c2aa09b859a934a8b9f9952d0f330de62265d054b246af6ecb91e', '[\"*\"]', '2024-05-02 21:59:55', NULL, '2024-05-02 21:59:07', '2024-05-02 21:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Post Title', 'Post Content Update', 1, '2024-05-02 19:17:53', '2024-05-02 21:57:32', NULL),
(2, 'Post Title', 'Post Content', 1, '2024-05-02 19:29:08', '2024-05-02 19:29:08', NULL),
(3, 'Post Title', 'Post Content', 1, '2024-05-02 19:32:28', '2024-05-02 19:32:28', NULL),
(4, 'Post Title', 'Post Content', 1, '2024-05-02 19:32:44', '2024-05-02 19:32:44', NULL),
(5, 'Post Title', 'Post Content', 1, '2024-05-02 20:28:06', '2024-05-02 20:28:06', NULL),
(6, 'Post Title', 'Post Content', 1, '2024-05-02 20:28:36', '2024-05-02 20:28:36', NULL),
(7, 'Post Title', 'Post Content', 1, '2024-05-02 20:29:11', '2024-05-02 20:29:11', NULL),
(8, 'Post Title', 'Post Content', 1, '2024-05-02 20:30:19', '2024-05-02 20:30:19', NULL),
(9, 'Post Title', 'Post Content', 1, '2024-05-02 20:31:39', '2024-05-02 20:31:39', NULL),
(10, 'Post Title', 'Post Content', 1, '2024-05-02 20:39:11', '2024-05-02 20:39:11', NULL),
(12, 'Post Title Update', 'Post Content Update', 1, '2024-05-02 21:57:46', '2024-05-02 21:58:29', '2024-05-02 21:58:29'),
(13, 'Post Title Update', 'Post Content Update', 1, '2024-05-02 21:58:49', '2024-05-02 21:59:55', '2024-05-02 21:59:55'),
(14, 'Post Title', 'Post Content', 2, '2024-05-02 21:59:45', '2024-05-02 21:59:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_audit_logs`
--

CREATE TABLE `post_audit_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `column` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_audit_logs`
--

INSERT INTO `post_audit_logs` (`id`, `action`, `post_id`, `user_id`, `column`, `before`, `after`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 'update', 1, 1, 'title', 'Post Title Update', 'Post Title', '2024-05-02 21:57:32', '2024-05-02 21:57:32', '2024-05-02 21:57:32'),
(2, 'create', 12, 1, NULL, NULL, NULL, '2024-05-02 21:57:46', '2024-05-02 21:57:46', '2024-05-02 21:57:46'),
(3, 'update', 12, 1, 'content', 'Post Content', 'Post Content Update', '2024-05-02 21:58:02', '2024-05-02 21:58:02', '2024-05-02 21:58:02'),
(4, 'update', 12, 1, 'title', 'Post Title', 'Post Title Update', '2024-05-02 21:58:18', '2024-05-02 21:58:18', '2024-05-02 21:58:18'),
(5, 'delete', 12, 1, NULL, NULL, NULL, '2024-05-02 21:58:29', '2024-05-02 21:58:29', '2024-05-02 21:58:29'),
(6, 'create', 13, 1, NULL, NULL, NULL, '2024-05-02 21:58:49', '2024-05-02 21:58:49', '2024-05-02 21:58:49'),
(7, 'update', 13, 2, 'title', 'Post Title', 'Post Title Update', '2024-05-02 21:59:34', '2024-05-02 21:59:34', '2024-05-02 21:59:34'),
(8, 'update', 13, 2, 'content', 'Post Content', 'Post Content Update', '2024-05-02 21:59:34', '2024-05-02 21:59:34', '2024-05-02 21:59:34'),
(9, 'create', 14, 2, NULL, NULL, NULL, '2024-05-02 21:59:45', '2024-05-02 21:59:45', '2024-05-02 21:59:45'),
(10, 'delete', 13, 2, NULL, NULL, NULL, '2024-05-02 21:59:55', '2024-05-02 21:59:55', '2024-05-02 21:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ob7AwvQtwrGdps4HkjOsS7XvNSVHOiV9LqWFxykw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidndKbDRPUHhka21tSjN3RWdjMktHNFRwSG5PU3BUV3pNbXNzYVF4RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9tb2NrLWV4YW0tYmxvZy1hcGkudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1714698725),
('VpXNmhub6wOx29AjB6PILPlYcjj7QRVSNMzLRnIK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2I2Y3c1dkJDYThMOWRhS0lwNlBSSm5uYVBNdnI2UzNDaXY3TXVBNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9tb2NrLWV4YW0tYmxvZy1hcGkudGVzdC9tYWlsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1714710723);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john_doe_mock_2024_update@mailinator.com', NULL, '$2y$12$0PLArioC40HvJDfJ03TpveVEQHv9RQBhVs5xn1wehFxyFJ0TqMvZe', NULL, '2024-05-02 17:29:33', '2024-05-02 19:14:01'),
(2, 'Alice Smith', 'alice_smith_blog_2024@mailinator.com', NULL, '$2y$12$vp7oaW2Homnycm9mr1FiLeJxQOTK6hu9fsNO95X0PnO3FrioYu71K', NULL, '2024-05-02 18:06:45', '2024-05-02 18:06:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `post_audit_logs`
--
ALTER TABLE `post_audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_audit_logs_post_id_foreign` (`post_id`),
  ADD KEY `post_audit_logs_user_id_foreign` (`user_id`),
  ADD KEY `action` (`action`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post_audit_logs`
--
ALTER TABLE `post_audit_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `post_audit_logs`
--
ALTER TABLE `post_audit_logs`
  ADD CONSTRAINT `post_audit_logs_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
