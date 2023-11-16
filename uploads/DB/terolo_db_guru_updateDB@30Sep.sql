-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2022 at 03:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `company_full_name` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdAt` datetime(3) DEFAULT current_timestamp(3),
  `updatedBy` int(11) DEFAULT NULL,
  `updatedAt` datetime(3) DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address`, `company_full_name`, `country_id`, `state_id`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'kerala', 'Thinroot private limited', 23, 23, NULL, '2022-09-30 09:47:59.183', NULL, '2022-09-30 09:47:59.183'),
(2, 'kerala', 'Mak software private limited', 23, 23, NULL, '2022-09-30 09:48:36.712', NULL, '2022-09-30 09:48:36.712');

-- --------------------------------------------------------

--
-- Table structure for table `business_category`
--

CREATE TABLE `business_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `business_category_name` varchar(100) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business category data';

--
-- Dumping data for table `business_category`
--

INSERT INTO `business_category` (`id`, `business_category_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'service based', 0, '2022-09-30 06:28:06.526', NULL, '2022-09-30 06:28:06.526'),
(2, 'product based', 0, '2022-09-30 06:28:23.859', NULL, '2022-09-30 06:28:23.859');

-- --------------------------------------------------------

--
-- Table structure for table `business_ceo`
--

CREATE TABLE `business_ceo` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `ceo_name` varchar(50) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business ceo data';

--
-- Dumping data for table `business_ceo`
--

INSERT INTO `business_ceo` (`id`, `ceo_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'selvarajan', 0, '2022-09-30 06:46:58.236', NULL, '2022-09-30 06:46:58.236'),
(2, 'Rajalingam', 0, '2022-09-30 06:47:08.275', NULL, '2022-09-30 06:47:08.275'),
(3, 'vignesh', 0, '2022-09-30 06:47:16.736', NULL, '2022-09-30 06:47:16.736');

-- --------------------------------------------------------

--
-- Table structure for table `business_list_master`
--

CREATE TABLE `business_list_master` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `company_logo_path` varchar(255) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `gst_number` int(11) NOT NULL,
  `business_category_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from business_category table',
  `number_of_employees` int(11) NOT NULL,
  `business_type_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from business_type table',
  `financial_sheet_path` varchar(255) NOT NULL,
  `paidup_capital` int(11) NOT NULL,
  `authorised_capital` int(11) NOT NULL,
  `business_ceo_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from business_ceo table',
  `shareholders_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from shareholders table',
  `company_full_name` varchar(150) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from countries table',
  `state_id` int(11) NOT NULL COMMENT 'This field is foreign key in this table fetching from states table',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business list data';

--
-- Dumping data for table `business_list_master`
--

INSERT INTO `business_list_master` (`id`, `company_logo_path`, `company_name`, `gst_number`, `business_category_id`, `number_of_employees`, `business_type_id`, `financial_sheet_path`, `paidup_capital`, `authorised_capital`, `business_ceo_id`, `shareholders_id`, `company_full_name`, `company_address`, `country_id`, `state_id`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'uploads/image.png', 'Prestige group', 43534535, 20, 23456, 1, 'uploads/sheet.png', 234566, 345566, 345, 1, 'Prestige group private limited', 'dfgfdgdsfg', 345, 5464, 0, '2022-09-30 08:07:17.743', NULL, '2022-09-30 08:07:17.743'),
(2, 'uploads/image.png', 'Accenture', 43534535, 20, 23456, 1, 'uploads/sheet.png', 234566, 345566, 345, 1, 'Prestige group private limited', 'Bangalore', 345, 5464, 0, '2022-09-30 08:32:41.189', NULL, '2022-09-30 08:32:41.189');

-- --------------------------------------------------------

--
-- Table structure for table `business_type`
--

CREATE TABLE `business_type` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `business_type_name` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business type data';

--
-- Dumping data for table `business_type`
--

INSERT INTO `business_type` (`id`, `business_type_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'digital agency', 0, '2022-09-30 06:38:05.574', NULL, '2022-09-30 06:38:05.574'),
(2, 'IT', 0, '2022-09-30 06:38:21.375', NULL, '2022-09-30 06:38:21.375');

-- --------------------------------------------------------

--
-- Table structure for table `shareholders`
--

CREATE TABLE `shareholders` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `shareholders_name` varchar(255) DEFAULT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores shareholders  data';

--
-- Dumping data for table `shareholders`
--

INSERT INTO `shareholders` (`id`, `shareholders_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'prestige group', 0, '2022-09-30 07:03:05.223', NULL, '2022-09-30 07:03:05.223'),
(2, 'Vimal Raj', 0, '2022-09-30 07:04:15.760', NULL, '2022-09-30 07:04:15.760'),
(3, 'Rajalingam', 0, '2022-09-30 07:04:27.052', NULL, '2022-09-30 07:04:27.052'),
(4, 'Sam Rodigues', 0, '2022-09-30 07:05:07.829', NULL, '2022-09-30 07:05:07.829');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_category`
--
ALTER TABLE `business_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_ceo`
--
ALTER TABLE `business_ceo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_list_master`
--
ALTER TABLE `business_list_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_type`
--
ALTER TABLE `business_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shareholders`
--
ALTER TABLE `shareholders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_category`
--
ALTER TABLE `business_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_ceo`
--
ALTER TABLE `business_ceo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_list_master`
--
ALTER TABLE `business_list_master`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shareholders`
--
ALTER TABLE `shareholders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
