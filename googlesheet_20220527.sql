-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： mariadb
-- 產生時間： 2022 年 05 月 26 日 16:55
-- 伺服器版本： 10.7.3-MariaDB-1:10.7.3+maria~focal
-- PHP 版本： 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `googlesheet`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(2, 0, 3, '系統管理', 'fa-tasks', NULL, NULL, NULL, '2022-05-25 01:08:26'),
(3, 2, 4, '成員列表', 'fa-users', 'auth/users', NULL, NULL, '2022-05-25 01:08:26'),
(4, 2, 5, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2022-05-25 01:08:26'),
(5, 2, 6, '權限', 'fa-ban', 'auth/permissions', NULL, NULL, '2022-05-25 01:08:26'),
(6, 2, 7, '選單', 'fa-bars', 'auth/menu', NULL, NULL, '2022-05-25 01:08:26'),
(7, 2, 8, '後台記錄', 'fa-history', 'auth/logs', NULL, NULL, '2022-05-25 01:08:26'),
(8, 0, 2, '訂單列表', 'fa-reorder', '/orders', 'order', '2022-05-25 01:08:13', '2022-05-25 04:05:25');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '172.22.0.1', '[]', '2022-05-18 08:33:26', '2022-05-18 08:33:26'),
(2, 1, 'admin', 'GET', '172.22.0.1', '[]', '2022-05-18 08:33:49', '2022-05-18 08:33:49'),
(3, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:33:56', '2022-05-18 08:33:56'),
(4, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:36:02', '2022-05-18 08:36:02'),
(5, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:36:03', '2022-05-18 08:36:03'),
(6, 1, 'admin/auth/setting', 'PUT', '172.22.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/login\"}', '2022-05-18 08:37:23', '2022-05-18 08:37:23'),
(7, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:37:23', '2022-05-18 08:37:23'),
(8, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:37:35', '2022-05-18 08:37:35'),
(9, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:38:55', '2022-05-18 08:38:55'),
(10, 1, 'admin/auth/setting', 'PUT', '172.22.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/login\"}', '2022-05-18 08:39:00', '2022-05-18 08:39:00'),
(11, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:39:00', '2022-05-18 08:39:00'),
(12, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:39:02', '2022-05-18 08:39:02'),
(13, 1, 'admin/auth/setting', 'GET', '172.22.0.1', '[]', '2022-05-18 08:47:30', '2022-05-18 08:47:30'),
(14, 1, 'admin/auth/roles', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:48:10', '2022-05-18 08:48:10'),
(15, 1, 'admin/auth/roles/create', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:51:06', '2022-05-18 08:51:06'),
(16, 1, 'admin', 'GET', '172.22.0.1', '[]', '2022-05-18 08:52:02', '2022-05-18 08:52:02'),
(17, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:52:10', '2022-05-18 08:52:10'),
(18, 1, 'admin/auth/roles', 'POST', '172.22.0.1', '{\"slug\":\"member\",\"name\":\"\\u6210\\u54e1\",\"permissions\":[\"2\",\"3\",\"4\",null],\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/roles\"}', '2022-05-18 08:52:40', '2022-05-18 08:52:40'),
(19, 1, 'admin/auth/roles', 'GET', '172.22.0.1', '[]', '2022-05-18 08:52:41', '2022-05-18 08:52:41'),
(20, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:52:53', '2022-05-18 08:52:53'),
(21, 1, 'admin/auth/menu/2/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:52:57', '2022-05-18 08:52:57'),
(22, 1, 'admin/auth/menu/2', 'PUT', '172.22.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7d71\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:06', '2022-05-18 08:53:06'),
(23, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:06', '2022-05-18 08:53:06'),
(24, 1, 'admin/auth/menu/3/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:09', '2022-05-18 08:53:09'),
(25, 1, 'admin/auth/menu/3', 'PUT', '172.22.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u6210\\u54e1\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:18', '2022-05-18 08:53:18'),
(26, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:18', '2022-05-18 08:53:18'),
(27, 1, 'admin/auth/menu/4/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:23', '2022-05-18 08:53:23'),
(28, 1, 'admin/auth/menu/4', 'PUT', '172.22.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:27', '2022-05-18 08:53:27'),
(29, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:27', '2022-05-18 08:53:27'),
(30, 1, 'admin/auth/menu/5/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:29', '2022-05-18 08:53:29'),
(31, 1, 'admin/auth/menu/5', 'PUT', '172.22.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u6b0a\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:34', '2022-05-18 08:53:34'),
(32, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:34', '2022-05-18 08:53:34'),
(33, 1, 'admin/auth/menu/6/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:36', '2022-05-18 08:53:36'),
(34, 1, 'admin/auth/menu/6', 'PUT', '172.22.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u9078\\u55ae\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:42', '2022-05-18 08:53:42'),
(35, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:42', '2022-05-18 08:53:42'),
(36, 1, 'admin/auth/menu/7/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:45', '2022-05-18 08:53:45'),
(37, 1, 'admin/auth/menu/7', 'PUT', '172.22.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u5f8c\\u53f0\\u8a18\\u9304\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:53:51', '2022-05-18 08:53:51'),
(38, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:53:51', '2022-05-18 08:53:51'),
(39, 1, 'admin/auth/menu/1/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:53:54', '2022-05-18 08:53:54'),
(40, 1, 'admin/auth/menu/1', 'PUT', '172.22.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5100\\u8868\\u677f\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-18 08:54:08', '2022-05-18 08:54:08'),
(41, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:54:08', '2022-05-18 08:54:08'),
(42, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-18 08:54:11', '2022-05-18 08:54:11'),
(43, 1, 'admin/auth/users', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:54:51', '2022-05-18 08:54:51'),
(44, 1, 'admin/auth/users/create', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:54:52', '2022-05-18 08:54:52'),
(45, 1, 'admin/auth/users', 'POST', '172.22.0.1', '{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"bliaou\",\"password_confirmation\":\"bliaou\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"eS54YDURafaIst4qM3W8AOxCcMQ8HaKyBPDBDH0U\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/users\"}', '2022-05-18 08:55:06', '2022-05-18 08:55:06'),
(46, 1, 'admin/auth/users', 'GET', '172.22.0.1', '[]', '2022-05-18 08:55:07', '2022-05-18 08:55:07'),
(47, 1, 'admin/auth/roles', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:55:35', '2022-05-18 08:55:35'),
(48, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:55:37', '2022-05-18 08:55:37'),
(49, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-18 08:55:38', '2022-05-18 08:55:38'),
(50, 1, 'admin', 'GET', '172.19.0.1', '[]', '2022-05-22 11:58:54', '2022-05-22 11:58:54'),
(51, 1, 'admin', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-22 11:59:02', '2022-05-22 11:59:02'),
(52, 1, 'admin/auth/users', 'GET', '172.19.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-22 11:59:29', '2022-05-22 11:59:29'),
(53, 1, 'admin', 'GET', '172.22.0.1', '[]', '2022-05-25 00:44:36', '2022-05-25 00:44:36'),
(54, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:07:35', '2022-05-25 01:07:35'),
(55, 1, 'admin/auth/menu', 'POST', '172.22.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":null,\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\"}', '2022-05-25 01:08:13', '2022-05-25 01:08:13'),
(56, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:08:13', '2022-05-25 01:08:13'),
(57, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:08:21', '2022-05-25 01:08:21'),
(58, 1, 'admin/auth/menu', 'POST', '172.22.0.1', '{\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2022-05-25 01:08:26', '2022-05-25 01:08:26'),
(59, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:08:26', '2022-05-25 01:08:26'),
(60, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:08:28', '2022-05-25 01:08:28'),
(61, 1, 'admin', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:08:30', '2022-05-25 01:08:30'),
(62, 1, 'admin', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:08:34', '2022-05-25 01:08:34'),
(63, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:08:42', '2022-05-25 01:08:42'),
(64, 1, 'admin/auth/permissions/create', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:09:01', '2022-05-25 01:09:01'),
(65, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:09:03', '2022-05-25 01:09:03'),
(66, 1, 'admin/auth/permissions/create', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:09:08', '2022-05-25 01:09:08'),
(67, 1, 'admin/auth/permissions', 'POST', '172.22.0.1', '{\"slug\":\"order\",\"name\":\"order\",\"http_method\":[null],\"http_path\":\"orders\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\"}', '2022-05-25 01:09:35', '2022-05-25 01:09:35'),
(68, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '[]', '2022-05-25 01:09:35', '2022-05-25 01:09:35'),
(69, 1, 'admin/auth/permissions/6/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:09:45', '2022-05-25 01:09:45'),
(70, 1, 'admin/auth/permissions/6', 'PUT', '172.22.0.1', '{\"slug\":\"order\",\"name\":\"order\",\"http_method\":[null],\"http_path\":\"\\/orders*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/permissions\"}', '2022-05-25 01:09:53', '2022-05-25 01:09:53'),
(71, 1, 'admin/auth/permissions', 'GET', '172.22.0.1', '[]', '2022-05-25 01:09:53', '2022-05-25 01:09:53'),
(72, 1, 'admin', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:09:57', '2022-05-25 01:09:57'),
(73, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:04', '2022-05-25 01:10:04'),
(74, 1, 'admin/auth/menu/8/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:07', '2022-05-25 01:10:07'),
(75, 1, 'admin/auth/menu/8', 'PUT', '172.22.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"orders\",\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-25 01:10:13', '2022-05-25 01:10:13'),
(76, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:10:14', '2022-05-25 01:10:14'),
(77, 1, 'admin', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:16', '2022-05-25 01:10:16'),
(78, 1, 'admin', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:19', '2022-05-25 01:10:19'),
(79, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:24', '2022-05-25 01:10:24'),
(80, 1, 'admin/auth/menu/8/edit', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:27', '2022-05-25 01:10:27'),
(81, 1, 'admin/auth/menu/8', 'PUT', '172.22.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"\\/orders\",\"roles\":[\"2\",null],\"permission\":\"*\",\"_token\":\"lLC3RNWVczZJFPoYIzoPppH96bGpSDM5TOsFDBpH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/admin\\/auth\\/menu\"}', '2022-05-25 01:10:31', '2022-05-25 01:10:31'),
(82, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:10:31', '2022-05-25 01:10:31'),
(83, 1, 'admin/auth/menu', 'GET', '172.22.0.1', '[]', '2022-05-25 01:10:36', '2022-05-25 01:10:36'),
(84, 1, 'admin/orders', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 01:10:39', '2022-05-25 01:10:39'),
(85, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:15:09', '2022-05-25 01:15:09'),
(86, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:32:33', '2022-05-25 01:32:33'),
(87, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:33:42', '2022-05-25 01:33:42'),
(88, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:33:48', '2022-05-25 01:33:48'),
(89, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:34:08', '2022-05-25 01:34:08'),
(90, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:35:34', '2022-05-25 01:35:34'),
(91, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:35:56', '2022-05-25 01:35:56'),
(92, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:36:35', '2022-05-25 01:36:35'),
(93, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:36:55', '2022-05-25 01:36:55'),
(94, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:37:29', '2022-05-25 01:37:29'),
(95, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:38:12', '2022-05-25 01:38:12'),
(96, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 01:39:00', '2022-05-25 01:39:00'),
(97, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:00:24', '2022-05-25 02:00:24'),
(98, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:00:42', '2022-05-25 02:00:42'),
(99, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:00:57', '2022-05-25 02:00:57'),
(100, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:01:04', '2022-05-25 02:01:04'),
(101, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:01:16', '2022-05-25 02:01:16'),
(102, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:01:28', '2022-05-25 02:01:28'),
(103, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:02:03', '2022-05-25 02:02:03'),
(104, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:02:25', '2022-05-25 02:02:25'),
(105, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:05:19', '2022-05-25 02:05:19'),
(106, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:06:16', '2022-05-25 02:06:16'),
(107, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:06:46', '2022-05-25 02:06:46'),
(108, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:11:11', '2022-05-25 02:11:11'),
(109, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:11:41', '2022-05-25 02:11:41'),
(110, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:12:04', '2022-05-25 02:12:04'),
(111, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:12:34', '2022-05-25 02:12:34'),
(112, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:12:50', '2022-05-25 02:12:50'),
(113, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:13:19', '2022-05-25 02:13:19'),
(114, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:16:48', '2022-05-25 02:16:48'),
(115, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:17:22', '2022-05-25 02:17:22'),
(116, 1, 'admin/orders', 'GET', '172.22.0.1', '{\"_export_\":\"all\"}', '2022-05-25 02:17:28', '2022-05-25 02:17:28'),
(117, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:18:31', '2022-05-25 02:18:31'),
(118, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:19:03', '2022-05-25 02:19:03'),
(119, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:19:34', '2022-05-25 02:19:34'),
(120, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:19:55', '2022-05-25 02:19:55'),
(121, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:20:25', '2022-05-25 02:20:25'),
(122, 1, 'admin', 'GET', '172.22.0.1', '[]', '2022-05-25 02:51:46', '2022-05-25 02:51:46'),
(123, 1, 'admin/orders', 'GET', '172.22.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 02:51:50', '2022-05-25 02:51:50'),
(124, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:52:47', '2022-05-25 02:52:47'),
(125, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:54:17', '2022-05-25 02:54:17'),
(126, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:54:31', '2022-05-25 02:54:31'),
(127, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:55:17', '2022-05-25 02:55:17'),
(128, 1, 'admin/orders', 'GET', '172.22.0.1', '[]', '2022-05-25 02:58:33', '2022-05-25 02:58:33'),
(129, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:01:48', '2022-05-25 04:01:48'),
(130, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:01:56', '2022-05-25 04:01:56'),
(131, 1, 'admin/auth/setting', 'PUT', '180.177.28.147', '{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"iXa2nuHsy5UudQbOveClARrKaAgamj8r74E3WUxE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\"}', '2022-05-25 04:02:01', '2022-05-25 04:02:01'),
(132, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '[]', '2022-05-25 04:02:01', '2022-05-25 04:02:01'),
(133, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '[]', '2022-05-25 04:02:08', '2022-05-25 04:02:08'),
(134, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:02:21', '2022-05-25 04:02:21'),
(135, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:28', '2022-05-25 04:02:28'),
(136, 1, 'admin/auth/users', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:46', '2022-05-25 04:02:46'),
(137, 1, 'admin/auth/users/create', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:48', '2022-05-25 04:02:48'),
(138, 1, 'admin/auth/users', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:50', '2022-05-25 04:02:50'),
(139, 1, 'admin/auth/users/2/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:54', '2022-05-25 04:02:54'),
(140, 1, 'admin/auth/roles', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:02:57', '2022-05-25 04:02:57'),
(141, 1, 'admin/auth/roles/2/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:03:03', '2022-05-25 04:03:03'),
(142, 1, 'admin/auth/roles/2', 'PUT', '180.177.28.147', '{\"slug\":\"member\",\"name\":\"\\u6210\\u54e1\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/roles\"}', '2022-05-25 04:03:07', '2022-05-25 04:03:07'),
(143, 1, 'admin/auth/roles', 'GET', '180.177.28.147', '[]', '2022-05-25 04:03:08', '2022-05-25 04:03:08'),
(144, 1, 'admin/auth/users', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:03:14', '2022-05-25 04:03:14'),
(145, 1, 'admin/auth/users/2/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:03:19', '2022-05-25 04:03:19'),
(146, 1, 'admin/auth/users/2', 'PUT', '180.177.28.147', '{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"$2y$10$.iBDogVPdiJCn\\/uXG.2kiud\\/2oAJPZYb\\/4.7G0JyYm1wqe4RlEPHy\",\"password_confirmation\":\"$2y$10$.iBDogVPdiJCn\\/uXG.2kiud\\/2oAJPZYb\\/4.7G0JyYm1wqe4RlEPHy\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}', '2022-05-25 04:03:28', '2022-05-25 04:03:28'),
(147, 1, 'admin/auth/users', 'GET', '180.177.28.147', '[]', '2022-05-25 04:03:29', '2022-05-25 04:03:29'),
(148, 1, 'admin/auth/users/create', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:03:33', '2022-05-25 04:03:33'),
(149, 1, 'admin/auth/users', 'POST', '180.177.28.147', '{\"username\":\"user1\",\"name\":\"user1\",\"password\":\"user1\",\"password_confirmation\":\"user1\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"miSk64icgEkzD6xGRVySsd812nx6BhBQzsYL7mvA\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}', '2022-05-25 04:03:46', '2022-05-25 04:03:46'),
(150, 1, 'admin/auth/users', 'GET', '180.177.28.147', '[]', '2022-05-25 04:03:47', '2022-05-25 04:03:47'),
(151, 1, 'admin/auth/logout', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:03:53', '2022-05-25 04:03:53'),
(152, 3, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:03:58', '2022-05-25 04:03:58'),
(153, 3, 'admin/auth/logout', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:05', '2022-05-25 04:04:05'),
(154, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:04:16', '2022-05-25 04:04:16'),
(155, 1, 'admin/auth/roles', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:22', '2022-05-25 04:04:22'),
(156, 1, 'admin/auth/menu', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:28', '2022-05-25 04:04:28'),
(157, 1, 'admin/auth/menu/8/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:32', '2022-05-25 04:04:32'),
(158, 1, 'admin/auth/menu', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:39', '2022-05-25 04:04:39'),
(159, 1, 'admin/auth/menu/8/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:44', '2022-05-25 04:04:44'),
(160, 1, 'admin/auth/menu', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:47', '2022-05-25 04:04:47'),
(161, 1, 'admin/auth/permissions', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:04:56', '2022-05-25 04:04:56'),
(162, 1, 'admin/auth/menu', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:05:09', '2022-05-25 04:05:09'),
(163, 1, 'admin/auth/menu/8/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:05:14', '2022-05-25 04:05:14'),
(164, 1, 'admin/auth/menu/8', 'PUT', '180.177.28.147', '{\"parent_id\":\"0\",\"title\":\"\\u8a02\\u55ae\\u5217\\u8868\",\"icon\":\"fa-reorder\",\"uri\":\"\\/orders\",\"roles\":[\"2\",null],\"permission\":\"order\",\"_token\":\"ZD1zbzOGbdClMealuVwFS4bCt9W8BEF9CuY6GUqa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/menu\"}', '2022-05-25 04:05:25', '2022-05-25 04:05:25'),
(165, 1, 'admin/auth/menu', 'GET', '180.177.28.147', '[]', '2022-05-25 04:05:25', '2022-05-25 04:05:25'),
(166, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:05:30', '2022-05-25 04:05:30'),
(167, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:05:51', '2022-05-25 04:05:51'),
(168, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:05:53', '2022-05-25 04:05:53'),
(169, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:06:03', '2022-05-25 04:06:03'),
(170, 1, 'admin/auth/users', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:06:12', '2022-05-25 04:06:12'),
(171, 1, 'admin/auth/users/2/edit', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:06:16', '2022-05-25 04:06:16'),
(172, 1, 'admin/auth/users/2', 'PUT', '180.177.28.147', '{\"username\":\"bliaou\",\"name\":\"bliaou\",\"password\":\"bliaou\",\"password_confirmation\":\"bliaou\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"ZD1zbzOGbdClMealuVwFS4bCt9W8BEF9CuY6GUqa\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/auth\\/users\"}', '2022-05-25 04:06:27', '2022-05-25 04:06:27'),
(173, 1, 'admin/auth/users', 'GET', '180.177.28.147', '[]', '2022-05-25 04:06:27', '2022-05-25 04:06:27'),
(174, 1, 'admin/auth/logout', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:06:34', '2022-05-25 04:06:34'),
(175, 3, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:06:41', '2022-05-25 04:06:41'),
(176, 3, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:06:45', '2022-05-25 04:06:45'),
(177, 3, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 04:07:20', '2022-05-25 04:07:20'),
(178, 3, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 04:08:50', '2022-05-25 04:08:50'),
(179, 3, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 04:10:33', '2022-05-25 04:10:33'),
(180, 3, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:12:54', '2022-05-25 04:12:54'),
(181, 3, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:12:58', '2022-05-25 04:12:58'),
(182, 3, 'admin/auth/logout', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:13:14', '2022-05-25 04:13:14'),
(183, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 04:13:20', '2022-05-25 04:13:20'),
(184, 1, 'admin/auth/roles', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:14:26', '2022-05-25 04:14:26'),
(185, 1, 'admin/auth/users', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:14:27', '2022-05-25 04:14:27'),
(186, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 04:15:37', '2022-05-25 04:15:37'),
(187, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 04:18:21', '2022-05-25 04:18:21'),
(188, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 04:23:39', '2022-05-25 04:23:39'),
(189, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 05:03:24', '2022-05-25 05:03:24'),
(190, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 05:03:28', '2022-05-25 05:03:28'),
(191, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 05:11:17', '2022-05-25 05:11:17'),
(192, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 05:14:47', '2022-05-25 05:14:47'),
(193, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 05:15:58', '2022-05-25 05:15:58'),
(194, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 05:17:58', '2022-05-25 05:17:58'),
(195, 2, 'admin', 'GET', '118.165.137.208', '[]', '2022-05-25 09:47:13', '2022-05-25 09:47:13'),
(196, 2, 'admin', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:47:19', '2022-05-25 09:47:19'),
(197, 2, 'admin/orders', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:47:21', '2022-05-25 09:47:21'),
(198, 2, 'admin/orders', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:47:42', '2022-05-25 09:47:42'),
(199, 2, 'admin/auth/roles', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:48:16', '2022-05-25 09:48:16'),
(200, 2, 'admin', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:48:28', '2022-05-25 09:48:28'),
(201, 2, 'admin/orders', 'GET', '118.165.137.208', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 09:48:28', '2022-05-25 09:48:28'),
(202, 2, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 12:01:51', '2022-05-25 12:01:51'),
(203, 2, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 12:05:29', '2022-05-25 12:05:29'),
(204, 2, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 12:22:35', '2022-05-25 12:22:35'),
(205, 2, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:48:01', '2022-05-25 12:48:01'),
(206, 2, 'admin/auth/logout', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:48:08', '2022-05-25 12:48:08'),
(207, 3, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 12:48:22', '2022-05-25 12:48:22'),
(208, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:48:27', '2022-05-25 12:48:27'),
(209, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:48:28', '2022-05-25 12:48:28'),
(210, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2022-05-25 12:48:54', '2022-05-25 12:48:54'),
(211, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"50\"}', '2022-05-25 12:48:57', '2022-05-25 12:48:57'),
(212, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:49:08', '2022-05-25 12:49:08'),
(213, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:49:10', '2022-05-25 12:49:10'),
(214, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:49:15', '2022-05-25 12:49:15'),
(215, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:49:36', '2022-05-25 12:49:36'),
(216, 3, 'admin/auth/setting', 'PUT', '122.116.144.195', '{\"name\":\"user1\",\"password\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"password_confirmation\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"_token\":\"zzF2s9Zmbqn0jtOMuqcfYSLtOQIlEGWjoZjvYFeW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}', '2022-05-25 12:50:03', '2022-05-25 12:50:03'),
(217, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '[]', '2022-05-25 12:50:04', '2022-05-25 12:50:04'),
(218, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:50:09', '2022-05-25 12:50:09'),
(219, 3, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 12:50:11', '2022-05-25 12:50:11'),
(220, 3, 'admin/auth/logout', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:50:25', '2022-05-25 12:50:25'),
(221, 2, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 12:50:30', '2022-05-25 12:50:30'),
(222, 2, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 12:50:35', '2022-05-25 12:50:35'),
(223, 2, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 13:10:40', '2022-05-25 13:10:40'),
(224, 2, 'admin/auth/logout', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 13:10:46', '2022-05-25 13:10:46'),
(225, 3, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 13:11:00', '2022-05-25 13:11:00'),
(226, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 13:11:02', '2022-05-25 13:11:02'),
(227, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 13:11:03', '2022-05-25 13:11:03'),
(228, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 13:26:43', '2022-05-25 13:26:43'),
(229, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 13:26:47', '2022-05-25 13:26:47'),
(230, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 13:36:41', '2022-05-25 13:36:41'),
(231, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 14:00:06', '2022-05-25 14:00:06'),
(232, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 14:00:09', '2022-05-25 14:00:09'),
(233, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\",\"order_number\":\"2096\",\"name\":null,\"phone\":null,\"email\":null}', '2022-05-25 14:01:38', '2022-05-25 14:01:38'),
(234, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 14:01:39', '2022-05-25 14:01:39'),
(235, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 14:03:42', '2022-05-25 14:03:42'),
(236, 3, 'admin', 'GET', '1.200.246.94', '[]', '2022-05-25 19:04:46', '2022-05-25 19:04:46'),
(237, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:04:53', '2022-05-25 19:04:53'),
(238, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:04:56', '2022-05-25 19:04:56'),
(239, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:04:57', '2022-05-25 19:04:57'),
(240, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:06:46', '2022-05-25 19:06:46'),
(241, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:07:02', '2022-05-25 19:07:02'),
(242, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 19:08:28', '2022-05-25 19:08:28'),
(243, 3, 'admin/auth/logout', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:10:02', '2022-05-25 19:10:02'),
(244, 2, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 19:10:06', '2022-05-25 19:10:06'),
(245, 2, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 19:10:11', '2022-05-25 19:10:11'),
(246, 3, 'admin', 'GET', '114.136.106.224', '[]', '2022-05-25 20:33:17', '2022-05-25 20:33:17'),
(247, 3, 'admin', 'GET', '114.136.106.224', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 20:33:27', '2022-05-25 20:33:27'),
(248, 3, 'admin', 'GET', '114.136.106.224', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 20:33:31', '2022-05-25 20:33:31'),
(249, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 20:33:35', '2022-05-25 20:33:35'),
(250, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-25 21:07:48', '2022-05-25 21:07:48'),
(251, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:07:53', '2022-05-25 21:07:53'),
(252, 1, 'admin/auth/setting', 'PUT', '180.177.28.147', '{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"zIRJPeuOaD9a2Jjmx0RU35pqYM6x2XUF1xgf8cf8\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\"}', '2022-05-25 21:08:10', '2022-05-25 21:08:10'),
(253, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '[]', '2022-05-25 21:08:10', '2022-05-25 21:08:10'),
(254, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:08:15', '2022-05-25 21:08:15'),
(255, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 21:11:30', '2022-05-25 21:11:30'),
(256, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 21:11:35', '2022-05-25 21:11:35'),
(257, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 21:16:07', '2022-05-25 21:16:07'),
(258, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 21:21:15', '2022-05-25 21:21:15'),
(259, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:21:18', '2022-05-25 21:21:18'),
(260, 1, 'admin/auth/setting', 'PUT', '180.177.28.147', '{\"name\":\"Administrator\",\"password\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"password_confirmation\":\"$2y$10$kHQUyPTSnT5N7R6O\\/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa\",\"_token\":\"FOBCkgvg7AafZkZtokg5xHhvwL5mJvCdYKtHCdJ5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}', '2022-05-25 21:21:28', '2022-05-25 21:21:28'),
(261, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '[]', '2022-05-25 21:21:28', '2022-05-25 21:21:28'),
(262, 1, 'admin/auth/setting', 'GET', '180.177.28.147', '[]', '2022-05-25 21:21:30', '2022-05-25 21:21:30'),
(263, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:22:21', '2022-05-25 21:22:21'),
(264, 2, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:22:26', '2022-05-25 21:22:26'),
(265, 2, 'admin/auth/logout', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:22:30', '2022-05-25 21:22:30'),
(266, 3, 'admin', 'GET', '122.116.144.195', '[]', '2022-05-25 21:22:42', '2022-05-25 21:22:42'),
(267, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:22:46', '2022-05-25 21:22:46'),
(268, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:22:47', '2022-05-25 21:22:47'),
(269, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:22:53', '2022-05-25 21:22:53'),
(270, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:49', '2022-05-25 21:23:49'),
(271, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:49', '2022-05-25 21:23:49'),
(272, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:50', '2022-05-25 21:23:50'),
(273, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:51', '2022-05-25 21:23:51'),
(274, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:52', '2022-05-25 21:23:52'),
(275, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:53', '2022-05-25 21:23:53'),
(276, 3, 'admin/orders', 'GET', '122.116.144.195', '[]', '2022-05-25 21:23:54', '2022-05-25 21:23:54'),
(277, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:24:19', '2022-05-25 21:24:19'),
(278, 3, 'admin/auth/setting', 'PUT', '122.116.144.195', '{\"name\":\"user1\",\"password\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"password_confirmation\":\"$2y$10$IGi8Jy5n.81NFoJQQz\\/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW\",\"_token\":\"nfmMT7RFlFnPGjoIQCYrG4Bv20PDhiLlG4hO1JLw\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/35.74.180.176\\/admin\\/orders\"}', '2022-05-25 21:24:34', '2022-05-25 21:24:34'),
(279, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '[]', '2022-05-25 21:24:34', '2022-05-25 21:24:34'),
(280, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:24:41', '2022-05-25 21:24:41'),
(281, 3, 'admin/auth/setting', 'GET', '122.116.144.195', '[]', '2022-05-25 21:24:43', '2022-05-25 21:24:43'),
(282, 3, 'admin', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:25:18', '2022-05-25 21:25:18'),
(283, 3, 'admin/orders', 'GET', '122.116.144.195', '{\"_pjax\":\"#pjax-container\"}', '2022-05-25 21:25:20', '2022-05-25 21:25:20'),
(284, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-25 21:41:24', '2022-05-25 21:41:24'),
(285, 3, 'admin', 'GET', '123.194.169.181', '[]', '2022-05-26 01:19:42', '2022-05-26 01:19:42'),
(286, 3, 'admin/orders', 'GET', '123.194.169.181', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 01:19:59', '2022-05-26 01:19:59'),
(287, 3, 'admin/orders', 'GET', '111.241.5.142', '[]', '2022-05-26 10:10:30', '2022-05-26 10:10:30'),
(288, 3, 'admin/orders', 'GET', '111.241.5.142', '{\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 10:10:45', '2022-05-26 10:10:45'),
(289, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 11:39:29', '2022-05-26 11:39:29'),
(290, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:40:21', '2022-05-26 11:40:21'),
(291, 3, 'admin', 'GET', '101.12.101.20', '[]', '2022-05-26 11:41:46', '2022-05-26 11:41:46'),
(292, 3, 'admin/orders', 'GET', '101.12.101.20', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:41:58', '2022-05-26 11:41:58'),
(293, 3, 'admin/orders', 'GET', '101.12.101.20', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:41:59', '2022-05-26 11:41:59'),
(294, 3, 'admin', 'GET', '111.235.229.239', '[]', '2022-05-26 11:42:01', '2022-05-26 11:42:01'),
(295, 3, 'admin/orders', 'GET', '101.12.101.20', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 11:42:21', '2022-05-26 11:42:21'),
(296, 3, 'admin/orders', 'GET', '111.235.229.239', '[]', '2022-05-26 11:44:38', '2022-05-26 11:44:38'),
(297, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:44:46', '2022-05-26 11:44:46'),
(298, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:44:47', '2022-05-26 11:44:47'),
(299, 3, 'admin', 'GET', '111.235.229.239', '[]', '2022-05-26 11:45:48', '2022-05-26 11:45:48'),
(300, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:46:02', '2022-05-26 11:46:02'),
(301, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:50:33', '2022-05-26 11:50:33'),
(302, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 11:56:07', '2022-05-26 11:56:07'),
(303, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 11:57:07', '2022-05-26 11:57:07'),
(304, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"page\":\"2\"}', '2022-05-26 11:59:00', '2022-05-26 11:59:00'),
(305, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 12:01:36', '2022-05-26 12:01:36'),
(306, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 12:01:45', '2022-05-26 12:01:45'),
(307, 3, 'admin', 'GET', '111.235.229.239', '[]', '2022-05-26 12:03:41', '2022-05-26 12:03:41'),
(308, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 12:03:44', '2022-05-26 12:03:44'),
(309, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 12:03:45', '2022-05-26 12:03:45'),
(310, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 12:03:47', '2022-05-26 12:03:47'),
(311, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 12:04:01', '2022-05-26 12:04:01'),
(312, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 13:41:45', '2022-05-26 13:41:45'),
(313, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-26 15:00:03', '2022-05-26 15:00:03'),
(314, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:00:07', '2022-05-26 15:00:07'),
(315, 3, 'admin/orders', 'GET', '111.241.5.142', '[]', '2022-05-26 15:00:51', '2022-05-26 15:00:51'),
(316, 3, 'admin', 'GET', '1.200.246.94', '[]', '2022-05-26 15:04:23', '2022-05-26 15:04:23'),
(317, 3, 'admin/orders', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:04:29', '2022-05-26 15:04:29'),
(318, 3, 'admin/orders', 'GET', '111.235.229.239', '[]', '2022-05-26 15:11:20', '2022-05-26 15:11:20'),
(319, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:11:30', '2022-05-26 15:11:30'),
(320, 3, 'admin', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:15:40', '2022-05-26 15:15:40'),
(321, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:15:42', '2022-05-26 15:15:42'),
(322, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:15:44', '2022-05-26 15:15:44'),
(323, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 15:15:54', '2022-05-26 15:15:54'),
(324, 3, 'admin', 'GET', '1.200.246.94', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:16:04', '2022-05-26 15:16:04'),
(325, 3, 'admin/auth/login', 'GET', '1.200.246.94', '[]', '2022-05-26 15:16:05', '2022-05-26 15:16:05'),
(326, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"page\":\"2\"}', '2022-05-26 15:16:14', '2022-05-26 15:16:14'),
(327, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:16:31', '2022-05-26 15:16:31'),
(328, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:16:34', '2022-05-26 15:16:34'),
(329, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"page\":\"2\"}', '2022-05-26 15:16:36', '2022-05-26 15:16:36'),
(330, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:16:55', '2022-05-26 15:16:55'),
(331, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:17:00', '2022-05-26 15:17:00'),
(332, 3, 'admin', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:17:48', '2022-05-26 15:17:48'),
(333, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:17:50', '2022-05-26 15:17:50'),
(334, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_columns_\":\"address,allprice,created_at,delivery_fee,email,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:18:02', '2022-05-26 15:18:02'),
(335, 3, 'admin/orders', 'GET', '111.235.229.239', '{\"_columns_\":\"address,allprice,created_at,delivery_fee,email,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 15:18:11', '2022-05-26 15:18:11'),
(336, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 15:42:53', '2022-05-26 15:42:53'),
(337, 3, 'admin/orders', 'GET', '60.251.183.118', '[]', '2022-05-26 15:56:34', '2022-05-26 15:56:34'),
(338, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 15:56:39', '2022-05-26 15:56:39'),
(339, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 16:00:13', '2022-05-26 16:00:13'),
(340, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 16:00:18', '2022-05-26 16:00:18'),
(341, 3, 'admin/orders', 'GET', '111.241.5.142', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 16:00:31', '2022-05-26 16:00:31'),
(342, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 16:01:18', '2022-05-26 16:01:18'),
(343, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 16:01:19', '2022-05-26 16:01:19'),
(344, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 16:01:20', '2022-05-26 16:01:20'),
(345, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2022-05-26 16:01:28', '2022-05-26 16:01:28'),
(346, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 16:02:36', '2022-05-26 16:02:36'),
(347, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 16:02:40', '2022-05-26 16:02:40'),
(348, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 16:03:23', '2022-05-26 16:03:23'),
(349, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 16:03:26', '2022-05-26 16:03:26'),
(350, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 16:56:34', '2022-05-26 16:56:34'),
(351, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 16:57:39', '2022-05-26 16:57:39'),
(352, 3, 'admin/orders', 'GET', '60.251.183.118', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 16:57:52', '2022-05-26 16:57:52'),
(353, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-26 17:52:33', '2022-05-26 17:52:33'),
(354, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 17:52:36', '2022-05-26 17:52:36'),
(355, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":\"MING\",\"phone\":null,\"email\":null}', '2022-05-26 17:54:42', '2022-05-26 17:54:42'),
(356, 3, 'admin/orders', 'GET', '111.241.5.142', '[]', '2022-05-26 17:54:56', '2022-05-26 17:54:56'),
(357, 3, 'admin/orders', 'GET', '111.241.5.142', '{\"order_number\":null,\"name\":\"\\u5ed6\\u535a\\u5f18\",\"phone\":null,\"email\":null,\"_pjax\":\"#pjax-container\"}', '2022-05-26 17:55:19', '2022-05-26 17:55:19'),
(358, 3, 'admin/orders', 'GET', '111.235.229.239', '[]', '2022-05-26 18:08:12', '2022-05-26 18:08:12'),
(359, 3, 'admin/orders', 'GET', '114.136.106.224', '[]', '2022-05-26 19:14:56', '2022-05-26 19:14:56'),
(360, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 19:15:01', '2022-05-26 19:15:01'),
(361, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 19:16:40', '2022-05-26 19:16:40');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(362, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"page\":\"3\",\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 19:16:57', '2022-05-26 19:16:57'),
(363, 3, 'admin/orders', 'GET', '114.136.106.224', '{\"_columns_\":\"address,created_at,delivery_fee,email,id,name,order_number,phone,total\",\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 19:17:13', '2022-05-26 19:17:13'),
(364, 1, 'admin', 'GET', '180.177.28.147', '[]', '2022-05-26 19:19:30', '2022-05-26 19:19:30'),
(365, 1, 'admin/orders', 'GET', '180.177.28.147', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 19:19:33', '2022-05-26 19:19:33'),
(366, 1, 'admin/orders', 'GET', '180.177.28.147', '[]', '2022-05-26 19:24:54', '2022-05-26 19:24:54'),
(367, 1, 'admin/auth/login', 'GET', '172.25.0.1', '[]', '2022-05-26 20:07:16', '2022-05-26 20:07:16'),
(368, 1, 'admin', 'GET', '172.25.0.1', '[]', '2022-05-26 20:07:16', '2022-05-26 20:07:16'),
(369, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 20:07:19', '2022-05-26 20:07:19'),
(370, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2022-05-26 20:07:23', '2022-05-26 20:07:23'),
(371, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2022-05-26 20:07:25', '2022-05-26 20:07:25'),
(372, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2022-05-26 20:07:28', '2022-05-26 20:07:28'),
(373, 1, 'admin', 'GET', '172.25.0.1', '[]', '2022-05-26 20:13:25', '2022-05-26 20:13:25'),
(374, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 20:13:28', '2022-05-26 20:13:28'),
(375, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2022-05-26 20:13:39', '2022-05-26 20:13:39'),
(376, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 20:13:42', '2022-05-26 20:13:42'),
(377, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:25:18', '2022-05-26 20:25:18'),
(378, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:40:53', '2022-05-26 20:40:53'),
(379, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"ab55cb2719114d17bf635963930c28e0\":null,\"is_paied\":\"1\",\"_pjax\":\"#pjax-container\"}', '2022-05-26 20:41:39', '2022-05-26 20:41:39'),
(380, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"ab55cb2719114d17bf635963930c28e0\":null,\"is_paied\":\"2\"}', '2022-05-26 20:41:42', '2022-05-26 20:41:42'),
(381, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"ab55cb2719114d17bf635963930c28e0\":null,\"is_paied\":\"3\"}', '2022-05-26 20:41:45', '2022-05-26 20:41:45'),
(382, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 20:41:46', '2022-05-26 20:41:46'),
(383, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:42:12', '2022-05-26 20:42:12'),
(384, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:46:12', '2022-05-26 20:46:12'),
(385, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:46:42', '2022-05-26 20:46:42'),
(386, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:46:55', '2022-05-26 20:46:55'),
(387, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:47:13', '2022-05-26 20:47:13'),
(388, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:47:21', '2022-05-26 20:47:21'),
(389, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:47:27', '2022-05-26 20:47:27'),
(390, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:48:03', '2022-05-26 20:48:03'),
(391, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 20:49:09', '2022-05-26 20:49:09'),
(392, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:02:13', '2022-05-26 22:02:13'),
(393, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:21:59', '2022-05-26 22:21:59'),
(394, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:25:10', '2022-05-26 22:25:10'),
(395, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:25:12', '2022-05-26 22:25:12'),
(396, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:28:33', '2022-05-26 22:28:33'),
(397, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:30:21', '2022-05-26 22:30:21'),
(398, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:40:00', '2022-05-26 22:40:00'),
(399, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:41:45', '2022-05-26 22:41:45'),
(400, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:45:27', '2022-05-26 22:45:27'),
(401, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:46:20', '2022-05-26 22:46:20'),
(402, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:47:11', '2022-05-26 22:47:11'),
(403, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:48:30', '2022-05-26 22:48:30'),
(404, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 22:49:01', '2022-05-26 22:49:01'),
(405, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:02:56', '2022-05-26 23:02:56'),
(406, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:03:33', '2022-05-26 23:03:33'),
(407, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:03:59', '2022-05-26 23:03:59'),
(408, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:04:11', '2022-05-26 23:04:11'),
(409, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:05:03', '2022-05-26 23:05:03'),
(410, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:05:32', '2022-05-26 23:05:32'),
(411, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:05:47', '2022-05-26 23:05:47'),
(412, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:06:24', '2022-05-26 23:06:24'),
(413, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:08:17', '2022-05-26 23:08:17'),
(414, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:10:36', '2022-05-26 23:10:36'),
(415, 1, 'admin', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:10:38', '2022-05-26 23:10:38'),
(416, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:10:39', '2022-05-26 23:10:39'),
(417, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:11:28', '2022-05-26 23:11:28'),
(418, 1, 'admin', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:11:31', '2022-05-26 23:11:31'),
(419, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:11:31', '2022-05-26 23:11:31'),
(420, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:08', '2022-05-26 23:12:08'),
(421, 1, 'admin', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:12:10', '2022-05-26 23:12:10'),
(422, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:10', '2022-05-26 23:12:10'),
(423, 1, 'admin/auth/menu', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:12:24', '2022-05-26 23:12:24'),
(424, 1, 'admin/auth/menu/1', 'DELETE', '172.25.0.1', '{\"_method\":\"delete\",\"_token\":\"ZMFSqUtdlTEOTD1MR2QvksjhYJzkscrn7F12WMiH\"}', '2022-05-26 23:12:30', '2022-05-26 23:12:30'),
(425, 1, 'admin/auth/menu', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:12:30', '2022-05-26 23:12:30'),
(426, 1, 'admin/auth/menu', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:33', '2022-05-26 23:12:33'),
(427, 1, 'admin', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:38', '2022-05-26 23:12:38'),
(428, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:38', '2022-05-26 23:12:38'),
(429, 1, 'admin', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-26 23:12:44', '2022-05-26 23:12:44'),
(430, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:12:44', '2022-05-26 23:12:44'),
(431, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:13:20', '2022-05-26 23:13:20'),
(432, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:13:33', '2022-05-26 23:13:33'),
(433, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:14:52', '2022-05-26 23:14:52'),
(434, 1, 'admin/orders', 'GET', '172.25.0.1', '[]', '2022-05-26 23:15:10', '2022-05-26 23:15:10'),
(435, 1, 'admin', 'GET', '172.28.0.1', '[]', '2022-05-27 00:29:50', '2022-05-27 00:29:50'),
(436, 1, 'admin/orders', 'GET', '172.28.0.1', '[]', '2022-05-27 00:29:51', '2022-05-27 00:29:51'),
(437, 1, 'admin/orders', 'GET', '172.28.0.1', '[]', '2022-05-27 00:31:56', '2022-05-27 00:31:56'),
(438, 1, 'admin/orders', 'GET', '172.28.0.1', '[]', '2022-05-27 00:33:53', '2022-05-27 00:33:53'),
(439, 1, 'admin/orders', 'GET', '172.28.0.1', '[]', '2022-05-27 00:37:32', '2022-05-27 00:37:32'),
(440, 1, 'admin/orders', 'GET', '172.28.0.1', '{\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"is_paied\":\"3\",\"_pjax\":\"#pjax-container\"}', '2022-05-27 00:38:36', '2022-05-27 00:38:36'),
(441, 1, 'admin/orders', 'GET', '172.28.0.1', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":null,\"phone\":null,\"email\":null,\"is_paied\":\"2\"}', '2022-05-27 00:38:40', '2022-05-27 00:38:40'),
(442, 1, 'admin/orders', 'GET', '172.28.0.1', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":null,\"phone\":null,\"email\":\"bliaou\",\"is_paied\":null}', '2022-05-27 00:39:04', '2022-05-27 00:39:04'),
(443, 1, 'admin/orders', 'GET', '172.28.0.1', '{\"_pjax\":\"#pjax-container\",\"order_number\":null,\"name\":null,\"phone\":null,\"email\":\"bliaou\",\"is_paied\":\"2\"}', '2022-05-27 00:39:12', '2022-05-27 00:39:12'),
(444, 1, 'admin/orders', 'GET', '172.28.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-05-27 00:39:20', '2022-05-27 00:39:20');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'order', 'order', '', '/orders*', '2022-05-25 01:09:35', '2022-05-25 01:09:53');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2022-05-18 08:33:04', '2022-05-18 08:33:04'),
(2, '成員', 'member', '2022-05-18 08:52:41', '2022-05-18 08:52:41');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(2, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL),
(2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$kHQUyPTSnT5N7R6O/HFwHOcJrCakpn0rnFXZNL8YkNQaP6BI72PNa', 'Administrator', 'images/1082597.png', 'JYjBE1katPwmZT35hNSQ991oWGkPYcoolspzYn3Xct6WYzr7t2GqaJvk2Jne', '2022-05-18 08:33:04', '2022-05-18 08:37:23'),
(2, 'bliaou', '$2y$10$2fmgNQyYX2x3XSjcIR8yyOzDMcLofIrWOXkz7R0GFQYu70CUECCCC', 'bliaou', NULL, 'pktGLWw5JzDeVjmDSijN87nYHCYDpuFQy7I7FFQjdHStMHUwUnKcCu4yQh2T', '2022-05-18 08:55:07', '2022-05-25 04:06:27'),
(3, 'user1', '$2y$10$IGi8Jy5n.81NFoJQQz/Hseu7Dd2J76FoiDp8cImBQIzKaNspOqaiW', 'user1', 'images/items_sec1_img4.png', 'P8rdthHxN8rEeBIO5dKqf913NZolSJTI6q45wo5l0gzrgwzKjEIhId9jjTaq', '2022-05-25 04:03:46', '2022-05-25 12:50:04');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(74, '2022_05_22_120853_create_orders_table', 2),
(75, '2022_05_22_171643_create_order_items_table', 2),
(76, '2022_05_23_215801_create_payment_requests_table', 2),
(77, '2022_05_23_220022_create_payment_responses_table', 2),
(80, '2022_05_26_193954_add_is_paid_to_orders_table', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reuse_self` tinyint(4) NOT NULL,
  `reuse_self_delivery` tinyint(4) NOT NULL,
  `reuse_self_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reuse_self_memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliver` tinyint(4) NOT NULL,
  `receipt` tinyint(4) NOT NULL,
  `corpName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxIDnumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01',
  `delivery_fee` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_paied` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `WebNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ECPlatform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverTel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReceiverEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AtmRespost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeadLine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayEN` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EPT` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PassCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderInfo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `payment_responses`
--

CREATE TABLE `payment_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_request_id` bigint(20) UNSIGNED NOT NULL,
  `BuysafeNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PassCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TotalPrice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PayType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TranStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `WebNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ErrDesc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_no4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Card_Foreign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DueDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ATMNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BankCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BranchCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BarCode3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
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
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- 資料表索引 `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- 資料表索引 `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- 資料表索引 `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- 資料表索引 `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- 資料表索引 `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- 資料表索引 `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- 資料表索引 `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- 資料表索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `payment_responses`
--
ALTER TABLE `payment_responses`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `payment_responses`
--
ALTER TABLE `payment_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
