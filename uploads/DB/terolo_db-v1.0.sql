-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 03:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `terolo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `token` varchar(255) DEFAULT NULL,
  `userId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "user_masters" table',
  `tokenType` enum('refresh','resetPassword','verifyEmail') DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `blacklisted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores tokens data';

-- --------------------------------------------------------

--
-- Table structure for table `user_masters`
--

CREATE TABLE `user_masters` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Encrypted password',
  `roleName` enum('user','admin') NOT NULL DEFAULT 'user',
  `userStatus` enum('Active','in-active') NOT NULL DEFAULT 'in-active',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores users data';

--
-- Dumping data for table `user_masters`
--

INSERT INTO `user_masters` (`id`, `name`, `email`, `password`, `roleName`, `userStatus`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'vimal', 'vimal@gmail.com', '$2a$08$B3uG5OpZQTHKOOZ6kFPgIO5Lv1Mw/1LiHUUM1vBoxRhhZNwOXtFPy', 'user', 'in-active', 0, '2022-09-19 09:04:17.150', NULL, '2022-09-19 09:04:17.150'),
(2, 'vimal', 'vimalvr003@gmail.com', '$2a$08$NI4m270wPu.8o9igHHASW.j5veR1gcnA0c51m4TKDctsTC2IhOWRi', 'user', 'in-active', 0, '2022-09-19 09:12:10.312', NULL, '2022-09-19 09:12:10.312');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_masters`
--
ALTER TABLE `user_masters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `user_masters`
--
ALTER TABLE `user_masters`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
