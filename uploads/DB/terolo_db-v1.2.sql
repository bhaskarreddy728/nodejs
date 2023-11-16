-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2022 at 04:19 PM
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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `invoiceNumber` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `customerId` int(11) UNSIGNED DEFAULT NULL,
  `invoiceDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `totalAmt` decimal(10,2) NOT NULL,
  `dueAmt` decimal(10,2) NOT NULL,
  `taxValue` decimal(5,2) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `shippingAddress` varchar(255) DEFAULT NULL,
  `list_items` int(11) UNSIGNED DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores invoices data';

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoiceNumber`, `userId`, `customerId`, `invoiceDate`, `dueDate`, `totalAmt`, `dueAmt`, `taxValue`, `discount`, `shippingAddress`, `list_items`, `shippingCharge`, `notes`, `terms`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'a44a5201-fc5a-48c7-85fd-a02bd1db90ae', 1, 0, '2022-09-26', '2022-09-27', '10000.00', '100.00', '999.99', 0, '', 0, '0.00', '', '', 0, '2022-09-26 14:46:25.589', NULL, '2022-09-26 14:46:25.589'),
(2, 'e98d82ce-cfc0-4d9d-9b07-c9bbadcd24e2', 6, 0, '2022-09-27', '2022-09-28', '10000.00', '100.00', '999.99', 10, '', 0, '0.00', '', '', 0, '2022-09-26 14:47:13.969', NULL, '2022-09-26 14:47:13.969');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `token` varchar(255) DEFAULT NULL,
  `userId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "users" table',
  `tokenType` enum('refresh','resetPassword','verifyEmail') DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `blacklisted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores tokens data';

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `userId`, `tokenType`, `expires`, `blacklisted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE2ODc3MywiZXhwIjoxNjY0MTY5MzczLCJ0eXBlIjoicmVzZXRQYXNzd29yZCJ9.ZDg8iNjFPv8tPm-otw1YEfYUkMntp4K6yPs20xuQ2kg', 1, 'resetPassword', '2022-09-26 05:16:13', 0, 1, '2022-09-26 05:06:13.701', NULL, '2022-09-26 05:06:13.701'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE2OTAwMSwiZXhwIjoxNjY2NzYxMDAxLCJ0eXBlIjoicmVmcmVzaCJ9.PTjC3U_CakPBKd1X1_YQSAlbOvZgr86_QgAnXbdNGD8', 1, 'refresh', '2022-10-26 05:10:01', 0, 1, '2022-09-26 05:10:01.759', NULL, '2022-09-26 05:10:01.759'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2NDE2OTMzMSwiZXhwIjoxNjY2NzYxMzMxLCJ0eXBlIjoicmVmcmVzaCJ9.SfH3dzKpcEIigkrtXeZI3bpc4Aa5ySpnaii-ktHXO1Q', 4, 'refresh', '2022-10-26 05:15:31', 0, 4, '2022-09-26 05:15:31.153', NULL, '2022-09-26 05:15:31.153'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3MDEwMywiZXhwIjoxNjY0MTcwNzAzLCJ0eXBlIjoicmVzZXRQYXNzd29yZCJ9.-jv4uUwuX0S5O0EzcuyLM55IpYu0czm1R4TJzQQ7yI0', 1, 'resetPassword', '2022-09-26 05:38:23', 0, 1, '2022-09-26 05:28:23.821', NULL, '2022-09-26 05:28:23.821'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3MjE4OSwiZXhwIjoxNjY2NzY0MTg5LCJ0eXBlIjoicmVmcmVzaCJ9.FQaWDkMg4eysjwl_3jce0_86TuR84jKyNJn59Dxby_U', 1, 'refresh', '2022-10-26 06:03:09', 0, 1, '2022-09-26 06:03:09.876', NULL, '2022-09-26 06:03:09.876'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3MjMyOSwiZXhwIjoxNjY2NzY0MzI5LCJ0eXBlIjoicmVmcmVzaCJ9.w41yLZKyS-iaHXgXY-UOqZQb0R3VwoV8sPGg5nVlldo', 1, 'refresh', '2022-10-26 06:05:29', 0, 1, '2022-09-26 06:05:29.532', NULL, '2022-09-26 06:05:29.532'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3MjM0NiwiZXhwIjoxNjY0MTcyOTQ2LCJ0eXBlIjoidmVyaWZ5RW1haWwifQ.2G1yqxK24IFbz0vKAivGRLVswGT5PxT6lnvxW9BwSIA', 1, 'verifyEmail', '2022-09-26 06:15:46', 0, 1, '2022-09-26 06:05:46.049', NULL, '2022-09-26 06:05:46.049'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjUsImlhdCI6MTY2NDE3MjYzNywiZXhwIjoxNjY2NzY0NjM3LCJ0eXBlIjoicmVmcmVzaCJ9.t8KhCyiGGYAFz-8ZpCpbyPVgdlxDpXJcBzA2gAgEiKQ', 5, 'refresh', '2022-10-26 06:10:37', 0, 5, '2022-09-26 06:10:38.002', NULL, '2022-09-26 06:10:38.002'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjUsImlhdCI6MTY2NDE3MjY2MCwiZXhwIjoxNjY0MTczMjYwLCJ0eXBlIjoidmVyaWZ5RW1haWwifQ.qHiyDXSA0O2X3-gu6FjQYfvO_WR0YxgUp1lRJSPUEnw', 5, 'verifyEmail', '2022-09-26 06:21:00', 0, 5, '2022-09-26 06:11:00.787', NULL, '2022-09-26 06:11:00.787'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjUsImlhdCI6MTY2NDE3Mjc3MCwiZXhwIjoxNjY2NzY0NzcwLCJ0eXBlIjoicmVmcmVzaCJ9.rhBCzSeIiyggxpP3LkKrd-fB9-v_ZN0Q-2_Jn0i78z0', 5, 'refresh', '2022-10-26 06:12:50', 0, 5, '2022-09-26 06:12:50.954', NULL, '2022-09-26 06:12:50.954'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjUsImlhdCI6MTY2NDE3Mjc4NiwiZXhwIjoxNjY0MTczMzg2LCJ0eXBlIjoidmVyaWZ5RW1haWwifQ.jlu3U3TSM81U7EcsAsMXbECmO0rau68E-GO_rGfNxo4', 5, 'verifyEmail', '2022-09-26 06:23:06', 0, 5, '2022-09-26 06:13:06.710', NULL, '2022-09-26 06:13:06.710'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3MjgzMCwiZXhwIjoxNjY2NzY0ODMwLCJ0eXBlIjoicmVmcmVzaCJ9.di8AsYAmGuQTWKdbBWVgdY54pyTtG3Tpxizu0Z5Pp9Q', 1, 'refresh', '2022-10-26 06:13:50', 0, 1, '2022-09-26 06:13:50.489', NULL, '2022-09-26 06:13:50.489'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE3Mjg0OCwiZXhwIjoxNjY0MTczNDQ4LCJ0eXBlIjoidmVyaWZ5RW1haWwifQ.j7xh9YuwRs8BwHGO_9F2OWFBOF9I5X9N8TiD68Qh2qc', 1, 'verifyEmail', '2022-09-26 06:24:08', 0, 1, '2022-09-26 06:14:08.062', NULL, '2022-09-26 06:14:08.062'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsImlhdCI6MTY2NDE3Mjk3OSwiZXhwIjoxNjY2NzY0OTc5LCJ0eXBlIjoicmVmcmVzaCJ9.GIheSTrgI0fVMwB65s_wdo8rgmJg-rPKsHtoHeg36uE', 3, 'refresh', '2022-10-26 06:16:19', 0, 3, '2022-09-26 06:16:19.214', NULL, '2022-09-26 06:16:19.214'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsImlhdCI6MTY2NDE3Mjk5MywiZXhwIjoxNjY0MTczNTkzLCJ0eXBlIjoidmVyaWZ5RW1haWwifQ.tKTTqf4Y019EJ6F1rJfFznOlumLdCkFfOASibK4HgLc', 3, 'verifyEmail', '2022-09-26 06:26:33', 0, 3, '2022-09-26 06:16:33.790', NULL, '2022-09-26 06:16:33.790'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2NDE4MjE4MywiZXhwIjoxNjY0MTgyNzgzLCJ0eXBlIjoicmVzZXRQYXNzd29yZCJ9.ocYq2u8qgxky5FpnVi-MdI7s6uXboBqItT9U_t0waCI', 4, 'resetPassword', '2022-09-26 08:59:43', 0, 4, '2022-09-26 08:49:43.569', NULL, '2022-09-26 08:49:43.569'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDE4MTM3NiwiZXhwIjoxNjY0MTgxOTc2LCJ0eXBlIjoicmVzZXRQYXNzd29yZCJ9.x_IXVP73txNsVY86tCDGTOGkx-MzCLn21ut97XPSK7I', 1, 'resetPassword', '2022-09-26 08:46:16', 0, 1, '2022-09-26 08:36:16.052', NULL, '2022-09-26 08:36:16.052'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjMsImlhdCI6MTY2NDIwMjg1OSwiZXhwIjoxNjY2Nzk0ODU5LCJ0eXBlIjoicmVmcmVzaCJ9.ygdGJ8wTYTZ_FV_hu0eSDtnXwt7fUiks73f1EAS4nKk', 3, 'refresh', '2022-10-26 14:34:19', 0, 3, '2022-09-26 14:34:19.232', NULL, '2022-09-26 14:34:19.232'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2NDIwMjkyMywiZXhwIjoxNjY2Nzk0OTIzLCJ0eXBlIjoicmVmcmVzaCJ9.HEctg2TWSgO_WyaV3kLDETm8WjfrWKHnEOsYZ55VNCE', 1, 'refresh', '2022-10-26 14:35:23', 0, 1, '2022-09-26 14:35:23.841', NULL, '2022-09-26 14:35:23.841');

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
  `userStatus` enum('Active','in-active') NOT NULL DEFAULT 'Active',
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
(1, 'vimal', 'veeramvr003@gmail.com', '$2a$08$B1rzohb32TECeqGLLGXtfu9crkpBX3ftYuV9JSxlxJiMkRUwkNJx2', 'admin', 'Active', 1, 0, '2022-09-23 06:22:34.834', NULL, '2022-09-23 06:22:34.834'),
(3, 'Gokul', 'gokulrajthangavel1998@gmail.com', '$2a$08$Y0gOKZhMA49v0db9UfZdPOuALBcQ55DKFYf1/bCVIjlJf9eilYZyS', 'user', 'Active', 0, 0, '2022-09-23 05:38:29.786', NULL, '2022-09-23 05:38:29.786'),
(4, 'Abi', 'abishekk98@gmail.com', '$2a$08$6Bc2U5pB60XBYKRBX0/vOud7SYaZc.reNMG2nkWbQhaUwSfRQ49aG', 'superAdmin', 'Active', 0, 0, '2022-09-23 05:39:01.854', NULL, '2022-09-23 05:39:01.854'),
(5, 'Madan', 'vimalvr003@gmail.com', '$2a$08$NzVeNNjUGZvS/dx1cjb9tudjJeZODCvNHnRSjKSU88R5Yi0aYmz3O', 'superAdmin', 'Active', 0, 0, '2022-09-26 05:10:24.451', NULL, '2022-09-26 05:10:24.451');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
