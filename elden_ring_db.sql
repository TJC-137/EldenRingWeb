-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2024 a las 23:45:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `elden_ring_db`
--
CREATE DATABASE IF NOT EXISTS `elden_ring_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `elden_ring_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itemId` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `itemId`, `comment`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '17f69d424cel0i1z0mj267csnydppy', 'try fingers but hole', 1, '2024-06-06 16:32:56', '2024-06-06 16:32:56'),
(2, '17f699a9d79l0i2olzmep3owqdj2z6', 'I swear if the dlc takes place after the main events of the game AND we get to see her again, then that could be insane. Like seriously, she didn\'t show up as much as I thought she would throughout the game, barely showing up in Liurnia, not showing up at all in Caelid (as far as I\'m aware), and then showing up at basically every other grace site in Altus & Leyndell. I didn\'t mind that last part, but I feel like they didn\'t do her that much justice for most of the game, especially since a lot of her dialogue is pretty cryptic...hell the game even implies that she could be a daughter to Marika, which basically already means that she could be a demigod but I\'m leaning towards more to Empyrean. She and Ranni are basically the \"Main Girls\" of the game, and yet even though Melina\'s \'quest\' is apart of the main story and Ranni\'s is optional, Ranni felt more of a important character than her. Even some of the other supporting female characters (and male characters) like Roderika or Fia are more popular (not saying Melina ISN\'T popular regardless).\n\nI feel like if she would come back in the dlc (if you ended up taking frenzy instead of her) she could be a boss, and *really* hard one, like Malenia & Mogh hard. Though that\'s only possible if the story of the dlc is affected by which ending you pick in the main game, since the only way this is possible is if we chose the Lord of Frenzy ending (AKA the bad end). They can expand her lore, confirming (or de-confirming) theories like if she\'s related to Marika, or if she\'s the Gloam Eyed Queen, and why her other eye is closed and has a mark similar to Ranni\'s (Black Knife Assassin stuff). I\'m even starting to suspect if she\'s actually the *real* main antagonist of the game, since she\'s related to Marika and is trying to follow her footsteps in a way. And considering the bull that Marika pulled off as both her and Radagon, going against the Golden Order, and the whole thing with Gideon; it could imply that Melina is trying to do the same thing with us. We don\'t really know why she wanted to crown us as Elden Lord or burn the Erdtree, but she did this while defying the Golden Order...which is understandable since it\'s a pretty shitty and corrupt system/belief in it\'s own. But still, we don\'t know who she really is, we just know her ambitions, and that she may be related to Marika in some way. It\'s unlikely to happen but it would be awesome if she did come back again, her and Miquella (who feels like a character that has a better chance of showing up then she does).', 1, '2024-06-06 16:37:12', '2024-06-06 16:37:12'),
(3, '17f69a63610l0i1ukyx7xgx6vf0zoa', 'dragon', 1, '2024-06-06 16:37:39', '2024-06-06 16:37:39'),
(4, '17f6974feb9l0i1olnp61dvex8ugut', 'The description as well as the uncanny resemblance, hints at this Greatsword being a reference to Guts\' famous colossal weapon in the acclaimed manga Berserk. It is well known that Kentaro Miura\'s magnum opus was a huge influence on Miyazaki.', 1, '2024-06-06 16:39:32', '2024-06-06 16:39:32'),
(6, '17f69619348l0i1owhkpnh4pq8aju', 'I believe melina was a black knife assassin. The blade of calling is just a holy version of the black knife, and if I remember right (its been a while since i fought morgott) she moves like a black knife assassin. And she uses torrent Also ranni knows torrent because she talks about him a few times with you. ranni also led the black knives which means she probably knew torrents former master (melina). So Melina probably wanted to put her black knife assassin past behind her and became the nice, dagger wielding, maiden we know and love.', 1, '2024-06-06 16:41:48', '2024-06-06 16:41:48'),
(7, '17f699a9d79l0i2olzmep3owqdj2z6', 'I love the frenzied flame ending, it is so tragic', NULL, '2024-06-06 17:10:08', '2024-06-06 17:10:08'),
(8, '17f69d424cel0i1z0mj267csnydppy', 'came to say this', NULL, '2024-06-06 17:10:39', '2024-06-06 17:10:39'),
(9, '17f6974feb9l0i1olnp61dvex8ugut', 'Guts sword', NULL, '2024-06-06 17:19:24', '2024-06-06 17:19:24'),
(10, '17f69de1218l0i2olc1m799deyzbgj', 'Beautiful', 2, '2024-06-06 17:22:17', '2024-06-06 17:22:17'),
(11, '17f699a9d79l0i2olzmep3owqdj2z6', 'I love her', 2, '2024-06-06 17:22:39', '2024-06-06 17:22:39'),
(12, '17f69160ac9l0hynthagycs7dr7gq7', 'This is the rune of death', NULL, '2024-06-06 18:20:28', '2024-06-06 18:20:28'),
(13, '17f69575078l0i1z3hvssftszqfcdc', 'god', NULL, '2024-06-09 09:13:13', '2024-06-09 09:13:13'),
(14, '17f694ef2f2l0i1ohsk3qoao9ds943', 'this is the most annoying albinauric weapon I\'ve suffered', NULL, '2024-06-11 19:29:25', '2024-06-11 19:29:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `itemId` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `favorites`
--

INSERT INTO `favorites` (`id`, `category`, `itemId`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 'Items', '17f69cb5ad0l0i1z0lpxlgghg1a5nd', 1, '2024-06-06 16:19:18', '2024-06-06 16:19:18'),
(10, 'Npcs', '17f699a9d79l0i2olzmep3owqdj2z6', 1, '2024-06-06 16:36:31', '2024-06-06 16:36:31'),
(12, 'Npcs', '17f69de1218l0i2olc1m799deyzbgj', 2, '2024-06-06 17:31:32', '2024-06-06 17:31:32'),
(13, 'Npcs', '17f69f5e08al0i2opgccucgwqfl6n6', 2, '2024-06-06 17:35:59', '2024-06-06 17:35:59'),
(14, 'Talismans', '17f6967fb2dl0i2ste8y2pomb9gcj9', 2, '2024-06-06 17:36:45', '2024-06-06 17:36:45'),
(15, 'Talismans', '17f69bdcd53l0i2ssvjmuvkx73w1bo', 2, '2024-06-06 17:37:07', '2024-06-06 17:37:07'),
(16, 'Talismans', '17f696c4991l0i2szwm52zrw4bgso4', 2, '2024-06-06 17:37:47', '2024-06-06 17:37:47'),
(18, 'Items', '17f69d424cel0i1z0mj267csnydppy', 1, '2024-06-09 09:14:20', '2024-06-09 09:14:20'),
(20, 'Armors', '17f696dc24el0i0ndj4er6v25jkwqd', 1, '2024-06-09 15:20:46', '2024-06-09 15:20:46'),
(21, 'Npcs', '17f69f5e08al0i2opgccucgwqfl6n6', 1, '2024-06-09 15:21:28', '2024-06-09 15:21:28'),
(23, 'Npcs', '17f699a9d79l0i2olzmep3owqdj2z6', 2, '2024-06-12 15:38:20', '2024-06-12 15:38:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2024_05_30_075015_create_personal_access_tokens_table', 1),
(4, '2024_05_30_080248_create_users_table', 1),
(5, '2024_05_30_080301_create_comments_table', 1),
(6, '2024_05_30_080353_create_favorites_table', 1),
(7, '2024_06_06_190713_modify_comments_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `url` varchar(250) NOT NULL DEFAULT 'http://127.0.0.1:8000/upload/img/avatar.png',
  `token` varchar(60) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `url`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Hidetaka Miyazaki', 'god@gmail.com', '$2y$12$IxalOoeWXvKsAdx4aR9yo.V9BqP8onHvSME4GCsyRQ2fU3OyRWW0O', 'http://127.0.0.1:8000/upload/img/img11717950422.png', 'dGNBcTFjanRrNEpVQ0RxdVlvc1BpTDkyTW04d2JhUmJiZGp0VGppUA==', '2024-06-06 14:34:21', '2024-06-09 14:27:02'),
(2, 'Nymeria', 'nymAsh@gmail.com', '$2y$12$jIKd6QhSwkQcgcsTnJlqzO7nLtR2ebu6ZucHlaVFj0hB62CnmQzt2', 'http://127.0.0.1:8000/upload/img/img21717950478.jpg', 'WjR0eFlabGhyaldxdXQwck9FN2dEZDRVbWxsbWFRNUZJdm1BSHR2Ng==', '2024-06-06 17:20:02', '2024-06-12 13:37:34');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_token_unique` (`token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
