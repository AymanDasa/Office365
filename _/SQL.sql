-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 03:24 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `office365`
--

-- --------------------------------------------------------

--
-- Table structure for table `cc`
--

CREATE TABLE `cc` (
  `id_cc` int(10) NOT NULL,
  `cc_name` varchar(100) NOT NULL,
  `cc_code` varchar(100) NOT NULL,
  `cc_div` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'text',
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `value`, `type`, `active`) VALUES
(1, 'Activate2FA', '0', 'text', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `id` int(10) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_last` varchar(100) NOT NULL,
  `emp_cc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'text',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `xhtml` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `name`, `value`, `type`, `active`, `xhtml`) VALUES
(1, 'companyLogo', 'zosco.png', 'text', 1, 0),
(2, 'companyXLogo', NULL, 'text', 1, 0),
(3, 'companySlog', NULL, 'text', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lic`
--

CREATE TABLE `lic` (
  `lic_id` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `dept` int(10) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `type` int(10) NOT NULL,
  `note` text NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_changes` timestamp NOT NULL DEFAULT current_timestamp(),
  `hide` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(10) NOT NULL,
  `status_code` int(10) NOT NULL,
  `status_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_admin` int(11) DEFAULT 0,
  `max_list` varchar(10) NOT NULL DEFAULT '100',
  `is_active` int(11) NOT NULL DEFAULT 1,
  `clear_pass` varchar(50) DEFAULT NULL,
  `user_2fa_enable` int(11) DEFAULT 0,
  `user_2fa_secret` varchar(50) DEFAULT NULL,
  `user_2fa_code` varchar(50) DEFAULT NULL,
  `signature` varchar(20) NOT NULL DEFAULT 'nosignature.png',
  `signature_location` int(10) NOT NULL,
  `debug` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `f_name`, `l_name`, `avatar`, `created_at`, `is_admin`, `max_list`, `is_active`, `clear_pass`, `user_2fa_enable`, `user_2fa_secret`, `user_2fa_code`, `signature`, `signature_location`, `debug`) VALUES
(1, 'aymanoz', '$2y$10$Ianl25aGLKaDwlYcaaminubcrSvU.KcnjXAWiCyuXMPXw0ctnUOhG', 'Ayman', 'Dasa', '1_aymanoz.png', '2022-05-17 19:21:05', 1, '25', 1, '1234512345', 1, 'MWKNBQFWARLMJPNQ', '', '1_aymanoz.png', 0, 0),
(4, 'admin', '$2y$10$YLmOh1mihx620toUI5kH9ObzGUDVCbi3bnd2YnPwFPvj9RVlmFuSW', 'sys', 'admin', '', '2024-01-07 14:33:17', 1, '100', 1, '123456', 1, 'UCIZBRRRGVHTBMYV', NULL, 'nosignature.png', 0, 0),
(7, 'adomom', '$2y$10$jJ7.cCywCGJCUY.DWhFbxO/DcSNKS.ycw7tFcl4tH8AtopkVgrzLK', 'Ahmad', 'Dooom', '', '2024-01-13 12:12:59', 0, '100', 1, '123456', 0, NULL, NULL, 'nosignature.png', 0, 0),
(8, 'abc', '$2y$10$.cevWGeGomvl/4pdiL586uLc8osYKHIRP6Pz2dqJj4CNC/TsHmYO.', 'abc', 'abc', '', '2024-02-18 13:05:00', 0, '100', 1, '1234567890', 1, 'AZOSDTAPUNTFMIAF', NULL, 'nosignature.png', 0, 1),
(9, 'syed', '$2y$10$zZSslISjSOUeAJHznVSHC.y9uXzovgo3E9XK5rn0MpdXagdpX4P7e', 'Syed', 'Asad', '', '2024-02-18 14:25:57', 0, '100', 1, 'Asad1415', 1, 'PDGGSFKICJNCPJME', NULL, 'nosignature.png', 0, 0),
(10, 'Samer', '$2y$10$5.PTuDicdDhsZRiaFV3WIO3DOB3EbQDHQ5Bs9bZ2uSDWfYcDnGk22', 'Samer', 'quraish', '', '2024-02-20 16:36:23', 0, '100', 1, 'Retal123', 1, 'PVLRHQQUUHVXLXSV', NULL, 'nosignature.png', 0, 0),
(11, 'Gnader81', '$2y$10$COhMGamDZVnd2SMXldgKgOPrekpn3r9ys2ON4KGCReH7aN8ktwJj2', 'Gamal', 'Nader', '', '2024-02-20 16:40:34', 0, '100', 1, 'G81nader', 1, 'HTTPNRASDWTPCRSH', NULL, 'nosignature.png', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc`
--
ALTER TABLE `cc`
  ADD PRIMARY KEY (`id_cc`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lic`
--
ALTER TABLE `lic`
  ADD PRIMARY KEY (`lic_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc`
--
ALTER TABLE `cc`
  MODIFY `id_cc` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lic`
--
ALTER TABLE `lic`
  MODIFY `lic_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
