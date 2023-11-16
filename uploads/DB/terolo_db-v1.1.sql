-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2022 at 10:44 AM
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

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `userId`, `tokenType`, `expires`, `blacklisted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VycyI6eyJpZCI6MSwiY3JlYXRlZEF0IjoiMjAyMi0wOS0yMVQwOToxMTowMi41NjVaIn0sImlhdCI6MTY2Mzc1MTQ2MiwiZXhwIjoxNjY2MzQzNDYyLCJ0eXBlIjoicmVmcmVzaCJ9.QoqgKt48yNOoxwUtIX4c6FpIjibP4jjh5_tadvMDU6U', 1, 'refresh', '2022-10-21 09:11:02', 0, 1, '2022-09-21 09:11:02.570', NULL, '2022-09-21 09:11:02.570');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Encrypted password',
  `roleName` enum('user','admin','superAdmin') NOT NULL DEFAULT 'user',
  `userStatus` enum('Active','in-active') NOT NULL DEFAULT 'in-active',
  `isEmailVerified` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores users data';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `roleName`, `userStatus`, `isEmailVerified`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'vimal', 'vimalvr003@gmail.com', '$2a$08$nNZKt7IafE8zOF2gfbcM2.DHgaP/XH0yol3brTKIbrkstlgwuUBB.', 'user', 'in-active', 0, 0, '2022-09-21 09:11:02.556', NULL, '2022-09-21 09:11:02.556');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
