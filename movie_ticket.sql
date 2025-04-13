-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th4 13, 2025 lúc 05:03 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `movie_ticket`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `link`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Phim Bom Tấn 2025', 'banner1.jpg', 'http://127.0.0.1:8000/home', 1, 1, '2025-03-09 05:51:42', '2025-03-09 05:51:42'),
(2, 'Khuyến Mãi Đặc Biệt', 'banner2.jpg', 'http://127.0.0.1:8000/home', 2, 1, '2025-03-09 05:51:42', '2025-03-09 05:51:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `showtime_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vnpay_payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `vnp_txn_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `movie_id`, `showtime_id`, `total_price`, `created_at`, `updated_at`, `vnpay_payment_status`, `vnp_txn_ref`) VALUES
(1, 2, 2, 1, 218000.00, '2025-03-30 03:11:14', '2025-03-30 03:14:15', 'failed', NULL),
(2, 2, 2, 2, 158000.00, '2025-03-30 03:13:39', '2025-03-30 03:14:15', 'completed', '4301'),
(3, 2, 1, 1, 158000.00, '2025-03-30 03:17:42', '2025-03-30 03:18:22', 'completed', '1271'),
(4, 5, 1, 1, 158000.00, '2025-03-30 03:24:08', '2025-03-30 03:24:43', 'completed', '6683'),
(5, 2, 1, 1, 79000.00, '2025-03-30 05:49:52', '2025-03-30 05:50:00', 'failed', '483');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_details`
--

CREATE TABLE `booking_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `seat_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vnpay_payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vnpay_payment_status` enum('pending','completed','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_details`
--

INSERT INTO `booking_details` (`id`, `booking_id`, `seat_id`, `price`, `created_at`, `updated_at`, `vnpay_payment_id`, `vnpay_payment_status`) VALUES
(1, 1, 167, 109000.00, '2025-03-30 03:11:14', '2025-03-30 03:18:22', NULL, 'failed'),
(2, 1, 168, 109000.00, '2025-03-30 03:11:14', '2025-03-30 03:18:22', NULL, 'failed'),
(3, 2, 175, 79000.00, '2025-03-30 03:13:39', '2025-03-30 03:14:15', NULL, 'completed'),
(4, 2, 176, 79000.00, '2025-03-30 03:13:39', '2025-03-30 03:14:15', NULL, 'completed'),
(5, 3, 105, 79000.00, '2025-03-30 03:17:42', '2025-03-30 03:18:22', NULL, 'completed'),
(6, 3, 106, 79000.00, '2025-03-30 03:17:42', '2025-03-30 03:18:22', NULL, 'completed'),
(7, 4, 117, 79000.00, '2025-03-30 03:24:08', '2025-03-30 03:24:43', NULL, 'completed'),
(8, 4, 118, 79000.00, '2025-03-30 03:24:08', '2025-03-30 03:24:43', NULL, 'completed'),
(9, 5, 184, 79000.00, '2025-03-30 05:49:52', '2025-03-30 05:50:00', NULL, 'failed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `combos`
--

INSERT INTO `combos` (`id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Combo 1 (Bắp + Nước)', 55000, 'combo/combo1.jpg', NULL, NULL),
(2, 'Combo 2 (2 Bắp + 2 Nước)', 99000, 'combo/combo2.jpg', NULL, NULL),
(3, 'Combo Family (3 Bắp + 3 Nước)', 139000, 'combo/combo3.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `jobs`
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
-- Cấu trúc bảng cho bảng `job_batches`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_03_024154_create_movies_table', 1),
(5, '2025_03_03_024830_create_theaters_table', 1),
(6, '2025_03_03_024907_create_screens_table', 1),
(7, '2025_03_03_025024_create_showtimes_table', 1),
(8, '2025_03_03_025312_create_seats_table', 1),
(9, '2025_03_03_025340_create_booking_details_table', 1),
(10, '2025_03_03_025340_create_bookings_table', 1),
(11, '2025_03_03_025341_create_payments_table', 1),
(12, '2025_03_07_014840_create_personal_access_tokens_table', 1),
(13, '2025_03_09_022437_add_role_to_users_table', 1),
(14, '2025_03_09_034014_create_banners_table', 1),
(15, '2025_03_09_035232_add_status_to_movies_table', 1),
(16, '2025_03_03_025340_create_tickets_table', 2),
(17, '2025_03_18_013438_add_google_id_to_users_table', 3),
(18, '2025_03_18_095059_add_movie_id_to_tickets_table', 4),
(19, '2025_03_18_192751_modify_status_column_in_payments_table', 4),
(20, '2025_03_23_061417_create_combos_table', 4),
(21, '2025_03_27_045640_add_momo_columns_to_payments_table', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duration` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `duration`, `release_date`, `rating`, `image`, `trailer_url`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Quỷ Nhập Tràng', 'Lấy cảm hứng từ câu chuyện có thật.', 120, '2025-03-07', 9.8, 'movies/quy_nhap_trang.jpg', 'https://www.youtube.com/watch?v=quynhaptrang', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(2, 'Nhà Gia Tiến', 'Một bộ phim của Huỳnh Lập.', 110, '2025-02-21', 9.8, 'movies/nha_gia_tien.jpg', 'https://www.youtube.com/watch?v=nhagiatien', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(3, 'Lạc Trôi Flow', 'Một bộ phim hoạt hình đề cử Oscars.', 90, '2025-03-07', 7.5, 'movies/lac_troi_flow.jpg', 'https://www.youtube.com/watch?v=lactroiflow', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(4, 'Mobile Suit Gundam: Kỷ Nguyên Mới', 'Gundam trở lại với cuộc chiến mới.', 130, '2025-03-07', 8.5, 'movies/gundam_ky_nguyen_moi.jpg', 'https://www.youtube.com/watch?v=gundamkynguyenmoi', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(5, 'Sát Thủ Vô Cùng Cực Hài', 'Vitamin cười tràn rạp sớm.', 120, '2025-03-14', 8, 'movies/sat_thu_vo_cung_cuc_hai.jpg', 'https://www.youtube.com/watch?v=satthuvocungcuchai', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(6, 'Cưới Ma: Hiến Mẹ Cho Quỷ', 'Kinh dị Indonesia trở lại màn ảnh rộng.', 100, '2025-02-28', 8.5, 'movies/cuoi_ma.jpg', 'https://www.youtube.com/watch?v=cuoima', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(7, 'Emma và Vương Quốc Tí Hon', 'Một cô bé giữa thế giới bao la.', 95, '2025-03-07', 8, 'movies/emma_vuong_quoc_ti_hon.jpg', 'https://www.youtube.com/watch?v=emma', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(8, 'Nụ Hôn Bạc Tỷ', 'Hài hước, tình cảm và cảm động.', 105, '2025-01-29', 8.9, 'movies/nu_hon_bac_ty.jpg', 'https://www.youtube.com/watch?v=nuhonbacty', '2025-03-09 05:49:16', '2025-03-09 05:49:16', 1),
(9, 'Nghi Lễ Trục Quỷ', 'Chuyến trừ tà có thật tại Indonesia.', 120, '2025-03-19', 7.5, 'movies/nghi-le-truc-quy.jpg', 'https://youtu.be/trailer1', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(10, 'Nhà Ga Ma Chó', 'Chuyện nhà ga, chó thả ma bắt.', 110, '2025-03-21', 8, 'movies/nha-ga-ma-cho.jpg', 'https://youtu.be/trailer2', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(11, 'Cô Gái Năm Ấy Chúng Ta Cùng Theo Đuổi', 'Mối tình đầu khó phai.', 100, '2025-03-21', 7.8, 'movies/co-gai-nam-ay.jpg', 'https://youtu.be/trailer3', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(12, 'Yêu Vì Tiền, Điên Vì Tình', 'Một câu chuyện tình yêu đầy rắc rối.', 115, '2025-03-21', 8.2, 'movies/yeu-vi-tien.jpg', 'https://youtu.be/trailer4', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(13, 'Trừ Tà Ký: Khởi Nguyên Hắc Ám', 'Huyết tế lập đàn, quỷ vương giáng thế.', 130, '2025-03-21', 8.5, 'movies/tru-ta-ky.jpg', 'https://youtu.be/trailer5', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(14, 'Nghề Siêu Khó Nói', 'Truyện cổ tích dành cho người lớn.', 105, '2025-03-21', 7.9, 'movies/nghe-sieu-kho-noi.jpg', 'https://youtu.be/trailer6', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(15, 'Thám Tử Sét Đánh', 'Bỗng dưng \"nhận sét\", chuyện gì cũng \"tối tăm\".', 98, '2025-03-21', 7.6, 'movies/tham-tu-set-danh.jpg', 'https://youtu.be/trailer7', '2025-03-18 04:45:39', '2025-03-18 04:45:39', 2),
(16, 'TÌM XÁC: MA KHÔNG ĐẦU', 'Bộ phim tìm xác đầu tiên của điện ảnh Việt, đầy kịch tính và rùng rợn.', 120, '2025-04-18', 10, 'movies/tim-xac-ma-khong-dau.jpg', 'https://youtu.be/trailer_tim_xac', '2025-03-18 04:57:20', '2025-03-18 01:38:40', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vnpay_txn_ref` varchar(255) DEFAULT NULL,
  `vnpay_secure_hash` varchar(255) DEFAULT NULL,
  `vnpay_response_code` varchar(255) DEFAULT NULL,
  `vnpay_order_info` text DEFAULT NULL,
  `vnpay_status` varchar(255) DEFAULT NULL,
  `txn_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `amount`, `status`, `created_at`, `updated_at`, `vnpay_txn_ref`, `vnpay_secure_hash`, `vnpay_response_code`, `vnpay_order_info`, `vnpay_status`, `txn_ref`) VALUES
(31, 2, 158000.00, 'success', '2025-03-30 03:14:15', '2025-03-30 03:14:15', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 3, 158000.00, 'success', '2025-03-30 03:18:22', '2025-03-30 03:18:22', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 4, 158000.00, 'success', '2025-03-30 03:24:43', '2025-03-30 03:24:43', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'Movie-ticket', 'af075bf189f791b1fc56c18c0215c5899a7ee0024e8f066d293f18111cd59002', '[\"*\"]', NULL, NULL, '2025-03-09 23:34:30', '2025-03-09 23:34:30'),
(2, 'App\\Models\\User', 2, 'Movie-ticket', 'c1bbb3e785c620bb87aae00380cdac3b521333aea36d5e4fd2946d483d8b8758', '[\"*\"]', NULL, NULL, '2025-03-11 20:26:19', '2025-03-11 20:26:19'),
(3, 'App\\Models\\User', 2, 'Movie-ticket', '784be8c6a2a8a3d588d4bc2772c817b13b859b27c857cc48e2a6a60e2f7932f0', '[\"*\"]', NULL, NULL, '2025-03-11 20:56:56', '2025-03-11 20:56:56'),
(4, 'App\\Models\\User', 2, 'Movie-ticket', '04c7e335d7f676bf7cc53b1a9a36bfd4ba28ba6e7d15f0c7165c1c8478445a6c', '[\"*\"]', NULL, NULL, '2025-03-11 22:40:25', '2025-03-11 22:40:25'),
(5, 'App\\Models\\User', 2, 'Movie-ticket', 'a163c7cf7e3539fc4318f34d9b9e2a6eb4da5584d05fb3e6a1d7998a10877361', '[\"*\"]', NULL, NULL, '2025-03-11 22:44:12', '2025-03-11 22:44:12'),
(6, 'App\\Models\\User', 2, 'Movie-ticket', '4495648f62862704e040c02ff2d8c39eac386cd5fc2f96b4f88bd5f970753e2f', '[\"*\"]', NULL, NULL, '2025-03-11 22:46:05', '2025-03-11 22:46:05'),
(7, 'App\\Models\\User', 2, 'Movie-ticket', 'b7ff5bf3f4afc7a962023f812cec906ce04eeee865896100dfef11eda8636fca', '[\"*\"]', NULL, NULL, '2025-03-11 22:48:06', '2025-03-11 22:48:06'),
(8, 'App\\Models\\User', 2, 'Movie-ticket', '185d10cc5043772ad1717666bb64dc6be2201cc3fd11c1191058c83f1ddca74b', '[\"*\"]', NULL, NULL, '2025-03-11 23:00:46', '2025-03-11 23:00:46'),
(9, 'App\\Models\\User', 2, 'Movie-ticket', 'd803cfcb48c9e20259a1875b081ecdc4d4c2be414cb41e8b5874b18ac8a1396b', '[\"*\"]', NULL, NULL, '2025-03-11 23:01:18', '2025-03-11 23:01:18'),
(10, 'App\\Models\\User', 2, 'Movie-ticket', '08bc99e7c4df5c7eea41bc0318aa3d3397fbb642397bf944a7d9887100c0d3c9', '[\"*\"]', NULL, NULL, '2025-03-11 23:10:56', '2025-03-11 23:10:56'),
(11, 'App\\Models\\User', 2, 'Movie-ticket', '89db1a71a5380432445547133f81053ed3c770047a84d8b3ed8a7610659dc216', '[\"*\"]', NULL, NULL, '2025-03-11 23:19:46', '2025-03-11 23:19:46'),
(12, 'App\\Models\\User', 2, 'Movie-ticket', 'ba5863e348d28782086cbd4c048dc653f6540441aa5aba7f9798fa0c39610d8b', '[\"*\"]', NULL, NULL, '2025-03-11 23:21:04', '2025-03-11 23:21:04'),
(13, 'App\\Models\\User', 2, 'Movie-ticket', '70a75c5b6e046892586b35998fe92dba8185323d3f2fbb9f40ba0aef5e1ca3f0', '[\"*\"]', NULL, NULL, '2025-03-11 23:21:42', '2025-03-11 23:21:42'),
(14, 'App\\Models\\User', 2, 'Movie-ticket', '517ad7c6a895455908953457e8179ea4bceec01a6c73742577cd858ce9629fed', '[\"*\"]', NULL, NULL, '2025-03-11 23:26:03', '2025-03-11 23:26:03'),
(15, 'App\\Models\\User', 2, 'Movie-ticket', 'f137595bbb6a96e3ddcea3a9040ce5a2908caf5fa9e1bb1360afb4d816b9c625', '[\"*\"]', NULL, NULL, '2025-03-11 23:26:55', '2025-03-11 23:26:55'),
(16, 'App\\Models\\User', 2, 'Movie-ticket', '0ef6c2d9abecbf47e68819f100e6ac1d8872e1349631b1502ccbbf9659f32036', '[\"*\"]', NULL, NULL, '2025-03-11 23:27:33', '2025-03-11 23:27:33'),
(17, 'App\\Models\\User', 2, 'Movie-ticket', 'b827b655ac2b702c29eb3e5b9d0ca9c911a751d1053e87e9430dd9c510bfe819', '[\"*\"]', NULL, NULL, '2025-03-11 23:29:28', '2025-03-11 23:29:28'),
(18, 'App\\Models\\User', 2, 'Movie-ticket', '4d72fae7b22fa91165a1c42dae705d065a69e2cc9ae1f0506e2b16344665b62f', '[\"*\"]', NULL, NULL, '2025-03-11 23:32:04', '2025-03-11 23:32:04'),
(19, 'App\\Models\\User', 2, 'Movie-ticket', '2c06289828b57fc62872777365466b89882e3e50abf27ecf2ce685ff88d3580c', '[\"*\"]', NULL, NULL, '2025-03-11 23:36:27', '2025-03-11 23:36:27'),
(20, 'App\\Models\\User', 2, 'Movie-ticket', 'fae39fafbad94f2ba8fb475d684332526e768b8115d860a28bbdab4b74cc8573', '[\"*\"]', NULL, NULL, '2025-03-11 23:36:43', '2025-03-11 23:36:43'),
(21, 'App\\Models\\User', 2, 'Movie-ticket', '6a5c568dc9b603ff0a09dd43ce7707fbb62a7977ecd200000deb79533d9168ac', '[\"*\"]', NULL, NULL, '2025-03-11 23:38:41', '2025-03-11 23:38:41'),
(22, 'App\\Models\\User', 2, 'Movie-ticket', 'a3fe29a84a61ee5c73949e27bcfd553ff599af1613f8cb0c520fd62d8c9c0361', '[\"*\"]', NULL, NULL, '2025-03-11 23:40:16', '2025-03-11 23:40:16'),
(23, 'App\\Models\\User', 2, 'Movie-ticket', '7cc70c903a87bd450365e428181480a38631a5422a931b92450c135f84813355', '[\"*\"]', NULL, NULL, '2025-03-12 17:47:52', '2025-03-12 17:47:52'),
(24, 'App\\Models\\User', 2, 'Movie-ticket', 'bf40760060ca61c1f98f6bd07a80725d1f85c3d7fa70061f1303a7a58b81b30d', '[\"*\"]', NULL, NULL, '2025-03-12 17:48:48', '2025-03-12 17:48:48'),
(25, 'App\\Models\\User', 2, 'Movie-ticket', '7ad89bed826787058a835c99e6230918cf556d33093435e3059fbf5b05bfa521', '[\"*\"]', NULL, NULL, '2025-03-12 17:54:40', '2025-03-12 17:54:40'),
(26, 'App\\Models\\User', 2, 'Movie-ticket', '3a6e420755931d171d8ccf34e83cdef53307720e1cfedebc83ae3164d549e548', '[\"*\"]', NULL, NULL, '2025-03-12 17:54:48', '2025-03-12 17:54:48'),
(27, 'App\\Models\\User', 2, 'auth_token', 'ade50d149372fa814f820e7f6c20875d1f285186abaaca853c9b0fc4b46fd107', '[\"*\"]', NULL, NULL, '2025-03-12 18:07:26', '2025-03-12 18:07:26'),
(28, 'App\\Models\\User', 2, 'Movie-ticket', '2a167de9861b9ef1461d2c66d0aff064bf3e8979c6ad71a27a6ad955d22af3a2', '[\"*\"]', NULL, NULL, '2025-03-12 18:37:24', '2025-03-12 18:37:24'),
(29, 'App\\Models\\User', 2, 'Movie-ticket', 'e40d467274740e404e4e4560c0af37d96c05dae3875d79d4643304b5c748862b', '[\"*\"]', NULL, NULL, '2025-03-12 18:37:40', '2025-03-12 18:37:40'),
(30, 'App\\Models\\User', 2, 'Movie-ticket', '9b15ae9479e500407164f79fa872637682291ec283909d238ec9f664808fce8d', '[\"*\"]', NULL, NULL, '2025-03-12 18:37:49', '2025-03-12 18:37:49'),
(31, 'App\\Models\\User', 2, 'Movie-ticket', 'b3cb951b07d2f585392febf45cb54b7f7e5fd3eb2db2d22077cf38a5ce25eff0', '[\"*\"]', NULL, NULL, '2025-03-12 18:37:52', '2025-03-12 18:37:52'),
(32, 'App\\Models\\User', 2, 'Movie-ticket', '7383cac9677614f1f003eaf077d8981624d19b7770b73e0c8f843888d07ab4c6', '[\"*\"]', NULL, NULL, '2025-03-12 18:40:27', '2025-03-12 18:40:27'),
(33, 'App\\Models\\User', 2, 'Movie-ticket', '00e1d5cbc7ec77fab6e2d6c23033bf2d5779902e6037b3877f24d35c1eb40776', '[\"*\"]', NULL, NULL, '2025-03-12 18:41:50', '2025-03-12 18:41:50'),
(34, 'App\\Models\\User', 2, 'Movie-ticket', '4428f1102957d9b60a8bbf5ab9a710d34ddddcbee1bd61b0ffa35d1e426bcf1a', '[\"*\"]', NULL, NULL, '2025-03-12 18:42:48', '2025-03-12 18:42:48'),
(35, 'App\\Models\\User', 2, 'Movie-ticket', '9a424a6e037382a24d731d56c2a14a8fe729f314283b70580437edc4cb631793', '[\"*\"]', NULL, NULL, '2025-03-12 18:46:38', '2025-03-12 18:46:38'),
(36, 'App\\Models\\User', 2, 'Movie-ticket', 'cf651d52c09e9165125120144db6226564397951571a84020f6af2ab77859d57', '[\"*\"]', NULL, NULL, '2025-03-12 18:51:20', '2025-03-12 18:51:20'),
(37, 'App\\Models\\User', 2, 'Movie-ticket', 'd0faec70eb0374636ca28059dc5f821b154a5aeff5c901a44b8c9e753c397b03', '[\"*\"]', NULL, NULL, '2025-03-12 18:53:43', '2025-03-12 18:53:43'),
(38, 'App\\Models\\User', 2, 'Movie-ticket', '5c47d48317e2149c8c7bd2a87edb10314af3801505b8d6ad8985ed6e50df9b18', '[\"*\"]', NULL, NULL, '2025-03-12 18:53:47', '2025-03-12 18:53:47'),
(39, 'App\\Models\\User', 2, 'Movie-ticket', 'e4b5a4da7de7df31d22543f56663411baf3745a3443a416cdbc196cf64722ef6', '[\"*\"]', NULL, NULL, '2025-03-12 18:53:50', '2025-03-12 18:53:50'),
(40, 'App\\Models\\User', 2, 'Movie-ticket', 'b7121edc64267d47af161e1c962309ef305c1eac38ae057ecc5242ed18e7f9a3', '[\"*\"]', NULL, NULL, '2025-03-12 18:53:52', '2025-03-12 18:53:52'),
(41, 'App\\Models\\User', 2, 'Movie-ticket', 'a1a89875d701237bbd2c224994ad326e1c0f4d047978e7c5b547f2a38c2b0fa8', '[\"*\"]', NULL, NULL, '2025-03-12 18:54:09', '2025-03-12 18:54:09'),
(42, 'App\\Models\\User', 2, 'Movie-ticket', 'b7b888cd7beab8cd4f7a892c608bdee6a06a11fdaa8c86f2a90298a5823759d9', '[\"*\"]', NULL, NULL, '2025-03-12 18:54:15', '2025-03-12 18:54:15'),
(43, 'App\\Models\\User', 2, 'Movie-ticket', '56e647d722ed170e7d5777eafbfaadda059b7a13d11f9950179455d79f587737', '[\"*\"]', NULL, NULL, '2025-03-12 18:55:16', '2025-03-12 18:55:16'),
(44, 'App\\Models\\User', 2, 'Movie-ticket', '76ca20585424ddbfd413dafd75277c87b07d857d62ba8729654b094a4afc434e', '[\"*\"]', NULL, NULL, '2025-03-12 19:07:01', '2025-03-12 19:07:01'),
(45, 'App\\Models\\User', 2, 'Movie-ticket', '5a929bc36f73830e1d2813ac0d3aeedce48373f8140fd0387a208ab5a58bedc6', '[\"*\"]', NULL, NULL, '2025-03-12 19:08:46', '2025-03-12 19:08:46'),
(46, 'App\\Models\\User', 2, 'Movie-ticket', 'df797260d831fe06ffcd8e20fcedf09170673792c24a4cf7dd216ba887d8dd82', '[\"*\"]', NULL, NULL, '2025-03-12 19:10:19', '2025-03-12 19:10:19'),
(47, 'App\\Models\\User', 2, 'Movie-ticket', 'c382417da421913b474b9e7db0250656ee42845613596c810d7bc85d3890e65c', '[\"*\"]', NULL, NULL, '2025-03-12 19:24:10', '2025-03-12 19:24:10'),
(48, 'App\\Models\\User', 2, 'Movie-ticket', 'cbe44142b4a397dbb7790afe837de51cb0155bc88088f415cf5109884b83d927', '[\"*\"]', NULL, NULL, '2025-03-12 19:24:50', '2025-03-12 19:24:50'),
(49, 'App\\Models\\User', 2, 'Movie-ticket', '0986f5afa45d47ab208903881390aa1e12b93c9b72eda03d4cbc0c0f9c493db6', '[\"*\"]', NULL, NULL, '2025-03-12 19:29:54', '2025-03-12 19:29:54'),
(50, 'App\\Models\\User', 2, 'Movie-ticket', '70ec9bd8b5a5b70c26490425fa39093886adde2afa1b314854a4e496f9219bcb', '[\"*\"]', NULL, NULL, '2025-03-12 19:30:29', '2025-03-12 19:30:29'),
(51, 'App\\Models\\User', 2, 'Movie-ticket', '8c3fb59728eba155754b3a900b15c665fc6a771376a29c33192898c11b67300a', '[\"*\"]', NULL, NULL, '2025-03-12 19:32:46', '2025-03-12 19:32:46'),
(52, 'App\\Models\\User', 4, 'Movie-ticket', '7c7db7ea549382192b2b10c4b1ee28108820e3155c37cb1f7d985a524a78227e', '[\"*\"]', NULL, NULL, '2025-03-12 19:33:04', '2025-03-12 19:33:04'),
(53, 'App\\Models\\User', 2, 'Movie-ticket', 'b2168bffd0f10cad75cf57e82912929c23f1e672d0aa894e44d894ea286aed76', '[\"*\"]', NULL, NULL, '2025-03-12 19:33:34', '2025-03-12 19:33:34'),
(54, 'App\\Models\\User', 2, 'Movie-ticket', 'b039a403cc395ffdcd44a0f6c9d966ca7858fed367ede0e6ea478afbd62b3fcc', '[\"*\"]', NULL, NULL, '2025-03-12 19:34:01', '2025-03-12 19:34:01'),
(55, 'App\\Models\\User', 2, 'Movie-ticket', '751b5bede2187e4eb69a12f430cbec133d5d3af7d4bdbd457b72df9a118c7d85', '[\"*\"]', NULL, NULL, '2025-03-12 19:45:00', '2025-03-12 19:45:00'),
(56, 'App\\Models\\User', 2, 'Movie-ticket', '785221ade54732350f1e746af59a9f1615c388ff139c36e5f81ccc4c4d410aec', '[\"*\"]', NULL, NULL, '2025-03-12 19:45:00', '2025-03-12 19:45:00'),
(57, 'App\\Models\\User', 1, 'Movie-ticket', '5705478899a7697392ecabf07da7d98f778eb3d15e9484dd20d21ac3018497ef', '[\"*\"]', NULL, NULL, '2025-03-12 19:54:27', '2025-03-12 19:54:27'),
(58, 'App\\Models\\User', 1, 'Movie-ticket', 'd8bbf260dd220437112a685da0bb873f484a9a5069cd1916cea95698522e3ef4', '[\"*\"]', NULL, NULL, '2025-03-12 19:54:28', '2025-03-12 19:54:28'),
(59, 'App\\Models\\User', 1, 'Movie-ticket', 'dc83465cb17617eb511f26093df83fd64b60bbc10f092f15efd58c708d5932a0', '[\"*\"]', NULL, NULL, '2025-03-12 19:56:20', '2025-03-12 19:56:20'),
(60, 'App\\Models\\User', 1, 'Movie-ticket', 'c1597677b6c5e7c5c671eff87c13fb0eba22f57fae83763330449c30dc32c8a8', '[\"*\"]', NULL, NULL, '2025-03-12 19:59:00', '2025-03-12 19:59:00'),
(61, 'App\\Models\\User', 1, 'Movie-ticket', 'c9fe9eee1a8d8de4d69d35d915620aeacfb1e0e4d1563e2a2e81682aa59a29b8', '[\"*\"]', NULL, NULL, '2025-03-12 19:59:38', '2025-03-12 19:59:38'),
(62, 'App\\Models\\User', 1, 'Movie-ticket', 'e1d6a30535a57496d01d5b89619443248f06e39594e57a745538f2c5a8b1a837', '[\"*\"]', NULL, NULL, '2025-03-12 19:59:56', '2025-03-12 19:59:56'),
(63, 'App\\Models\\User', 1, 'Movie-ticket', '67e341192e65708ed4961e1a48ce5bd72cd7beef89e2253cc391c305f7c74543', '[\"*\"]', NULL, NULL, '2025-03-12 20:03:07', '2025-03-12 20:03:07'),
(64, 'App\\Models\\User', 1, 'Movie-ticket', '20e27178e797553ca5cd4e5f6fe1b3d94076c6bdd5a8e0663899b2aa680223a2', '[\"*\"]', NULL, NULL, '2025-03-12 20:03:25', '2025-03-12 20:03:25'),
(65, 'App\\Models\\User', 1, 'Movie-ticket', '805630677047b231c5164e00c40925cad163331695e739029cfe92f3dc63d00b', '[\"*\"]', NULL, NULL, '2025-03-12 20:03:26', '2025-03-12 20:03:26'),
(66, 'App\\Models\\User', 1, 'Movie-ticket', 'fa0bc86bcc479914483f19607b7ff7791dc9d8a600bd78cfb7a832238b14fb92', '[\"*\"]', NULL, NULL, '2025-03-12 20:48:11', '2025-03-12 20:48:11'),
(67, 'App\\Models\\User', 1, 'Movie-ticket', '7d9fc93f6b5a96663b61c9c09d149a58c30bf80f87fdc7efc65590bd034c828d', '[\"*\"]', NULL, NULL, '2025-03-12 20:48:11', '2025-03-12 20:48:11'),
(68, 'App\\Models\\User', 2, 'Movie-ticket', '807da58b7b0f169ae705b4904316242a1cf7622a275b3519c2cec5ea82c7f666', '[\"*\"]', NULL, NULL, '2025-03-12 20:48:36', '2025-03-12 20:48:36'),
(69, 'App\\Models\\User', 2, 'Movie-ticket', '7daccb78b963a59ae632cd9699c153aedfc0b110d00d551a9ef523a9b2dde92d', '[\"*\"]', NULL, NULL, '2025-03-12 20:48:36', '2025-03-12 20:48:36'),
(70, 'App\\Models\\User', 1, 'Movie-ticket', 'c54dc90ec75ba7d3b9d61d6fd944f68b201ae976f9f6e1297e3ea154358c8556', '[\"*\"]', NULL, NULL, '2025-03-12 20:51:52', '2025-03-12 20:51:52'),
(71, 'App\\Models\\User', 1, 'Movie-ticket', '9e68ae80221a559902ac92420ab7436ef1ed03db7a86af4de43ef5eebb80672a', '[\"*\"]', NULL, NULL, '2025-03-12 20:51:53', '2025-03-12 20:51:53'),
(72, 'App\\Models\\User', 1, 'Movie-ticket', 'b91ad9cdff03352d5d6a93f5fdc30bf4724e542c27fceb8fa3626dc4646191c6', '[\"*\"]', NULL, NULL, '2025-03-12 21:03:43', '2025-03-12 21:03:43'),
(73, 'App\\Models\\User', 1, 'Movie-ticket', 'cefb3a95996584ef237fe9d3bb30a2289edf25debf6fc378d8a9e208365bcac3', '[\"*\"]', '2025-03-12 21:04:45', NULL, '2025-03-12 21:04:34', '2025-03-12 21:04:45'),
(74, 'App\\Models\\User', 8, 'movie_ticket', 'f572283c910f50fd25ea802813fd3cb09aa7d60413609afd79fe011c3c93b3ad', '[\"*\"]', NULL, NULL, '2025-03-26 17:41:10', '2025-03-26 17:41:10'),
(75, 'App\\Models\\User', 8, 'movie_ticket', '9b458e1f7c13206a124023bfbf486e4df9c7b72736bacb77b012b040e42dd5dd', '[\"*\"]', NULL, NULL, '2025-03-26 17:41:42', '2025-03-26 17:41:42'),
(76, 'App\\Models\\User', 1, 'movie_ticket', 'abbae787505a4bd11f34cce79bb5ee7828fb0ad748304d99cdcbbf2a55cf97cd', '[\"*\"]', NULL, NULL, '2025-03-26 17:42:12', '2025-03-26 17:42:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `screens`
--

CREATE TABLE `screens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theater_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `seat_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `screens`
--

INSERT INTO `screens` (`id`, `theater_id`, `name`, `seat_count`, `created_at`, `updated_at`) VALUES
(2, 1, 'Screen 1', 100, '2025-03-09 05:55:12', '2025-03-09 05:55:12'),
(3, 2, 'Screen 2', 150, '2025-03-09 05:55:12', '2025-03-09 05:55:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seats`
--

CREATE TABLE `seats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `screen_id` bigint(20) UNSIGNED NOT NULL,
  `seat_number` varchar(255) NOT NULL,
  `seat_type` enum('standard','VIP') NOT NULL DEFAULT 'standard',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `seats`
--

INSERT INTO `seats` (`id`, `screen_id`, `seat_number`, `seat_type`, `created_at`, `updated_at`, `price`) VALUES
(103, 2, 'A1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(104, 2, 'A2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(105, 2, 'A3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(106, 2, 'A4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(107, 2, 'A5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(108, 2, 'A6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(109, 2, 'A7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(110, 2, 'A8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(111, 2, 'A9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(112, 2, 'A10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(113, 2, 'B1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(114, 2, 'B2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(115, 2, 'B3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(116, 2, 'B4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(117, 2, 'B5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(118, 2, 'B6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(119, 2, 'B7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(120, 2, 'B8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(121, 2, 'B9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(122, 2, 'B10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(123, 2, 'C1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(124, 2, 'C2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(125, 2, 'C3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(126, 2, 'C4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(127, 2, 'C5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(128, 2, 'C6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(129, 2, 'C7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(130, 2, 'C8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(131, 2, 'C9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(132, 2, 'C10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(133, 2, 'D1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(134, 2, 'D2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(135, 2, 'D3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(136, 2, 'D4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(137, 2, 'D5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(138, 2, 'D6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(139, 2, 'D7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(140, 2, 'D8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(141, 2, 'D9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(142, 2, 'D10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(143, 2, 'E1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(144, 2, 'E2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(145, 2, 'E3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(146, 2, 'E4', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(147, 2, 'E5', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(148, 2, 'E6', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(149, 2, 'E7', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(150, 2, 'E8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(151, 2, 'E9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(152, 2, 'E10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(153, 2, 'F1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(154, 2, 'F2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(155, 2, 'F3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(156, 2, 'F4', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(157, 2, 'F5', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(158, 2, 'F6', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(159, 2, 'F7', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(160, 2, 'F8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(161, 2, 'F9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(162, 2, 'F10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(163, 2, 'G1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(164, 2, 'G2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(165, 2, 'G3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(166, 2, 'G4', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(167, 2, 'G5', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(168, 2, 'G6', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(169, 2, 'G7', 'VIP', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 109000),
(170, 2, 'G8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(171, 2, 'G9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(172, 2, 'G10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(173, 2, 'H1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(174, 2, 'H2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(175, 2, 'H3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(176, 2, 'H4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(177, 2, 'H5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(178, 2, 'H6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(179, 2, 'H7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(180, 2, 'H8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(181, 2, 'H9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(182, 2, 'H10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(183, 2, 'I1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(184, 2, 'I2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(185, 2, 'I3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(186, 2, 'I4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(187, 2, 'I5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(188, 2, 'I6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(189, 2, 'I7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(190, 2, 'I8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(191, 2, 'I9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(192, 2, 'I10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(193, 2, 'J1', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(194, 2, 'J2', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(195, 2, 'J3', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(196, 2, 'J4', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(197, 2, 'J5', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(198, 2, 'J6', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(199, 2, 'J7', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(200, 2, 'J8', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(201, 2, 'J9', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(202, 2, 'J10', 'standard', '2025-03-26 20:25:37', '2025-03-26 20:25:37', 79000),
(203, 3, 'A1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(204, 3, 'B1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(205, 3, 'C1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(206, 3, 'D1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(207, 3, 'E1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(208, 3, 'F1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(209, 3, 'G1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(210, 3, 'H1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(211, 3, 'I1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(212, 3, 'J1', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(213, 3, 'A2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(214, 3, 'B2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(215, 3, 'C2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(216, 3, 'D2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(217, 3, 'E2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(218, 3, 'F2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(219, 3, 'G2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(220, 3, 'H2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(221, 3, 'I2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(222, 3, 'J2', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(223, 3, 'A3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(224, 3, 'B3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(225, 3, 'C3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(226, 3, 'D3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(227, 3, 'E3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(228, 3, 'F3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(229, 3, 'G3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(230, 3, 'H3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(231, 3, 'I3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(232, 3, 'J3', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(233, 3, 'A4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(234, 3, 'B4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(235, 3, 'C4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(236, 3, 'D4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(237, 3, 'E4', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(238, 3, 'F4', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(239, 3, 'G4', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(240, 3, 'H4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(241, 3, 'I4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(242, 3, 'J4', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(243, 3, 'A5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(244, 3, 'B5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(245, 3, 'C5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(246, 3, 'D5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(247, 3, 'E5', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(248, 3, 'F5', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(249, 3, 'G5', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(250, 3, 'H5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(251, 3, 'I5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(252, 3, 'J5', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(253, 3, 'A6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(254, 3, 'B6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(255, 3, 'C6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(256, 3, 'D6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(257, 3, 'E6', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(258, 3, 'F6', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(259, 3, 'G6', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(260, 3, 'H6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(261, 3, 'I6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(262, 3, 'J6', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(263, 3, 'A7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(264, 3, 'B7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(265, 3, 'C7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(266, 3, 'D7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(267, 3, 'E7', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(268, 3, 'F7', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(269, 3, 'G7', 'VIP', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 109000),
(270, 3, 'H7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(271, 3, 'I7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(272, 3, 'J7', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(273, 3, 'A8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(274, 3, 'B8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(275, 3, 'C8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(276, 3, 'D8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(277, 3, 'E8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(278, 3, 'F8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(279, 3, 'G8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(280, 3, 'H8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(281, 3, 'I8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(282, 3, 'J8', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(283, 3, 'A9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(284, 3, 'B9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(285, 3, 'C9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(286, 3, 'D9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(287, 3, 'E9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(288, 3, 'F9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(289, 3, 'G9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(290, 3, 'H9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(291, 3, 'I9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(292, 3, 'J9', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(293, 3, 'A10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(294, 3, 'B10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(295, 3, 'C10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(296, 3, 'D10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(297, 3, 'E10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(298, 3, 'F10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(299, 3, 'G10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(300, 3, 'H10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(301, 3, 'I10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000),
(302, 3, 'J10', 'standard', '2025-03-27 03:27:52', '2025-03-27 03:27:52', 79000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BLQSBDqSS95J8GRsyFVeZEYyKZkf1MKWCOdxgVyh', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Safari/605.1.15', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN3NrWlJ3M3JwZ0NBeEozUm44MUE0NGp4ajgyeHNuS2VkRXY4dHd2QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo4NDoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2Nob24tZ2hlP2RhdGU9MjAyNS0wMy0yMCZtb3ZpZV9pZD0xJnNob3d0aW1lX2lkPTEmdGhlYXRlcl9pZD0xIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wYXltZW50L2ZhaWxlZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1743329655),
('F7Tun1P4PwUmOtwuegtxC20rtZ92SnMQO2OufzhR', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOElHMXpTcHlxYkNDaERScU9OTkIxM1U1MGs5QTAxdGlJZGlCMmZCUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743342779),
('hDCEFAhkGQT0jeYwSl6mhoUC7eeZhp6yIYFHtkAg', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Safari/605.1.15', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUllDbUhQMVVVQ21hd0gzV1R5M2xESHVneGwyb1lYbnI1cTVYV1IwNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo4NDoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2Nob24tZ2hlP2RhdGU9MjAyNS0wMy0yMCZtb3ZpZV9pZD0xJnNob3d0aW1lX2lkPTEmdGhlYXRlcl9pZD0xIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9tb3ZpZXMvNiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1743342806),
('PdkliOXP9q0SZbH1V00qnuoQYpW4v43gI8ILgdTC', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Safari/605.1.15', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWHVxV0tpeTNkcFpYTE9VcEVQSklEQzFFeXY3MjdtTVo3ZlhKZml5RSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NjM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wYXltZW50L3N1Y2Nlc3M/dm5wX0Ftb3VudD03OTAwMDAwJnZucF9CYW5rQ29kZT1OQ0Imdm5wX0JhbmtUcmFuTm89Vk5QMTQ4ODAxMTkmdm5wX0NhcmRUeXBlPUFUTSZ2bnBfT3JkZXJJbmZvPVRoYW5oJTIwdG8lQzMlQTFuJTIwJUM0JTkxJUM2JUExbiUyMGglQzMlQTBuZyUyMCUyMzU0JnZucF9QYXlEYXRlPTIwMjUwMzMwMTY0MDQzJnZucF9SZXNwb25zZUNvZGU9MDAmdm5wX1NlY3VyZUhhc2g9MWNkZmNmNDk5YzFkZTVlYWZjMzY0MzgxMzgxYzNhZjdiNjliYTM1NmFlNGZlNjM2NmVmNTEyZmRkMWNhOTk5YWU3NGI1ZjQ4MjdmNTc5ZWFlMmI1MDdhMjBjZDNmMmJmNGY0OGE2YWQzZGNhYzkwYzg2NTI3YmQ1NDNiNzIzNmYmdm5wX1RtbkNvZGU9STQzR1BVVjgmdm5wX1RyYW5zYWN0aW9uTm89MTQ4ODAxMTkmdm5wX1RyYW5zYWN0aW9uU3RhdHVzPTAwJnZucF9UeG5SZWY9OTUiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3BheW1lbnQvZmFpbGVkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1743329506),
('q6KqMdNiEdqAgBXxLjatNOIZHXfhuhsv2CRX0P3r', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUI0WXp3MEdkc3V0a0c5UDJabk9KZUVzSXN2RGZXUXFmbWx5bDl5USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744081344),
('vi87dIA9Fnd9z6dx7CLAYGlubtoYc7yJdmYQnzyE', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTElYUHB2RVFvaTVTNVJsZDdwOFBTbmFMNVNKdjVoUk1GWG1YVWJJRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1744249321),
('ygduHCMDPTzWgoAusQyU1jIwzUqFZPgQzBRGz0CA', 2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmd1N1RhVUNobU9wZXIweDU0YUd6TTJjbzRtanVYN3RTTE1LRU1KMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9teS10aWNrZXRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1744556609);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `showtimes`
--

CREATE TABLE `showtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `screen_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `seat_count` int(11) NOT NULL COMMENT 'Tổng số ghế của suất chiếu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `showtimes`
--

INSERT INTO `showtimes` (`id`, `movie_id`, `screen_id`, `start_time`, `seat_count`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-03-20 14:00:00', 100, '2025-03-19 04:48:33', '2025-03-19 04:48:33'),
(2, 2, 3, '2025-03-21 16:30:00', 80, '2025-03-19 04:48:33', '2025-03-19 04:48:33'),
(3, 3, 2, '2025-03-22 19:00:00', 60, '2025-03-19 04:48:33', '2025-03-19 04:48:33'),
(4, 4, 3, '2025-03-23 20:00:00', 90, '2025-03-19 04:48:33', '2025-03-19 04:48:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theaters`
--

CREATE TABLE `theaters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theaters`
--

INSERT INTO `theaters` (`id`, `name`, `location`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'CGV Cinema', 'Hà Nội', '0123456789', '2025-03-09 05:55:09', '2025-03-09 05:55:09'),
(2, 'Lotte Cinema', 'TP.HCM', '0987654321', '2025-03-09 05:55:09', '2025-03-09 05:55:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `showtime_id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `seat_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','credit_card') NOT NULL DEFAULT 'cash',
  `transaction_id` varchar(255) DEFAULT NULL,
  `status` enum('booked','paid','cancelled','used') NOT NULL DEFAULT 'booked',
  `qr_code` varchar(255) DEFAULT NULL,
  `booking_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `google_id` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `google_id`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$mzxKZW7u5b/GTGREapZIfeWPZStlgDh/.TmHpfDxkHGOfG/EKUV12', NULL, '2025-03-09 05:44:10', '2025-03-09 05:44:10', 'admin', NULL),
(2, 'User', 'user@gmail.com', NULL, '$2y$12$H/HQcPkQo9S0PCtbGiRbbu3/uj5VVi8vZ7AleWDJVQTvzkIdRvIFq', NULL, '2025-03-09 05:44:10', '2025-03-09 05:44:10', 'user', NULL),
(4, 'Người Dùng Mới', 'dai@gmail.com', NULL, '$2y$12$.nyXHqg6tbUy48bq/WmvxO6iyU2.CyyJwjDl7ycSYlCZGLGKO6Qgy', NULL, '2025-03-12 19:33:04', '2025-03-12 19:33:04', 'user', NULL),
(5, 'Tung Pham', 'phamtung232003@gmail.com', NULL, '$2y$12$F2H4kd7lO.iDm/.pARFUVufbQfM3oiL2kCrde3yQALtjliL3to2oy', NULL, '2025-03-17 19:01:25', '2025-03-17 19:01:25', 'user', '108853913595146121745'),
(6, 'hiệp lê', 'levanhoanghiep11a21@gmail.com', NULL, '$2y$12$RdIgNxzR64V.ck1.51lwFumAI/i7o.LP3l67AvsDOAsB7ooB5bAUq', NULL, '2025-03-17 19:01:43', '2025-03-17 19:01:43', 'user', '106066061444144192033'),
(8, 'Nguyễn Văn A', 'test@gmail.com', NULL, '$2y$12$mWEZw2v0qVM9u3NucXs51O2EUSw3pWGKKqZZi9gby4E8gWGRp...e', NULL, '2025-03-26 17:41:10', '2025-03-26 17:41:10', 'user', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_showtime_id_foreign` (`showtime_id`),
  ADD KEY `fk_bookings_movie` (`movie_id`);

--
-- Chỉ mục cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_details_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_details_seat_id_foreign` (`seat_id`);

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `screens`
--
ALTER TABLE `screens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screens_theater_id_foreign` (`theater_id`);

--
-- Chỉ mục cho bảng `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats_screen_id_foreign` (`screen_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Chỉ mục cho bảng `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_showtime_id_foreign` (`showtime_id`),
  ADD KEY `tickets_seat_id_foreign` (`seat_id`),
  ADD KEY `tickets_movie_id_foreign` (`movie_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `screens`
--
ALTER TABLE `screens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT cho bảng `showtimes`
--
ALTER TABLE `showtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `theaters`
--
ALTER TABLE `theaters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_showtime_id_foreign` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bookings_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_details_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `screens`
--
ALTER TABLE `screens`
  ADD CONSTRAINT `screens_theater_id_foreign` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_screen_id_foreign` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `showtimes`
--
ALTER TABLE `showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`),
  ADD CONSTRAINT `tickets_showtime_id_foreign` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`id`),
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
