-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2022 at 09:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lksdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_06_24_154233_create_tbl_pengguna_table', 1),
(3, '2022_06_24_154310_create_tbl_booking_table', 1),
(4, '2022_06_24_154330_create_tbl_kamar_table', 1),
(5, '2022_06_24_154353_create_tbl_pemilik_hotel_table', 1),
(6, '2022_06_24_154426_create_tbl_kota_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `id_kamar` bigint(20) UNSIGNED NOT NULL,
  `id_pengguna` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`id_booking`, `id_kamar`, `id_pengguna`, `status`, `tanggal_checkin`, `tanggal_checkout`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'completed', '2022-06-25', '2022-06-26', '2022-06-24 12:12:58', '2022-06-24 12:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` bigint(20) UNSIGNED NOT NULL,
  `id_pemilik_hotel` bigint(20) UNSIGNED NOT NULL,
  `nama_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_per_kamar` decimal(9,3) NOT NULL,
  `jumlah_kamar` mediumint(9) NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fasilitas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `id_pemilik_hotel`, `nama_kamar`, `harga_per_kamar`, `jumlah_kamar`, `gambar`, `deskripsi`, `fasilitas`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kamar Vip ', '150.000', 2, 'gambar.jpg', 'Kamar Hotel Vip', 'Ac,Kipas,Tv', '2022-06-24 17:45:39', '2022-06-24 17:45:39'),
(2, 2, 'vip jakarta', '150.000', 2, 'gambar.jpg', 'mewah dan harum', 'ac,kipas', NULL, NULL),
(3, 3, 'kamar bandung', '150.000', 1, 'gambar.jpg', 'enak', 'ac', NULL, NULL),
(4, 2, 'Kamar Vip New', '140.000', 1, 'gambar.jpg', 'murah dan nyaman', 'ac,kipas', '2022-06-24 18:56:18', '2022-06-24 18:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kota`
--

CREATE TABLE `tbl_kota` (
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `nama_kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_kota`
--

INSERT INTO `tbl_kota` (`id_kota`, `nama_kota`, `created_at`, `updated_at`) VALUES
(1, 'Bandung', '2022-06-24 17:07:15', '2022-06-24 17:07:15'),
(2, 'Jakarta', '2022-06-24 17:44:03', '2022-06-24 17:44:03'),
(3, 'Palembang', '2022-06-24 17:44:22', '2022-06-24 17:44:22'),
(4, 'Surabaya', '2022-06-24 17:44:32', '2022-06-24 17:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pemilik_hotel`
--

CREATE TABLE `tbl_pemilik_hotel` (
  `id_pemilik_hotel` bigint(20) UNSIGNED NOT NULL,
  `nama_pemilik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kota` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pemilik_hotel`
--

INSERT INTO `tbl_pemilik_hotel` (`id_pemilik_hotel`, `nama_pemilik`, `email`, `password`, `id_kota`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'ahmad', 'ahmad@gmail.com', '$2y$10$Rs8vAur7DhVRCivaoNRxluNdgfabb8OUxJQD0QHQdlKdpWEaySMYK', 1, NULL, '2022-06-24 10:07:53', '2022-06-24 10:11:19'),
(2, 'Adi', 'adi@gmail.com', '123', 2, NULL, NULL, NULL),
(3, 'ade', 'ade@gmail.com', '123', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengguna`
--

CREATE TABLE `tbl_pengguna` (
  `id_pengguna` bigint(20) UNSIGNED NOT NULL,
  `nama_depan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pengguna`
--

INSERT INTO `tbl_pengguna` (`id_pengguna`, `nama_depan`, `nama_belakang`, `email`, `phone_number`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(1, 'kurniawan', 'rizky', 'kurniawan@gmail.com', '085845820300', '$2y$10$HCV4WvpguxVdc.bpPYLjp.VEv6X9VNAC1ZVCq7SMt1dE4WEXSNRJ.', '$2y$10$dsIdHE0ySFxT9McsScE5AOkfFvk308DWwDVYmBsMLbGEVd8CuQsKO', '2022-06-24 09:30:12', '2022-06-24 10:29:34'),
(2, 'hendra', 'gunawan', 'hendra@gmail.com', '085832422342', '$2y$10$9na28ncWrDFRJ7kt16OHyubEIxTbXYhBDt4WfL85DsBqTCt5AOeg6', '$2y$10$pRBlXZpVCsO9sjos3yMl5u86IokdxRizFupscXYkgePzU89WPgTOK', '2022-06-24 09:48:31', '2022-06-24 09:48:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `tbl_booking_id_kamar_foreign` (`id_kamar`),
  ADD KEY `tbl_booking_id_pengguna_foreign` (`id_pengguna`);

--
-- Indexes for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `tbl_kamar_id_pemilik_hotel_foreign` (`id_pemilik_hotel`);

--
-- Indexes for table `tbl_kota`
--
ALTER TABLE `tbl_kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `tbl_pemilik_hotel`
--
ALTER TABLE `tbl_pemilik_hotel`
  ADD PRIMARY KEY (`id_pemilik_hotel`),
  ADD KEY `tbl_pemilik_hotel_id_kota_foreign` (`id_kota`);

--
-- Indexes for table `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `id_booking` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_kota`
--
ALTER TABLE `tbl_kota`
  MODIFY `id_kota` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_pemilik_hotel`
--
ALTER TABLE `tbl_pemilik_hotel`
  MODIFY `id_pemilik_hotel` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  MODIFY `id_pengguna` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_id_kamar_foreign` FOREIGN KEY (`id_kamar`) REFERENCES `tbl_kamar` (`id_kamar`),
  ADD CONSTRAINT `tbl_booking_id_pengguna_foreign` FOREIGN KEY (`id_pengguna`) REFERENCES `tbl_pengguna` (`id_pengguna`);

--
-- Constraints for table `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD CONSTRAINT `tbl_kamar_id_pemilik_hotel_foreign` FOREIGN KEY (`id_pemilik_hotel`) REFERENCES `tbl_pemilik_hotel` (`id_pemilik_hotel`);

--
-- Constraints for table `tbl_pemilik_hotel`
--
ALTER TABLE `tbl_pemilik_hotel`
  ADD CONSTRAINT `tbl_pemilik_hotel_id_kota_foreign` FOREIGN KEY (`id_kota`) REFERENCES `tbl_kota` (`id_kota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
