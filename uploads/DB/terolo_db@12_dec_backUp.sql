-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 01:05 PM
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
-- Table structure for table `business_address`
--

CREATE TABLE `business_address` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `businessId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "business" table',
  `business_owner_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "people" table',
  `company_address_line_1` varchar(255) NOT NULL,
  `company_address_line_2` varchar(255) NOT NULL,
  `company_full_name` varchar(255) NOT NULL,
  `country_iso2` varchar(50) NOT NULL COMMENT 'Populate "country_iso2" field value from "countryStateCity" JSON files data',
  `country_name` varchar(100) NOT NULL COMMENT 'Populate "country_name" field value from "countryStateCity" JSON files data',
  `state_code` varchar(50) NOT NULL COMMENT 'Populate "State codes" field value from "countryStateCity" JSON files data',
  `state_name` varchar(100) NOT NULL COMMENT 'Populate "state_name" field value from "countryStateCity" JSON files data',
  `address_type` enum('Head','Branch') NOT NULL DEFAULT 'Branch',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business_address data';

--
-- Dumping data for table `business_address`
--

INSERT INTO `business_address` (`id`, `businessId`, `business_owner_id`, `company_address_line_1`, `company_address_line_2`, `company_full_name`, `country_iso2`, `country_name`, `state_code`, `state_name`, `address_type`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 6, 'Madurai', 'Elcot', 'ONEUX private ', '101', 'India', 'TN', 'Tamil Nadu', 'Branch', 1, 6, '2022-10-17 14:00:49.586', 1, '2022-10-17 14:00:49.586'),
(2, 2, 1, 'Madurai', 'Elcot', 'ONEUX private limited & Co.', '101', 'India', 'TN', 'Tamil Nadu', 'Branch', 0, 1, '2022-10-17 14:04:37.962', NULL, '2022-10-17 14:04:37.962'),
(3, 3, 6, 'Madurai', 'Elcot', 'JFROG private limited & Co.', '101', 'India', 'TN', 'Tamil Nadu', 'Branch', 0, 6, '2022-10-17 15:05:33.865', 6, '2022-10-17 15:05:33.865');

-- --------------------------------------------------------

--
-- Table structure for table `business_category`
--

CREATE TABLE `business_category` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `business_category_name` varchar(50) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business_category data';

--
-- Dumping data for table `business_category`
--

INSERT INTO `business_category` (`id`, `business_category_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'service', 0, '2022-10-07 05:41:22.914', NULL, '2022-10-07 05:41:22.914'),
(2, 'product', 0, '2022-10-07 05:41:30.360', NULL, '2022-10-07 05:41:30.360');

-- --------------------------------------------------------

--
-- Table structure for table `business_list_master`
--

CREATE TABLE `business_list_master` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `business_owner_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "people" table',
  `company_name` varchar(50) NOT NULL,
  `company_logo_path` varchar(255) NOT NULL,
  `company_info` varchar(5000) NOT NULL,
  `business_category_id` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "business_category" table',
  `business_category_name` varchar(100) NOT NULL COMMENT 'Populate "business_category_name" field value from "business_category" table',
  `business_type_id` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "business_type" table',
  `business_type_name` varchar(100) NOT NULL COMMENT 'Populate "business_type_name" field value from "business_type" table',
  `gst_number` int(50) UNSIGNED NOT NULL,
  `business_destination` enum('Director','CEO') NOT NULL DEFAULT 'CEO',
  `peopleId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "people" table',
  `number_of_employees` int(100) UNSIGNED NOT NULL,
  `financial_sheet_path` varchar(255) NOT NULL,
  `authorised_capital` int(11) UNSIGNED NOT NULL,
  `shareholders_ids` varchar(50) NOT NULL COMMENT 'Populate "id" field value from "shareholders" table',
  `phoneNumber` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `webSite` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '''isDeleted value is "0: isVisible", "1: notVisible" on the data''',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business_list_master data';

--
-- Dumping data for table `business_list_master`
--

INSERT INTO `business_list_master` (`id`, `business_owner_id`, `company_name`, `company_logo_path`, `company_info`, `business_category_id`, `business_category_name`, `business_type_id`, `business_type_name`, `gst_number`, `business_destination`, `peopleId`, `number_of_employees`, `financial_sheet_path`, `authorised_capital`, `shareholders_ids`, `phoneNumber`, `email`, `webSite`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Google', 'company_logo', 'uploads', 2, 'product', 2, 'Digital agency', 43534345, 'CEO', 3, 500, 'financial_sheet_path-0bee199b-6743-4a46-94c6-24bdcdbcfdbc.pdf', 345566, '1', '9898786753', 'gokul@google.in', 'www.gokulGoogle.in', 1, 6, '2022-10-17 14:00:49.590', 1, '2022-10-17 14:00:49.590'),
(2, 1, 'ONEUX', 'company_logo-04084ce6-36ca-4e08-a6c5-7779a907424c.png', 'uploads', 1, 'service', 1, 'IT', 43534345, 'CEO', 7, 300, 'financial_sheet_path-0bee199b-6743-4a46-94c6-24bdcdbcfdbc.pdf', 345566, '2,3,4', '9898786753', 'gokul@oneux.in', 'www.oneux.in', 0, 1, '2022-10-17 14:04:37.965', NULL, '2022-10-17 14:04:37.965'),
(3, 6, 'JFROG', 'company_logo-04084ce6-36ca-4e08-a6c5-7779a907424c.png', 'JFrog Ltd provides an end-to-end, hybrid, universal DevOps Platform to achieve Continuous Software Release Management (CSRM). ', 1, 'service', 2, 'Digital agency', 58584345, 'CEO', 5, 200, 'financial_sheet_path-0bee199b-6743-4a46-94c6-24bdcdbcfdbc.pdf', 10303030, '5,6,7,8', '9898786753', 'abi@jfrog.in', 'www.JFROG.in', 0, 6, '2022-10-17 15:05:33.869', 6, '2022-10-17 15:05:33.869');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores business_type data';

--
-- Dumping data for table `business_type`
--

INSERT INTO `business_type` (`id`, `business_type_name`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'IT', 0, '2022-10-07 05:45:52.100', NULL, '2022-10-07 05:45:52.100'),
(2, 'Digital agency', 0, '2022-10-07 05:46:11.351', NULL, '2022-10-07 05:46:11.351');

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `aboutProject` varchar(255) NOT NULL,
  `clients` varchar(255) NOT NULL,
  `previousProject` varchar(255) NOT NULL,
  `addressLine1` varchar(255) NOT NULL,
  `addressLine2` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `phoneNo` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores company_details data';

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`id`, `aboutProject`, `clients`, `previousProject`, `addressLine1`, `addressLine2`, `companyName`, `country`, `state`, `phoneNo`, `email`, `website`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:09:12.562', NULL, '2022-11-28 13:09:12.562'),
(2, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:10:05.211', NULL, '2022-11-28 13:10:05.211'),
(3, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:26:19.172', NULL, '2022-11-28 13:26:19.172'),
(4, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:27:18.056', NULL, '2022-11-28 13:27:18.056'),
(5, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:27:38.569', NULL, '2022-11-28 13:27:38.569'),
(6, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:29:03.389', NULL, '2022-11-28 13:29:03.389'),
(7, 'werty', '2', 'qwert', 'qwerty', 'wertys', 'Thinroot', 'BH', 'Muharraq', 2147483647, 'test10@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-28 13:36:29.394', NULL, '2022-11-28 13:36:29.394'),
(8, 'werty', '2', 'qwert', 'qwerty', 'wertys', 'Thinroot', 'BH', 'Muharraq', 2147483647, 'test10@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-28 13:36:30.271', NULL, '2022-11-28 13:36:30.271'),
(9, 'werty', '2', 'qwert', 'qwerty', 'wertys', 'Thinroot', 'BH', 'Muharraq', 2147483647, 'test10@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-28 13:36:31.276', NULL, '2022-11-28 13:36:31.276'),
(10, 'xyz', 'aa', 'yantra', 'bangalore', 'mysore', 'thinroot', 'India', 'karnataka', 2147483647, 'test16@gmail.com', 'www.limitscale.in', 0, 0, '2022-11-28 13:36:52.381', NULL, '2022-11-28 13:36:52.381'),
(11, 'dddd', '2', 'wetryu', 'rtyui', 'ertyui', 'ertyui', 'BB', 'Saint Joseph', 2147483647, 'test11@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-28 13:46:45.422', NULL, '2022-11-28 13:46:45.422'),
(12, 'dddd', '2', 'wetryu', 'rtyui', 'ertyui', 'ertyui', 'BB', 'Saint Joseph', 2147483647, 'test11@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-28 13:46:45.941', NULL, '2022-11-28 13:46:45.941'),
(13, 'wertyu', '2', 'wertyu', 'wertyu', 'wertyui', 'sdfghj', 'BD', 'Bogra District', 2147483647, 'test@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-29 04:57:49.285', NULL, '2022-11-29 04:57:49.285'),
(14, 'wertyu', '2', 'wertyu', 'wertyu', 'wertyui', 'sdfghj', 'BD', 'Bogra District', 2147483647, 'test@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-29 04:57:49.600', NULL, '2022-11-29 04:57:49.600'),
(15, 'wertyu', '2', 'wertyu', 'wertyu', 'wertyui', 'sdfghj', 'BD', 'Bogra District', 21474837, 'test@gmail.com', 'www.thinroot.in', 0, 0, '2022-11-29 04:57:49.786', NULL, '2022-11-29 04:57:49.786');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `complaintId` varchar(12) NOT NULL COMMENT 'Populate "id" field value from the same "complaints" concate "COM-" table ',
  `Date` datetime DEFAULT NULL,
  `complaint` varchar(100) NOT NULL,
  `customerName` varchar(100) NOT NULL,
  `complaintPriority` varchar(100) NOT NULL,
  `complaintDescription` text NOT NULL,
  `complaintIssueImage` varchar(255) NOT NULL,
  `complaintIssueDoc` varchar(255) NOT NULL,
  `orderId` int(11) UNSIGNED NOT NULL,
  `complaintStatus` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores complaints data';

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complaintId`, `Date`, `complaint`, `customerName`, `complaintPriority`, `complaintDescription`, `complaintIssueImage`, `complaintIssueDoc`, `orderId`, `complaintStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'CID00000001', '2022-01-11 00:00:00', 'charger issue dndd', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 13, 'Available', 1, 3, '2022-11-18 10:12:35.814', NULL, '2022-11-18 10:12:35.814'),
(2, 'CID00000002', '2022-10-11 00:00:00', 'battery', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Available', 1, 3, '2022-11-18 10:13:05.128', NULL, '2022-11-18 10:13:05.128'),
(3, 'CID00000003', '2022-10-11 00:00:00', 'payment issue', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Not Available', 0, 3, '2022-11-18 10:13:07.084', NULL, '2022-11-18 10:13:07.084'),
(4, 'CID00000004', '2022-10-11 00:00:00', ' fuction issues', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Yes to Assign', 0, 3, '2022-11-18 10:40:41.125', NULL, '2022-11-18 10:40:41.125'),
(5, 'CID00000005', '2022-10-11 00:00:00', ' data', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Available', 1, 3, '2022-11-18 10:40:59.997', NULL, '2022-11-18 10:40:59.997'),
(6, 'CID00000006', '2022-11-18 00:00:00', 'laptop', 'harigaran', 'Digital Agency', '&lt;p>gkjfdgyjdjfgbjdfgjg&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 13, 'Available', 1, 3, '2022-11-18 11:16:30.604', NULL, '2022-11-18 11:16:30.604'),
(7, 'CID00000007', '2022-11-19 00:00:00', 'laptop', 'hari', 'Digital Agency', '&lt;p>afdwef&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 13, 'Available', 1, 3, '2022-11-18 11:20:27.515', NULL, '2022-11-18 11:20:27.515'),
(8, 'CID00000008', '2022-10-13 00:00:00', 'ticket fjfdj', 'thinroot', 'IT', '&lt;p>fefwf&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 122, 'Available', 1, 3, '2022-11-18 11:24:00.124', NULL, '2022-11-18 11:24:00.124'),
(26, 'CID00000026', '2022-11-23 00:00:00', 'ticket b ', 'harigaran', 'IT', '&lt;p>&lt;strong>fffff&lt;/strong>&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\07-Dashboard.jpg', 13, 'Available', 0, 3, '2022-11-23 11:59:39.832', NULL, '2022-11-23 11:59:39.832'),
(27, 'CID00000027', '2022-11-23 00:00:00', 'payment issue', 'hari', 'Digital Agency', '&lt;p>bffhffjfd&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\Carrom (1).pdf', 13, 'Available', 0, 3, '2022-11-23 12:20:27.953', NULL, '2022-11-23 12:20:27.953'),
(28, 'CID00000028', '2022-11-24 00:00:00', 'ticket b fdnjkkk', 'hari', 'Digital Agency', '&lt;p>gvg&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\Acct Statement_XX2232_22032022 (2) (1).pdf', 13, 'Available', 1, 3, '2022-11-23 12:30:27.654', NULL, '2022-11-23 12:30:27.654'),
(29, 'CID00000029', '2022-11-23 00:00:00', 'ticket ', 'harigaran', 'IT', '&lt;p>hhhhh&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\CMS_Documents.pdf', 12, 'Available', 0, 3, '2022-11-30 06:18:44.235', NULL, '2022-11-30 06:18:44.235'),
(30, 'CID00000030', '2022-11-24 00:00:00', 'laptop', 's', 'IT', '&lt;p>fdddd&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\CMS_Documents.pdf', 13, 'Available', 0, 3, '2022-11-30 06:19:21.318', NULL, '2022-11-30 06:19:21.318'),
(31, 'CID00000031', '2022-11-24 00:00:00', 'dhfdhhd', 's', 'Digital Agency', '&lt;p>fvfv&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\6.png', 122, 'Available', 0, 3, '2022-11-30 06:43:17.762', NULL, '2022-11-30 06:43:17.762'),
(32, 'CID00000032', '2022-11-25 00:00:00', 'ticket b fdnjkkk', 's', 'Digital Agency', '&lt;p>fy&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\CMS_Documents.pdf', 13, 'Available', 0, 3, '2022-11-30 08:41:54.209', NULL, '2022-11-30 08:41:54.209'),
(33, 'CID00000033', '2022-10-11 00:00:00', ' data', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Available', 0, 3, '2022-11-30 11:55:07.074', NULL, '2022-11-30 11:55:07.074'),
(34, 'CID00000034', '2022-11-30 00:00:00', 'laptop', 's', 'Digital Agency', '&lt;p>ddnd&lt;/p>\n', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'C:\\fakepath\\CMS_Documents.pdf', 0, 'Available', 0, 3, '2022-11-30 12:14:28.349', NULL, '2022-11-30 12:14:28.349'),
(35, 'CID00000035', '2022-10-11 00:00:00', ' data', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Available', 0, 3, '2022-11-30 12:18:23.915', NULL, '2022-11-30 12:18:23.915'),
(36, 'CID00000036', '2022-10-11 00:00:00', ' data', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Not Available', 0, 3, '2022-11-30 12:18:45.705', NULL, '2022-11-30 12:18:45.705'),
(37, 'CID00000037', '2022-10-11 00:00:00', ' data', 'hari', 'important', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 13, 'Yes to assign', 0, 3, '2022-11-30 12:19:19.851', NULL, '2022-11-30 12:19:19.851');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `peopleId` int(11) UNSIGNED NOT NULL COMMENT '''Populate "id" field value from "people" table for customer Id''',
  `projectId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "customers_project_details" table',
  `company_logo_path` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `gstNumber` varchar(50) NOT NULL,
  `companyInfo` varchar(255) NOT NULL,
  `activeStatus` enum('Available','Not available','No update') NOT NULL DEFAULT 'Available',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores customers company data';

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `peopleId`, `projectId`, `company_logo_path`, `companyName`, `gstNumber`, `companyInfo`, `activeStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 4, 1, 'company_logo_path-5b6342bb-21cd-4059-8507-4b0b66971da6.png', 'Logic Bee', '12345VR6789rv', 'Logic Bee Ltd provides an end-to-end,', 'Available', 0, 0, '2022-12-09 12:33:03.627', NULL, '2022-12-09 12:33:03.627');

-- --------------------------------------------------------

--
-- Table structure for table `customers_company_details`
--

CREATE TABLE `customers_company_details` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `companyId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from the same "customers company" table ',
  `customer_address_line_1` varchar(255) NOT NULL,
  `customer_address_line_2` varchar(255) NOT NULL,
  `company_full_name` varchar(255) NOT NULL,
  `country_iso2` varchar(50) NOT NULL COMMENT 'Populate "country_iso2" field value from "countryStateCity" JSON files data',
  `country_name` varchar(100) NOT NULL COMMENT 'Populate "country_name" field value from "countryStateCity" JSON files data',
  `state_code` varchar(50) NOT NULL COMMENT 'Populate "State codes" field value from "countryStateCity" JSON files data',
  `state_name` varchar(100) NOT NULL COMMENT 'Populate "state_name" field value from "countryStateCity" JSON files data',
  `address_type` enum('Head','Branch') NOT NULL DEFAULT 'Branch',
  `phoneNumber` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores customers company details data';

--
-- Dumping data for table `customers_company_details`
--

INSERT INTO `customers_company_details` (`id`, `companyId`, `customer_address_line_1`, `customer_address_line_2`, `company_full_name`, `country_iso2`, `country_name`, `state_code`, `state_name`, `address_type`, `phoneNumber`, `email`, `website`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Bangalore', 'Kudlu gate', 'Logic Bee private limited & Co.', '101', 'India', 'KA', 'Karnataka', 'Branch', '9876542826', 'thalavr', 'http://thalaVR.com', 0, 0, '2022-12-09 12:33:03.621', NULL, '2022-12-09 12:33:03.621');

-- --------------------------------------------------------

--
-- Table structure for table `customers_project_details`
--

CREATE TABLE `customers_project_details` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `companyId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "customers company" table',
  `companyName` varchar(255) NOT NULL COMMENT 'Populate "company_full_name" field value from "companyName" table',
  `projectName` varchar(255) NOT NULL,
  `aboutProject` varchar(255) NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  `project_team_ids` varchar(50) NOT NULL COMMENT 'Populate "id" field value from "customer_project_team" table',
  `projectStatus` enum('In-progress','Pending','Completed','Cancelled','Open') NOT NULL DEFAULT 'Open',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores customers project details data';

--
-- Dumping data for table `customers_project_details`
--

INSERT INTO `customers_project_details` (`id`, `companyId`, `companyName`, `projectName`, `aboutProject`, `startDate`, `endDate`, `project_team_ids`, `projectStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Logic Bee', 'Icollect ecommerce', 'It\'s a ecommerce site, one user to another user following, product purchase and sales the product', '2021-12-02 18:30:00.000', '2022-03-02 18:30:00.000', '1,2', 'Open', 0, 0, '2022-12-09 12:33:03.624', NULL, '2022-12-09 12:33:03.624');

-- --------------------------------------------------------

--
-- Table structure for table `customer_project_team`
--

CREATE TABLE `customer_project_team` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `customerId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "people" table',
  `companyId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "customers company" table',
  `projectId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "customers_project_details" table',
  `peopleId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "people" table',
  `projectRole` enum('Project Lead','Team Lead','Design Lead','Development Lead','Testing Lead','Member') NOT NULL DEFAULT 'Member',
  `projectDesignation` varchar(50) NOT NULL COMMENT 'Designer, Front end developer, Back end developer, Tester',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores customer project team data';

--
-- Dumping data for table `customer_project_team`
--

INSERT INTO `customer_project_team` (`id`, `customerId`, `companyId`, `projectId`, `peopleId`, `projectRole`, `projectDesignation`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 4, 1, 1, 1, 'Team Lead', 'Full-stack-developer', 0, 0, '2022-12-09 12:33:03.608', NULL, '2022-12-09 12:33:03.608'),
(2, 4, 1, 1, 5, 'Member', 'Back-end Developer', 0, 0, '2022-12-09 12:33:03.613', NULL, '2022-12-09 12:33:03.613');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `peopleId` int(11) UNSIGNED NOT NULL COMMENT '''Populate "id" field value from "people" table''',
  `currentDesignation` varchar(50) NOT NULL,
  `currentCompany` varchar(255) NOT NULL,
  `currentTools` varchar(100) NOT NULL,
  `currentSkills` varchar(50) NOT NULL,
  `experianceDesignation` varchar(255) NOT NULL,
  `experianceCompany` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores employee_details data';

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `peopleId`, `currentDesignation`, `currentCompany`, `currentTools`, `currentSkills`, `experianceDesignation`, `experianceCompany`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 'Full Stack Developer', 'Thinroot', 'Spring Boot', 'react', 'Junior', 'crosshurdal', 0, '2022-10-10 09:15:50.234', NULL, '2022-10-10 09:15:50.234'),
(2, 3, ' Designer', 'Thinroot', 'Word Press', 'figma', 'Senior', 'crosshurdal', 0, '2022-10-10 09:19:05.092', NULL, '2022-10-10 09:19:05.092'),
(3, 7, 'Java Developer', 'Thinroot', 'Spring Boot', 'JAVA', 'Senior', 'crosshurdal', 0, '2022-10-10 08:22:18.433', NULL, '2022-10-10 08:22:18.433'),
(6, 0, 'Full Stack Developer', 'Thinroot', 'MERN', 'React Js', 'Senior', 'crosshurdal', 0, '2022-10-11 09:12:30.484', NULL, '2022-10-11 09:12:30.484'),
(7, 0, 'Full Stack Developer', 'Thinroot', 'MERN', 'React Js', 'Senior', 'crosshurdal', 0, '2022-10-11 09:13:58.738', NULL, '2022-10-11 09:13:58.738'),
(8, 0, 'Full Stack Developer', 'Thinroot', 'MERN', 'React Js', 'Senior', 'crosshurdal', 0, '2022-10-11 09:16:11.293', NULL, '2022-10-11 09:16:11.293'),
(9, 2, 'Spring  Developer', 'Thinroot', 'Spring Boot', 'react', 'Junior', 'crosshurdal', 0, '2022-10-11 09:19:06.033', NULL, '2022-10-11 09:19:06.033'),
(10, 0, ' Designer', 'Thinroot', 'Figma', 'react', 'Senior', 'crosshurdal', 0, '2022-10-11 09:20:55.484', NULL, '2022-10-11 09:20:55.484'),
(11, 4, 'MEAN Full Stack Developer', 'Thinroot', 'MEAN', 'Angular', 'Senior', 'crosshurdal', 0, '2022-10-14 04:51:30.868', NULL, '2022-10-14 04:51:30.868'),
(12, 5, 'MERN Full Stack Developer', 'Thinroot', 'MERN', 'React Js', 'Junior', 'crosshurdal', 0, '2022-10-14 04:54:17.105', NULL, '2022-10-14 04:54:17.105'),
(13, 0, 'MERN Full Stack Developer', 'Thinroot', 'MERN', 'React Js', 'Senior', 'crosshurdal', 0, '2022-10-14 04:55:17.521', NULL, '2022-10-14 04:55:17.521'),
(14, 0, 'Full Stack Developer', 'Thinroot', 'Spring Boot', 'Java', 'Senior', 'crosshurdal', 0, '2022-10-14 04:56:41.579', NULL, '2022-10-14 04:56:41.579'),
(15, 0, 'Full Stack Developer', 'Thinroot', 'Spring Boot', 'Java', 'Senior', 'crosshurdal', 0, '2022-10-14 05:25:11.820', NULL, '2022-10-14 05:25:11.820');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `categoryProduct` varchar(255) NOT NULL,
  `serviceName` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `information` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `request` varchar(255) NOT NULL,
  `taxCredit` enum('yes','no') NOT NULL DEFAULT 'yes',
  `payableByTenant` enum('yes','no') NOT NULL DEFAULT 'yes',
  `totalAmount` int(11) NOT NULL,
  `excelTax` int(11) NOT NULL,
  `taxPercentage` varchar(255) NOT NULL,
  `purchaseViaId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "purchase_Via" table',
  `paymentTypeId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "payment_Method" table',
  `actionStatusId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "action_status" table',
  `action_Status` enum('Approved','Rejected','Waiting for approval') NOT NULL DEFAULT 'Waiting for approval',
  `stateName` varchar(255) NOT NULL,
  `countryName` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores expenses data';

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `categoryProduct`, `serviceName`, `reason`, `information`, `purpose`, `invoice`, `request`, `taxCredit`, `payableByTenant`, `totalAmount`, `excelTax`, `taxPercentage`, `purchaseViaId`, `paymentTypeId`, `actionStatusId`, `action_Status`, `stateName`, `countryName`, `branch`, `note`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'laptop1', 'yyy-2', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-03 11:45:43.597', NULL, '2022-10-03 11:45:43.597'),
(2, 'laptop', 'yyy-12', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Approved', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:17.838', NULL, '2022-10-04 07:26:17.838'),
(3, 'lap', 'yyy-14', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:24.448', NULL, '2022-10-04 07:26:24.448'),
(4, 'laptop4', 'yyy-2', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Approved', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-03 11:45:43.597', NULL, '2022-10-03 11:45:43.597'),
(5, 'laptop5', 'yyy-12', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:17.838', NULL, '2022-10-04 07:26:17.838'),
(6, 'lap6', 'yyy-14', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Approved', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:24.448', NULL, '2022-10-04 07:26:24.448'),
(7, 'laptop7', 'yyy-2', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-03 11:45:43.597', NULL, '2022-10-03 11:45:43.597'),
(8, 'laptop8', 'yyy-12', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Waiting for approval', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:17.838', NULL, '2022-10-04 07:26:17.838'),
(9, 'ABC-lap9', 'yyy-14', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:24.448', NULL, '2022-10-04 07:26:24.448'),
(10, 'laptop10', 'yyy-2', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Waiting for approval', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-03 11:45:43.597', NULL, '2022-10-03 11:45:43.597'),
(11, 'laptop11', 'yyy-12', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:17.838', NULL, '2022-10-04 07:26:17.838'),
(12, 'lap12', 'yyy-14', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Approved', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:24.448', NULL, '2022-10-04 07:26:24.448'),
(13, 'laptop13', 'yyy-2', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-03 11:45:43.597', NULL, '2022-10-03 11:45:43.597'),
(14, 'laptop14', 'yyy-12', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Approved', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:17.838', NULL, '2022-10-04 07:26:17.838'),
(15, 'lap15', 'yyy-14', 'XYZ', 'xy', 'aa', 'E:\\sahana\\React\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\invoice-8e17701a-4ef1-4bb4-a9de-bc4e409785d1.png', 'cc', 'yes', 'yes', 10000, 1000, '25', 4, 1, 0, 'Rejected', 'Karnataka', 'India', 'xyz', 'xyz', 0, '2022-10-04 07:26:24.448', NULL, '2022-10-04 07:26:24.448'),
(16, 'Lenovo', 'ThinkPad', 'Its good', 'xy', 'processor', ' ', 'cc', 'yes', 'yes', 20000, 1000, '25', 4, 1, 0, 'Approved', 'tamilNadu', 'india', 'xyz', 'xyz', 0, '2022-10-07 08:01:27.474', NULL, '2022-10-07 08:01:27.474');

-- --------------------------------------------------------

--
-- Table structure for table `expenses_approve`
--

CREATE TABLE `expenses_approve` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `requested_By` varchar(255) NOT NULL,
  `requested_Date` datetime NOT NULL,
  `action_By` varchar(255) NOT NULL,
  `action_Date` datetime NOT NULL,
  `action_Status` varchar(255) NOT NULL,
  `approve_Comment` varchar(255) NOT NULL,
  `reject_Comment` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores expenses_approve data';

-- --------------------------------------------------------

--
-- Table structure for table `expenses_status`
--

CREATE TABLE `expenses_status` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `expenses_status_type` varchar(50) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores expenses_status data';

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `invoiceNumber` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "users" table',
  `customerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "customer" table',
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
(2, 'e98d82ce-cfc0-4d9d-9b07-c9bbadcd24e2', 6, 0, '2022-09-27', '2022-09-28', '10000.00', '100.00', '999.99', 10, '', 0, '0.00', '', '', 0, '2022-09-26 14:47:13.969', NULL, '2022-09-26 14:47:13.969'),
(3, '4fa9c298-d191-4c59-bcba-e228107b3523', 4, 0, '2022-09-28', '2022-09-29', '1000.00', '1000.00', '999.99', 0, '', 0, '0.00', '', '', 0, '2022-09-28 07:16:56.509', NULL, '2022-09-28 07:16:56.509');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `profilePhoto` varchar(255) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileNameInvoice` varchar(255) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `invoiceNumber` int(11) UNSIGNED NOT NULL,
  `info` varchar(255) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `projectDetailsId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "orders_project_details" table',
  `companyDetailsId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "company_details" table',
  `status` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores orders data';

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `profilePhoto`, `fileName`, `fileNameInvoice`, `companyName`, `invoiceNumber`, `info`, `invoice`, `projectDetailsId`, `companyDetailsId`, `status`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'xyz', 'fileName', 'fileNameInvoice', 'softwaree', 16, 'xyz', 'abc', 6, 6, 'paid', 1, 0, '2022-11-28 13:29:03.403', NULL, '2022-11-28 13:29:03.403'),
(2, 'xyz', 'fileName', 'fileNameInvoice', 'Thinroot ', 16345, 'xyz', 'abc', 10, 10, 'paid', 0, 0, '2022-11-28 13:36:52.391', NULL, '2022-11-28 13:36:52.391'),
(3, 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-863d0187-d541-43fb-b0e4-406d82f5ab95.pdf', 'download.png', 'Angular my interview.pdf', 'ertyu', 1123456, 'sdfgh', 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-ea7fd2fd-ddce-45f3-b191-1bbb6d495b4b.png', 11, 11, 'Pending', 0, 0, '2022-11-28 13:46:45.433', NULL, '2022-11-28 13:46:45.433'),
(4, 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-863d0187-d541-43fb-b0e4-406d82f5ab95.pdf', 'download.png', 'Angular my interview.pdf', 'ertyu', 1123456, 'sdfgh', 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-ea7fd2fd-ddce-45f3-b191-1bbb6d495b4b.png', 12, 12, 'Pending', 1, 0, '2022-11-28 13:46:45.952', NULL, '2022-11-28 13:46:45.952'),
(5, 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-47d10728-af76-4b3a-8236-4603514278d4.png', 'falls.jpg', 'Angular my interview.pdf', 'Thinroot', 23445, 'wertyu', 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-1be9c682-4fb5-4819-b9af-603e7e1ebe33.jpeg', 13, 13, 'Cancelled', 0, 0, '2022-11-29 04:57:49.295', NULL, '2022-11-29 04:57:49.295'),
(6, 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-47d10728-af76-4b3a-8236-4603514278d4.png', 'falls.jpg', 'Angular my interview.pdf', 'Thinroot', 23445, 'wertyu', 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-1be9c682-4fb5-4819-b9af-603e7e1ebe33.jpeg', 14, 14, 'Cancelled', 1, 0, '2022-11-29 04:57:49.617', NULL, '2022-11-29 04:57:49.617'),
(7, 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-47d10728-af76-4b3a-8236-4603514278d4.png', 'falls.jpg', 'Angular my interview.pdf', 'Thinroot', 23445, 'wertyu', 'E:\\sahana\\React\\Terolo\\terolo-portfolio\\terolo-backend\\terolo-backend-portfolio-manager\\uploads\\file-1be9c682-4fb5-4819-b9af-603e7e1ebe33.jpeg', 15, 15, 'Cancelled', 0, 0, '2022-11-29 04:57:49.801', NULL, '2022-11-29 04:57:49.801');

-- --------------------------------------------------------

--
-- Table structure for table `ordersprojectdetails`
--

CREATE TABLE `ordersprojectdetails` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `aboutProject` varchar(255) NOT NULL,
  `clients` varchar(255) NOT NULL,
  `projectLead` varchar(255) NOT NULL,
  `designLead` varchar(255) NOT NULL,
  `developmentLead` varchar(255) NOT NULL,
  `testingLead` varchar(255) NOT NULL,
  `team` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores orders_project_details data';

--
-- Dumping data for table `ordersprojectdetails`
--

INSERT INTO `ordersprojectdetails` (`id`, `aboutProject`, `clients`, `projectLead`, `designLead`, `developmentLead`, `testingLead`, `team`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:09:12.546', NULL, '2022-11-28 13:09:12.546'),
(2, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:10:05.189', NULL, '2022-11-28 13:10:05.189'),
(3, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:26:19.162', NULL, '2022-11-28 13:26:19.162'),
(4, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:27:18.039', NULL, '2022-11-28 13:27:18.039'),
(5, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:27:38.553', NULL, '2022-11-28 13:27:38.553'),
(6, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:29:03.371', NULL, '2022-11-28 13:29:03.371'),
(7, '&lt;p>ertyoject&lt;/p>', 'wertyu', 'wertyu', 'werty', 'qwert', 'wert', 'werty', 0, 0, '2022-11-28 13:36:29.384', NULL, '2022-11-28 13:36:29.384'),
(8, '&lt;p>ertyoject&lt;/p>', 'wertyu', 'wertyu', 'werty', 'qwert', 'wert', 'werty', 0, 0, '2022-11-28 13:36:30.255', NULL, '2022-11-28 13:36:30.255'),
(9, '&lt;p>ertyoject&lt;/p>', 'wertyu', 'wertyu', 'werty', 'qwert', 'wert', 'werty', 0, 0, '2022-11-28 13:36:31.266', NULL, '2022-11-28 13:36:31.266'),
(10, 'xyz', 'aa', 'bb', 'cc', 'dd', 'xyzz', 'tech', 0, 0, '2022-11-28 13:36:52.371', NULL, '2022-11-28 13:36:52.371'),
(11, '&lt;p>wertyui&lt;/p>', 'rtyui', 'wertyu', 'sdfghj', 'wertyu', 'wertyui', 'xcvbnm', 0, 0, '2022-11-28 13:46:45.407', NULL, '2022-11-28 13:46:45.407'),
(12, '&lt;p>wertyui&lt;/p>', 'rtyui', 'wertyu', 'sdfghj', 'wertyu', 'wertyui', 'xcvbnm', 0, 0, '2022-11-28 13:46:45.919', NULL, '2022-11-28 13:46:45.919'),
(13, '&lt;p>&lt;em>&lt;strong>Aboutertyu&lt;/strong>&lt;/em>&lt;/p>', 'wertyu', 'ertyui', 'wertyu', 'sdfghj', 'dfghj', 'xcvbnm', 0, 0, '2022-11-29 04:57:49.274', NULL, '2022-11-29 04:57:49.274'),
(14, '&lt;p>&lt;em>&lt;strong>Aboutertyu&lt;/strong>&lt;/em>&lt;/p>', 'wertyu', 'ertyui', 'wertyu', 'sdfghj', 'dfghj', 'xcvbnm', 0, 0, '2022-11-29 04:57:49.584', NULL, '2022-11-29 04:57:49.584'),
(15, '&lt;p>&lt;em>&lt;strong>Aboutertyu&lt;/strong>&lt;/em>&lt;/p>', 'wertyu', 'ertyui', 'wertyu', 'sdfghj', 'dfghj', 'xcvbnm', 0, 0, '2022-11-29 04:57:49.769', NULL, '2022-11-29 04:57:49.769');

-- --------------------------------------------------------

--
-- Table structure for table `payment_grievances`
--

CREATE TABLE `payment_grievances` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `invoiceId` varchar(12) NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `invoiceFilePath` varchar(255) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `currencyType` char(3) NOT NULL,
  `issue` varchar(255) NOT NULL,
  `refundedAmount` int(100) UNSIGNED NOT NULL,
  `clientDescription` text NOT NULL,
  `paymentGrievanceStatus` char(9) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores payment_grievances data';

--
-- Dumping data for table `payment_grievances`
--

INSERT INTO `payment_grievances` (`id`, `invoiceId`, `fileName`, `invoiceFilePath`, `reason`, `customerName`, `currencyType`, `issue`, `refundedAmount`, `clientDescription`, `paymentGrievanceStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(7, 'IID-00000007', 'pdf.png', '', 'good reason', 'good customer', 'USD', 'werfrewf', 7654, '&lt;p>heloooooo&lt;/p>', 'Pending', 0, 0, '2022-11-29 05:00:51.341', NULL, '2022-11-29 05:00:51.341'),
(8, 'IID-00000008', 'Sep 2022 Payslip.xlsx - Gururaj .pdf', '', 'fvdsfvsdf', 'edfasdfd', 'USD', 'werfrewf', 7654, '&lt;p>helloooooooooooooooooooooasdfsdafsdfsdf&lt;/p>', 'Cancelled', 0, 0, '2022-11-29 05:47:09.468', NULL, '2022-11-29 05:47:09.468'),
(9, 'IID-00000009', 'Gururaj May 2022.pdf', 'D:\\Gururaj\\Terolo_Backend\\terolo-backend-portfolio-manager\\terolo-backend-portfolio-manager\\src\\config../../../uploads', 'asdcsdc', 'assdcsdc', 'USD', 'sadcsdcsd', 2345, '&lt;p>sdcsdcsdcsd&lt;/p>', 'Paid', 0, 0, '2022-11-29 05:57:48.553', NULL, '2022-11-29 05:57:48.553'),
(10, 'IID-00000010', 'sort.png', '', 'rfsrfsdrrf', 'sdfds', 'USD', 'dsfsdf', 2345, '&lt;p>sdfvsdfvdsfvdfvds&lt;/p>', 'Paid', 0, 0, '2022-11-29 06:12:23.563', NULL, '2022-11-29 06:12:23.563'),
(11, 'IID-00000011', 'pdf.png', 'D:\\Gururaj\\Terolo_Backend\\terolo-backend-portfolio-manager\\terolo-backend-portfolio-manager\\src\\config../../../uploads', 'dsfsd', 'sdfds', 'USD', 'account empty', 2345, '&lt;p>dcsdcsdc&lt;/p>', 'Pending', 0, 0, '2022-11-29 06:14:19.475', NULL, '2022-11-29 06:14:19.475'),
(12, 'IID-00000012', 'pdf.png', '', 'sadcsdc', 'ascsdcsdcs', 'CAD', 'bad', 2, '&lt;p>sadcsdcs&lt;/p>', 'Pending', 0, 0, '2022-11-29 07:55:29.621', NULL, '2022-11-29 07:55:29.621'),
(13, 'IID-00000013', '', '', 'qweddcdwc', 'svfdvdfvdf', 'INR', 'werfrewf', 1, '&lt;p>asfdvdfvd&lt;/p>', 'Paid', 0, 0, '2022-11-29 07:58:49.542', NULL, '2022-11-29 07:58:49.542');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `paymentType` varchar(50) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores payment_method data';

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`id`, `paymentType`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Cash', 0, '2022-10-03 11:51:21.167', NULL, '2022-10-03 11:51:21.167'),
(2, 'Check', 0, '2022-10-03 11:51:33.772', NULL, '2022-10-03 11:51:33.772'),
(3, 'Debit card', 0, '2022-11-07 11:35:30.000', NULL, '2022-11-07 11:35:30.000'),
(4, 'Credit card', 0, '2022-11-07 11:35:50.000', NULL, '2022-11-07 11:35:50.000'),
(5, 'Mobile payment', 0, '2022-11-07 11:36:11.000', NULL, '2022-11-07 11:36:11.000'),
(6, 'Electronic bank transfer', 0, '2022-11-07 11:36:58.000', NULL, '2022-11-07 11:36:58.000');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL,
  `profilePhoto` varchar(255) NOT NULL,
  `experiance` int(11) UNSIGNED NOT NULL,
  `info` varchar(255) NOT NULL,
  `roleName` enum('user','admin','superAdmin') NOT NULL DEFAULT 'user',
  `abilities` varchar(255) NOT NULL,
  `dob` datetime DEFAULT NULL,
  `bloodGroup` varchar(50) DEFAULT NULL,
  `gender` varchar(50) NOT NULL,
  `userLanguage` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(100) DEFAULT NULL,
  `skypeId` varchar(255) NOT NULL,
  `employeeDetailsId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "employee_details" table',
  `peopleEducationId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "people_education" table',
  `projectDetailsId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "project_details" table',
  `peopleStatus` enum('Available','Not available') NOT NULL DEFAULT 'Available',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores people data';

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `profilePhoto`, `experiance`, `info`, `roleName`, `abilities`, `dob`, `bloodGroup`, `gender`, `userLanguage`, `email`, `phoneNumber`, `skypeId`, `employeeDetailsId`, `peopleEducationId`, `projectDetailsId`, `peopleStatus`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Gokul Raj', '', 1, 'the information', 'user', 'achieving', '1998-10-28 00:00:00', 'A+', 'male', 'english', 'gokul@gmail.com', '9876543243', 'Gokul123', 1, 1, 3, 'Available', 0, '2022-10-11 09:16:11.305', NULL, '2022-10-11 09:16:11.305'),
(2, 'Siva Barathi', '', 1, 'the information', 'user', 'achieving', '2000-09-28 00:00:00', 'A+', 'male', 'english', 'Siva@gmail.com', NULL, 'Siva123', 9, 2, 1, 'Available', 0, '2022-10-11 09:19:06.042', NULL, '2022-10-11 09:19:06.042'),
(3, 'Hemnath Srikanth', '', 3, 'the information', 'user', 'achieving', '2000-09-28 00:00:00', 'A+', 'male', 'english', 'srikanth@gmail.com', NULL, 'Srikanth123', 2, 3, 2, 'Available', 0, '2022-10-11 09:20:55.494', NULL, '2022-10-11 09:20:55.494'),
(4, 'Kavi arasan', 'uploads/profilePhoto-ef2f64f1-25c0-4bd5-8eb0-b87a34f501ce.png', 2, 'the information', 'user', 'achieving', '1998-09-28 00:00:00', 'A+', 'male', 'english', 'kavi@gmail.com', NULL, 'Kavi@123', 11, 4, 11, 'Available', 0, '2022-10-14 04:51:30.877', NULL, '2022-10-14 04:51:30.877'),
(5, 'Santhosh V', 'uploads/profilePhoto-ef2f64f1-25c0-4bd5-8eb0-b87a34f501ce.png', 2, 'the information', 'user', 'achieving', '2000-09-28 00:00:00', 'A+', 'male', 'english', 'santhosh@gmail.com', NULL, 'Santhosh@123', 12, 5, 12, 'Available', 0, '2022-10-14 04:54:17.111', NULL, '2022-10-14 04:54:17.111'),
(6, 'Abishek K', 'uploads/profilePhoto-ef2f64f1-25c0-4bd5-8eb0-b87a34f501ce.png', 2, 'the information', 'user', 'achieving', '1998-09-28 00:00:00', 'A+', 'male', 'english', 'abi@gmail.com', NULL, 'Abishek@123', 6, 6, 13, 'Available', 0, '2022-10-14 04:55:17.527', NULL, '2022-10-14 04:55:17.527'),
(7, 'Nirmal Kumar', 'uploads/profilePhoto-ef2f64f1-25c0-4bd5-8eb0-b87a34f501ce.png', 2, 'the information', 'user', 'achieving', '1998-09-28 00:00:00', 'A+', 'male', 'english', 'nirmal@gmail.com', NULL, 'Nirmal@123', 7, 7, 14, 'Available', 0, '2022-10-14 04:56:41.590', NULL, '2022-10-14 04:56:41.590'),
(8, 'Vijay Kumar', 'uploads/profilePhoto-ef2f64f1-25c0-4bd5-8eb0-b87a34f501ce.png', 2, 'the information', 'user', 'achieving', '1998-09-28 00:00:00', 'A+', 'male', 'english', 'vj@gmail.com', NULL, 'vjk@123', 8, 8, 15, 'Available', 0, '2022-10-14 05:25:11.829', NULL, '2022-10-14 05:25:11.829');

-- --------------------------------------------------------

--
-- Table structure for table `people_education`
--

CREATE TABLE `people_education` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `collegeName` varchar(255) NOT NULL,
  `collegeField` varchar(100) NOT NULL,
  `collegeYearFrom` int(11) UNSIGNED NOT NULL,
  `collegeYearTo` int(11) UNSIGNED NOT NULL,
  `collegeSummary` varchar(255) NOT NULL,
  `schoolName` varchar(255) NOT NULL,
  `schoolGrade` varchar(255) NOT NULL,
  `schoolYearFrom` int(11) UNSIGNED NOT NULL,
  `schoolYearTo` int(11) UNSIGNED NOT NULL,
  `schoolSummary` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores people_education data';

--
-- Dumping data for table `people_education`
--

INSERT INTO `people_education` (`id`, `collegeName`, `collegeField`, `collegeYearFrom`, `collegeYearTo`, `collegeSummary`, `schoolName`, `schoolGrade`, `schoolYearFrom`, `schoolYearTo`, `schoolSummary`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'JAIN', 'MCA', 2021, 2022, 'good to work', 'SSCMHSS', 'A', 2012, 2026, 'good to work', 0, '2022-10-11 09:16:11.285', NULL, '2022-10-11 09:16:11.285'),
(2, 'new', 'Mech', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-11 09:19:06.024', NULL, '2022-10-11 09:19:06.024'),
(3, 'new', 'EEE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-11 09:20:55.478', NULL, '2022-10-11 09:20:55.478'),
(4, 'MK', 'CSE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-14 04:51:30.861', NULL, '2022-10-14 04:51:30.861'),
(5, 'MK', 'CSE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-14 04:54:17.099', NULL, '2022-10-14 04:54:17.099'),
(6, 'MK', 'CSE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-14 04:55:17.516', NULL, '2022-10-14 04:55:17.516'),
(7, 'MK', 'CSE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-14 04:56:41.572', NULL, '2022-10-14 04:56:41.572'),
(8, 'MK', 'CSE', 2018, 2022, 'good to work', 'SSCMHSS', 'A', 2018, 2020, 'good to work', 0, '2022-10-14 05:25:11.813', NULL, '2022-10-14 05:25:11.813');

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `projectDesignation` varchar(255) NOT NULL,
  `projectCompany` varchar(255) NOT NULL,
  `projectYearFrom` int(11) UNSIGNED NOT NULL,
  `projectYearTo` int(11) UNSIGNED NOT NULL,
  `companySummary` varchar(255) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores project_details data';

--
-- Dumping data for table `project_details`
--

INSERT INTO `project_details` (`id`, `projectDesignation`, `projectCompany`, `projectYearFrom`, `projectYearTo`, `companySummary`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Developer', 'oneux', 2022, 2022, 'Good', 0, '2022-10-10 09:15:50.218', NULL, '2022-10-10 09:15:50.218'),
(2, 'Designer', 'oneux', 2020, 2022, 'Good', 0, '2022-10-10 09:19:05.078', NULL, '2022-10-10 09:19:05.078'),
(3, 'Developer', 'oneux', 2021, 2022, 'Good', 0, '2022-10-10 08:22:18.422', NULL, '2022-10-10 08:22:18.422'),
(4, 'Developer', 'CHS', 2021, 2021, 'Good', 0, '2022-10-14 04:51:30.855', NULL, '2022-10-14 04:51:30.855'),
(5, 'Developer', 'CHS', 2022, 2022, 'Good', 0, '2022-10-14 04:54:17.094', NULL, '2022-10-14 04:54:17.094'),
(6, 'Developer', 'CHS', 2022, 2022, 'Good', 0, '2022-10-14 04:55:17.510', NULL, '2022-10-14 04:55:17.510'),
(7, 'Developer', 'CHS', 2022, 2022, 'Good', 0, '2022-10-14 04:56:41.565', NULL, '2022-10-14 04:56:41.565'),
(8, 'Developer', 'CHS', 2022, 2022, 'Good', 0, '2022-10-14 05:25:11.805', NULL, '2022-10-14 05:25:11.805');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_via`
--

CREATE TABLE `purchase_via` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `purchaseViaType` varchar(50) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores purchase-via data';

--
-- Dumping data for table `purchase_via`
--

INSERT INTO `purchase_via` (`id`, `purchaseViaType`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'Online', 0, '2022-10-03 11:50:08.142', NULL, '2022-10-03 11:50:08.142'),
(2, 'vendor', 0, '2022-10-03 11:50:23.649', NULL, '2022-10-03 11:50:23.649'),
(3, 'Retail', 0, '2022-10-03 11:50:44.492', NULL, '2022-10-03 11:50:44.492'),
(4, 'Other', 0, '2022-10-03 11:50:51.053', NULL, '2022-10-03 11:50:51.053');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `refundId` varchar(12) NOT NULL COMMENT 'Populate "id" field value from the same "refunds" concate "RID-" table ',
  `orderId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "Order" table',
  `refundReason` varchar(255) NOT NULL,
  `invoiceDoc` varchar(255) NOT NULL,
  `dateOfPaid` datetime NOT NULL,
  `projectBudget` int(100) UNSIGNED NOT NULL,
  `currencyType` char(3) NOT NULL COMMENT 'Currency value entired for ex: " INR/ USD"',
  `refundedAmount` int(100) UNSIGNED NOT NULL,
  `paymentMethodId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "payment_method" table',
  `paymentType` varchar(50) NOT NULL COMMENT '''Populate "id" field value from "payment_method" table''',
  `customerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "customers" table',
  `companyName` varchar(255) NOT NULL COMMENT 'Populate "companyName" field value from "customers" table',
  `customerName` varchar(255) DEFAULT NULL COMMENT 'Populate "customerName" field value from "customers" table',
  `clientDescription` text NOT NULL,
  `refundStatus` enum('paid','pending','cancelled','open') NOT NULL DEFAULT 'open',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores refunds data';

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `refundId`, `orderId`, `refundReason`, `invoiceDoc`, `dateOfPaid`, `projectBudget`, `currencyType`, `refundedAmount`, `paymentMethodId`, `paymentType`, `customerId`, `companyName`, `customerName`, `clientDescription`, `refundStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'RID-00000001', 1, 'Bigdata project - Milestone 4', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-05-16 01:12:00', 100000, 'INR', 100000, 2, 'Check', 1, 'zoho', 'vimal', 'Bigdata project - Milestone 4 esciation due to failed', 'paid', 1, 0, '2022-11-07 13:01:36.428', NULL, '2022-11-07 13:01:36.428'),
(2, 'RID-00000002', 4, 'AI project - Milestone 8 esciation', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-08-18 00:00:00', 1000000, 'USD', 1000000, 5, 'Mobile payment', 3, 'HCL', 'raj', 'AI project - Milestone 8 esciation due to failed config', 'cancelled', 0, 0, '2022-11-07 13:04:05.192', NULL, '2022-11-07 13:04:05.192'),
(3, 'RID-00000003', 3, 'ClickUp project - Milestone 10', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-11-06 00:00:00', 10000000, 'INR', 10000000, 2, 'Check', 2, 'Tcs', 'vimal raj', 'ClickUp project - Milestone 10 esciation due to failed details', 'pending', 0, 0, '2022-11-08 05:25:34.074', NULL, '2022-11-08 05:25:34.074'),
(4, 'RID-00000004', 2, 'Terolo project - Milestone 5 refunds module', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-11-10 12:30:01', 100000, 'INR', 100000, 3, 'Debit card', 2, 'Thinroot', 'Abishek', 'Terolo project - Milestone 5 esciation due to failed', 'pending', 1, 0, '2022-11-16 11:30:58.062', NULL, '2022-11-16 11:30:58.062'),
(5, 'RID-00000005', 1, 'Mentor project - Milestone 8 payment module', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-11-14 00:00:00', 100000, 'USD', 100000, 6, 'Electronic bank transfer', 5, 'OneuxDigital', 'Srikanth', 'Mentor project - Milestone 8 esciation due to failed', 'paid', 0, 0, '2022-11-16 11:33:55.872', NULL, '2022-11-16 11:33:55.872'),
(6, 'RID-00000006', 8, 'Mentor project  Milestone  payment', 'file:///D://Thinroot%20projects//terolo%20project//backEnd//terolo_backend//terolo_backend//uploads//invoiceDoc-6022cd71-7cce-4046-a5b1-ae5baaba7b79.png', '2022-11-16 06:30:00', 600000, 'CAD', 300000, 6, 'Electronic bank transfer', 0, 'CTS', 'Srikanth', '&lt;p>Mentor project - Milestone 11 esciation due to failed&lt;/p>\n', 'cancelled', 0, 0, '2022-11-16 11:39:21.296', NULL, '2022-11-16 11:39:21.296'),
(7, 'RID-00000007', 3, 'Terolo project - Milestone 11 payment table module', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', '2022-11-16 00:00:00', 3000, 'CAD', 3000, 6, 'Electronic bank transfer', 9, 'OneuxDigital', 'Hari', 'Terolo project - Milestone 11 esciation due to failed', 'pending', 0, 0, '2022-11-16 12:08:45.491', NULL, '2022-11-16 12:08:45.491'),
(11, 'RID-00000011', 7, 'payment issues pending process ', 'D:\\Thinroot projects\\terolo project\\backEnd\\terolo_backend\\terolo_backend\\uploads\\invoiceDoc-57c661b9-9106-41f8-bc7b-be88a25606f1.pdf', '2022-11-02 06:30:00', 7000000, 'INR', 50000, 5, 'Mobile payment', NULL, '', 'santhosh', '&lt;p>&lt;p&gt;paid too much &lt;/p&gt;&lt;/p>\n', 'pending', 0, 0, '2022-11-24 08:07:45.964', NULL, '2022-11-24 08:07:45.964'),
(12, 'RID-00000012', 2, 'Its validation issues ', 'D:\\Thinroot projects\\terolo project\\backEnd\\terolo_backend\\terolo_backend\\uploads\\invoiceDoc-57c661b9-9106-41f8-bc7b-be88a25606f1.pdf', '2022-11-07 06:30:00', 9000000, 'CAD', 50000, 6, 'Electronic bank transfer', NULL, '', 'santhosh', '&lt;p>&lt;p&gt;paid too much &lt;/p&gt;&lt;/p>\n', 'cancelled', 0, 0, '2022-11-24 08:09:44.959', NULL, '2022-11-24 08:09:44.959'),
(13, 'RID-00000013', 5, 'checkbox validation missing', 'D:\\Thinroot projects\\terolo project\\backEnd\\terolo_backend\\terolo_backend\\uploads\\invoiceDoc-57c661b9-9106-41f8-bc7b-be88a25606f1.pdf', '2022-11-10 06:30:00', 5000000, 'INR', 90000, 4, 'Credit card', NULL, '', 'santhosh', '&lt;p>&lt;p&gt;&lt;p&gt;paid too much &lt;/p&gt;&lt;/p&gt;&lt;/p>\n', 'pending', 0, 0, '2022-11-24 08:10:43.863', NULL, '2022-11-24 08:10:43.863'),
(14, 'RID-00000014', NULL, 'fine its no any other reason', 'D:\\Thinroot projects\\terolo project\\backEnd\\terolo_backend\\terolo_backend\\uploads\\invoiceDoc-de388f17-a1c5-4060-8804-9e9419e698ee.octet-stream', '2022-11-02 06:30:00', 80000000, 'USD', 10000000, 1, 'Cash', NULL, '', 'mathan', '&lt;p>Its not any consulting&lt;/p>\n', 'pending', 0, 0, '2022-11-28 06:58:15.135', NULL, '2022-11-28 06:58:15.135'),
(15, 'RID-00000015', 8, 'Good', 'D:\\Thinroot projects\\terolo project\\backEnd\\terolo_backend\\terolo_backend\\uploads\\invoiceDoc-826a2c9b-5a02-4c2e-9f25-10f5d1ba4922.vnd.openxmlformats-officedocument.wordprocessingml.document', '2022-11-21 06:30:00', 600000, 'USD', 80000, 1, 'Cash', NULL, '', 'prasanth', '&lt;p>&lt;p&gt;Sample refer data check field&lt;/p&gt;&lt;/p>\n', 'paid', 0, 0, '2022-11-28 06:37:16.357', NULL, '2022-11-28 06:37:16.357');

-- --------------------------------------------------------

--
-- Table structure for table `shareholders`
--

CREATE TABLE `shareholders` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `businessId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "business" table',
  `business_owner_id` int(11) UNSIGNED DEFAULT NULL COMMENT 'Populate "id" field value from "people" table',
  `din` varchar(50) NOT NULL COMMENT 'Director Identification Number (DIN)',
  `peopleId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "people" table',
  `shareholders_name` varchar(100) NOT NULL COMMENT 'Populate "name" field value from "people" table',
  `share_value` int(11) UNSIGNED NOT NULL,
  `share_value_currency` char(3) NOT NULL COMMENT 'Currency value entired for ex: " INR/ USD"',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '	isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores shareholders data';

--
-- Dumping data for table `shareholders`
--

INSERT INTO `shareholders` (`id`, `businessId`, `business_owner_id`, `din`, `peopleId`, `shareholders_name`, `share_value`, `share_value_currency`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 1, 6, 'UCD123456789002', 1, 'Gokul Raj', 30, 'INR', 1, 6, '2022-10-17 14:00:49.577', NULL, '2022-10-17 14:00:49.577'),
(2, 2, 1, 'UCD123456789002', 2, 'Siva Barathi', 15, 'INR', 0, 1, '2022-10-17 14:04:37.937', NULL, '2022-10-17 14:04:37.937'),
(3, 2, 1, 'UCD123456789002', 8, 'Vijay Kumar', 25, 'INR', 0, 1, '2022-10-17 14:04:37.945', NULL, '2022-10-17 14:04:37.945'),
(4, 2, 1, 'UCD123456789002', 3, 'Hemnath Srikanth', 10, 'INR', 0, 1, '2022-10-17 14:04:37.952', NULL, '2022-10-17 14:04:37.952'),
(5, 3, 6, 'UCD1234', 4, 'Kavi arasan', 15, 'INR', 0, 6, '2022-10-17 15:05:33.832', 6, '2022-10-17 15:05:33.832'),
(6, 3, 6, 'UCD5678', 8, 'Vijay Kumar', 25, 'INR', 0, 6, '2022-10-17 15:05:33.839', 6, '2022-10-17 15:05:33.839'),
(7, 3, 6, 'UCD9123', 3, 'Hemnath Srikanth', 10, 'INR', 0, 6, '2022-10-17 15:05:33.846', 6, '2022-10-17 15:05:33.846'),
(8, 3, 6, 'UCD9002', 1, 'Gokul Raj', 10, 'INR', 0, 6, '2022-10-17 15:05:33.854', 6, '2022-10-17 15:05:33.854');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `ticketId` varchar(12) NOT NULL COMMENT 'Populate "id" field value from the same "tickets" table ',
  `issueTitle` varchar(100) NOT NULL,
  `ticketCategory` varchar(100) NOT NULL,
  `ticketPriority` varchar(100) NOT NULL,
  `companyDetail` varchar(100) NOT NULL,
  `ticketDescription` text NOT NULL,
  `ticketIssueImage` varchar(255) NOT NULL,
  `ticketIssueImageName` varchar(255) NOT NULL,
  `ticketIssueDocName` varchar(255) NOT NULL,
  `ticketIssueDoc` varchar(255) NOT NULL,
  `peopleId` varchar(100) NOT NULL COMMENT 'Populate "id" field value from the same "people" table ',
  `dateOfCreate` datetime(3) NOT NULL,
  `ticketStatus` varchar(100) NOT NULL,
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '''isDeleted value is "0: isVisible", "1: notVisible" on the data''',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores tickets data';

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `ticketId`, `issueTitle`, `ticketCategory`, `ticketPriority`, `companyDetail`, `ticketDescription`, `ticketIssueImage`, `ticketIssueImageName`, `ticketIssueDocName`, `ticketIssueDoc`, `peopleId`, `dateOfCreate`, `ticketStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'TID-00000001', 'Text color needs to change ', 'service', 'Urgent', 'ONEUX', 'Multiple selection for people designation', '/home/lebathinroot/public_html/terolo-backend/uploads/file-86f7ebc8-59ea-49ac-aa8a-e4595e31dc30.plain', 'Selenium.pdf', 'email.png', '/home/lebathinroot/public_html/terolo-backend/uploads/file-4c3d1b82-8c5b-4ff6-b8f7-e2b821e2d927.plain', '8', '2022-06-18 00:00:00.000', 'Yet to assign', 0, 0, '2022-12-06 06:20:00.136', NULL, '2022-12-06 06:20:00.136'),
(2, 'TID-00000002', 'Filter Function ', 'product', 'Important', 'ONEUX', 'Multiple selection for people designation', '/home/lebathinroot/public_html/terolo-backend/uploads/file-86f7ebc8-59ea-49ac-aa8a-e4595e31dc30.plain', 'Selenium.pdf', 'email.png', '/home/lebathinroot/public_html/terolo-backend/uploads/file-4c3d1b82-8c5b-4ff6-b8f7-e2b821e2d927.plain', '8', '2022-06-18 00:00:00.000', 'Closed', 0, 0, '2022-12-06 06:20:21.219', NULL, '2022-12-06 06:20:21.219'),
(3, 'TID-00000003', 'Filter Function ', 'service', 'Nice to be done', 'ONEUX', 'Multiple selection for people designation', '/home/lebathinroot/public_html/terolo-backend/uploads/file-86f7ebc8-59ea-49ac-aa8a-e4595e31dc30.plain', 'Selenium.pdf', 'email.png', '/home/lebathinroot/public_html/terolo-backend/uploads/file-4c3d1b82-8c5b-4ff6-b8f7-e2b821e2d927.plain', '8', '2022-11-04 18:30:00.000', 'In Progress', 0, 0, '2022-12-06 07:16:00.775', NULL, '2022-12-06 07:16:00.775'),
(4, 'TID-00000004', 'Filter Function ', 'service', 'Urgent', 'ONEUX', 'Multiple selection for people designation', '/home/lebathinroot/public_html/terolo-backend/uploads/file-86f7ebc8-59ea-49ac-aa8a-e4595e31dc30.plain', 'Selenium.pdf', 'email.png', '/home/lebathinroot/public_html/terolo-backend/uploads/file-4c3d1b82-8c5b-4ff6-b8f7-e2b821e2d927.plain', '8', '2022-11-04 18:30:00.000', 'Yet to assign', 0, 0, '2022-12-06 07:16:54.315', NULL, '2022-12-06 07:16:54.315'),
(5, 'TID-00000005', ' Multiple Selection ', 'product', 'Important', 'ONEUX', 'Multiple selection for people designation', '/home/lebathinroot/public_html/terolo-backend/uploads/file-86f7ebc8-59ea-49ac-aa8a-e4595e31dc30.plain', 'Selenium.pdf', 'email.png', '/home/lebathinroot/public_html/terolo-backend/uploads/file-4c3d1b82-8c5b-4ff6-b8f7-e2b821e2d927.plain', '7,2', '2022-11-04 18:30:00.000', 'In Progress', 0, 0, '2022-12-06 09:00:02.892', NULL, '2022-12-06 09:00:02.892');

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
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODQxOTc1MSwiZXhwIjoxNjcxMDExNzUxLCJ0eXBlIjoicmVmcmVzaCJ9.IgXkFvowa3dSfXms4XvuejZg1eHGGsVcGvViXOi5FO8', 4, 'refresh', '2022-12-14 09:55:51', 0, 4, '2022-11-14 09:55:51.561', NULL, '2022-11-14 09:55:51.561'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODQyMjEyOSwiZXhwIjoxNjcxMDE0MTI5LCJ0eXBlIjoicmVmcmVzaCJ9.1YYZTQxHn_sjsSrUFp892WfkPWXPRNlKCIs1MY2_94I', 4, 'refresh', '2022-12-14 10:35:29', 0, 4, '2022-11-14 10:35:29.764', NULL, '2022-11-14 10:35:29.764'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODUyMjI4NCwiZXhwIjoxNjcxMTE0Mjg0LCJ0eXBlIjoicmVmcmVzaCJ9.jOfROBhcvpKv9x45dRHPAOqRpVXpQGEIJP0GgRZTMNQ', 4, 'refresh', '2022-12-15 14:24:44', 0, 4, '2022-11-15 14:24:44.651', NULL, '2022-11-15 14:24:44.651'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODYwMjgzNCwiZXhwIjoxNjcxMTk0ODM0LCJ0eXBlIjoicmVmcmVzaCJ9.Th2mRpGttpICAMP9wkmZpQ-WqAKdQinuZRmqtg4vJAo', 4, 'refresh', '2022-12-16 12:47:14', 0, 4, '2022-11-16 12:47:14.744', NULL, '2022-11-16 12:47:14.744'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODY5MjM1OSwiZXhwIjoxNjcxMjg0MzU5LCJ0eXBlIjoicmVmcmVzaCJ9.DQvIY5BMuZ4HvTaubFtjf-Ti9yq9wrEM8onjmz4kbIA', 4, 'refresh', '2022-12-17 13:39:19', 0, 4, '2022-11-17 13:39:19.509', NULL, '2022-11-17 13:39:19.509'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODc2MDkxOSwiZXhwIjoxNjcxMzUyOTE5LCJ0eXBlIjoicmVmcmVzaCJ9.tFS-qyUUeN7qChjUV6ZaOADd6evnoLv5ulr1RQNRXuc', 4, 'refresh', '2022-12-18 08:41:59', 0, 4, '2022-11-18 08:41:59.263', NULL, '2022-11-18 08:41:59.263'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODc2MTE5MiwiZXhwIjoxNjcxMzUzMTkyLCJ0eXBlIjoicmVmcmVzaCJ9.-h-a2OXDx8SFuBBUrhZho9yk-LBZ8meZv1_yErWv-iA', 4, 'refresh', '2022-12-18 08:46:32', 0, 4, '2022-11-18 08:46:32.406', NULL, '2022-11-18 08:46:32.406'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2ODc1OTM3MywiZXhwIjoxNjcxMzUxMzczLCJ0eXBlIjoicmVmcmVzaCJ9.zjqfOaTKPk8VZaaL_rEq4AYaRcg2Xj2qB8dZZ89tkcs', 4, 'refresh', '2022-12-18 08:16:13', 0, 4, '2022-11-18 08:16:13.782', NULL, '2022-11-18 08:16:13.782'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTAxNjY2OCwiZXhwIjoxNjcxNjA4NjY4LCJ0eXBlIjoicmVmcmVzaCJ9.yvjokiwW46ZgUcySfGlQ2MqTtQUQdMAe3P0uAoraXOQ', 4, 'refresh', '2022-12-21 07:44:28', 0, 4, '2022-11-21 07:44:28.589', NULL, '2022-11-21 07:44:28.589'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTEwMjk4MiwiZXhwIjoxNjcxNjk0OTgyLCJ0eXBlIjoicmVmcmVzaCJ9.BNB4zhrK04MmWSzK-6zVi3jYGWqeTzlnSaSFKhX1pfw', 4, 'refresh', '2022-12-22 07:43:02', 0, 4, '2022-11-22 07:43:02.938', NULL, '2022-11-22 07:43:02.938'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTIwODczNCwiZXhwIjoxNjcxODAwNzM0LCJ0eXBlIjoicmVmcmVzaCJ9.TjCpU_4UEcjz56y4cWFsxHumyhcC5-Ru-Nsh76a-eV8', 4, 'refresh', '2022-12-23 13:05:34', 0, 4, '2022-11-23 13:05:34.966', NULL, '2022-11-23 13:05:34.966'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI2ODI0MCwiZXhwIjoxNjcxODYwMjQwLCJ0eXBlIjoicmVmcmVzaCJ9.HFTUQ4Gdiotui9GbtAW5mWtuz-6e6mJpd05uRFWBTYc', 4, 'refresh', '2022-12-24 05:37:20', 0, 4, '2022-11-24 05:37:20.620', NULL, '2022-11-24 05:37:20.620'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI3MDA1NywiZXhwIjoxNjcxODYyMDU3LCJ0eXBlIjoicmVmcmVzaCJ9.HfguLv2acZ2OReTNz5olj2_yM3OxAhVmn2dxTUFuRLw', 4, 'refresh', '2022-12-24 06:07:37', 0, 4, '2022-11-24 06:07:37.307', NULL, '2022-11-24 06:07:37.307'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI3MDI3NiwiZXhwIjoxNjcxODYyMjc2LCJ0eXBlIjoicmVmcmVzaCJ9.OvSlwJ78RHYyIrmHM17RxvGJoFAGr-LRw01bybFBQFI', 4, 'refresh', '2022-12-24 06:11:16', 0, 4, '2022-11-24 06:11:16.081', NULL, '2022-11-24 06:11:16.081'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI3MDkxNSwiZXhwIjoxNjcxODYyOTE1LCJ0eXBlIjoicmVmcmVzaCJ9.VWdBc6QBEKFjInulXoGkX5cj-L3P0cFh0JoqeCo2FVo', 4, 'refresh', '2022-12-24 06:21:55', 0, 4, '2022-11-24 06:21:55.083', NULL, '2022-11-24 06:21:55.083'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI3NzE3OCwiZXhwIjoxNjcxODY5MTc4LCJ0eXBlIjoicmVmcmVzaCJ9.dqhH8mfCb18KuE3bMuDUCCPGpFkzennUuUE58z7RaHY', 4, 'refresh', '2022-12-24 08:06:18', 0, 4, '2022-11-24 08:06:18.763', NULL, '2022-11-24 08:06:18.763'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTI3NzY1MiwiZXhwIjoxNjcxODY5NjUyLCJ0eXBlIjoicmVmcmVzaCJ9.5VOMjIpxt9fEo9Lr9TEi-CkBu1340GC5Ckua2VeVcxo', 4, 'refresh', '2022-12-24 08:14:12', 0, 4, '2022-11-24 08:14:12.773', NULL, '2022-11-24 08:14:12.773'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTM2NDAxMCwiZXhwIjoxNjcxOTU2MDEwLCJ0eXBlIjoicmVmcmVzaCJ9.-1x1FxxPJ3pEZoEaFhPeDTR9nljfWcyoAdVBTe_ltEE', 4, 'refresh', '2022-12-25 08:13:30', 0, 4, '2022-11-25 08:13:30.885', NULL, '2022-11-25 08:13:30.885'),
(72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTM3Njg2MSwiZXhwIjoxNjcxOTY4ODYxLCJ0eXBlIjoicmVmcmVzaCJ9.Z5FFBd4_VkNwvNpVhQHqaqsiC6rZ3Gst3MpwxzlKqfw', 4, 'refresh', '2022-12-25 11:47:41', 0, 4, '2022-11-25 11:47:41.827', NULL, '2022-11-25 11:47:41.827'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTYxOTMyOSwiZXhwIjoxNjcyMjExMzI5LCJ0eXBlIjoicmVmcmVzaCJ9.zW7CR7H39p-tLIRpdZVJ-u04nhteU19Lp5lvNKMt1As', 4, 'refresh', '2022-12-28 07:08:49', 0, 4, '2022-11-28 07:08:49.322', NULL, '2022-11-28 07:08:49.322'),
(79, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTc4NDg3NywiZXhwIjoxNjcyMzc2ODc3LCJ0eXBlIjoicmVmcmVzaCJ9.ORB-MWWP8RJu7qJAcNJtolGGi2YVqzl2n77sqDHM6oo', 4, 'refresh', '2022-12-30 05:07:57', 0, 4, '2022-11-30 05:07:57.062', NULL, '2022-11-30 05:07:57.062'),
(81, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2OTg5NjQ3OCwiZXhwIjoxNjcyNDg4NDc4LCJ0eXBlIjoicmVmcmVzaCJ9.f4K_w36QNdcViTQ2MdpHLs5_oJvKrSkUl1cZbut5DFc', 1, 'refresh', '2022-12-31 12:07:58', 0, 1, '2022-12-01 12:07:58.412', NULL, '2022-12-01 12:07:58.412'),
(82, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTk3MTk2OSwiZXhwIjoxNjcyNTYzOTY5LCJ0eXBlIjoicmVmcmVzaCJ9.bGd-075oTYK2MSgxY55aS3856GWTa7xY2p-ayqYXbxQ', 4, 'refresh', '2023-01-01 09:06:09', 0, 4, '2022-12-02 09:06:09.312', NULL, '2022-12-02 09:06:09.312'),
(83, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTk3MTg0MCwiZXhwIjoxNjcyNTYzODQwLCJ0eXBlIjoicmVmcmVzaCJ9.Q1czJgS4SQFt7u7e02BJJUyvvFtj5KK-lAUGdnx-kI8', 4, 'refresh', '2023-01-01 09:04:00', 0, 4, '2022-12-02 09:04:00.601', NULL, '2022-12-02 09:04:00.601'),
(84, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY2OTk3MjQ5MSwiZXhwIjoxNjcyNTY0NDkxLCJ0eXBlIjoicmVmcmVzaCJ9.j7ouPz5iH8cI7YbNfkT2MXuI82uQ9KrPGQlz4_-DTqg', 1, 'refresh', '2023-01-01 09:14:51', 0, 1, '2022-12-02 09:14:51.302', NULL, '2022-12-02 09:14:51.302'),
(85, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY2OTk2OTQ2NiwiZXhwIjoxNjcyNTYxNDY2LCJ0eXBlIjoicmVmcmVzaCJ9._Ozn-3HJgT-pC8WvgTz8W-udMYxUQ9hjdNbPSI_lhYI', 4, 'refresh', '2023-01-01 08:24:26', 0, 4, '2022-12-02 08:24:26.050', NULL, '2022-12-02 08:24:26.050'),
(86, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDIyODUyMywiZXhwIjoxNjcyODIwNTIzLCJ0eXBlIjoicmVmcmVzaCJ9.EuFcdG66A2wHiO7o7U2rRpmpOiP_WOuF0HOWAiDa_dQ', 4, 'refresh', '2023-01-04 08:22:03', 0, 4, '2022-12-05 08:22:03.164', NULL, '2022-12-05 08:22:03.164'),
(87, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDMwNzU2NCwiZXhwIjoxNjcyODk5NTY0LCJ0eXBlIjoicmVmcmVzaCJ9.V30Z_DSdBxmm44-uL9g25GfowomU5J0v2nrGezuvktU', 4, 'refresh', '2023-01-05 06:19:24', 0, 4, '2022-12-06 06:19:24.929', NULL, '2022-12-06 06:19:24.929'),
(88, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDMwNjUxNywiZXhwIjoxNjcyODk4NTE3LCJ0eXBlIjoicmVmcmVzaCJ9.tHz2tzmR4cBZxNdHI_emlXJtvA_jVBG35ctOo6NWU_s', 4, 'refresh', '2023-01-05 06:01:57', 0, 4, '2022-12-06 06:01:57.145', NULL, '2022-12-06 06:01:57.145'),
(92, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDMwODgyOSwiZXhwIjoxNjcyOTAwODI5LCJ0eXBlIjoicmVmcmVzaCJ9.Fuwm7zajgd6N1jDeJ4YHsS6wBvDCtSwxIP2mzBZq8Ow', 4, 'refresh', '2023-01-05 06:40:29', 0, 4, '2022-12-06 06:40:29.479', NULL, '2022-12-06 06:40:29.479'),
(93, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDU2NTQ1MywiZXhwIjoxNjczMTU3NDUzLCJ0eXBlIjoicmVmcmVzaCJ9.OJSHhVIRgfcbzaaIJSW2WI-emjts4Yg-PGiUAMj1-5Q', 4, 'refresh', '2023-01-08 05:57:33', 0, 4, '2022-12-09 05:57:33.564', NULL, '2022-12-09 05:57:33.564'),
(97, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDU4OTE2MiwiZXhwIjoxNjczMTgxMTYyLCJ0eXBlIjoicmVmcmVzaCJ9.utj7rzEea0qUEDHoFOl5W4nfFMbWgzroMnQ_o0hBCck', 4, 'refresh', '2023-01-08 12:32:42', 0, 4, '2022-12-09 12:32:42.241', NULL, '2022-12-09 12:32:42.241'),
(98, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDU4Nzc4NSwiZXhwIjoxNjczMTc5Nzg1LCJ0eXBlIjoicmVmcmVzaCJ9.pYsybpDI80HcvGZNLNPXRT7csWG98nnNZmN0mrufI1g', 4, 'refresh', '2023-01-08 12:09:45', 0, 4, '2022-12-09 12:09:45.844', NULL, '2022-12-09 12:09:45.844'),
(99, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlhdCI6MTY3MDU4NjQxMCwiZXhwIjoxNjczMTc4NDEwLCJ0eXBlIjoicmVmcmVzaCJ9.iKybJaZx4s8HLl98u0MGqeKfChlKu65Ek3y7XT5Vghc', 4, 'refresh', '2023-01-08 11:46:50', 0, 4, '2022-12-09 11:46:50.808', NULL, '2022-12-09 11:46:50.808');

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
(1, 'Admin', 'admin@thinroot.in', '$2a$08$DQtkjkiSKjr0cb//9EzfhuwN28dMpjKjZ4XWbz1vZhcmcnp57Io0m', 'admin', 'Active', 0, 0, '2022-10-10 09:12:52.176', NULL, '2022-10-10 09:12:52.176'),
(2, 'SuperAdmin', 'superadmin@thinroot.in', '$2a$08$XJUMItQS9mG4Jnd/1Lb7LuzWYxnsHeYvR/V.3TLYyh3diTofifwD.', 'superAdmin', 'Active', 0, 0, '2022-10-10 09:14:18.409', NULL, '2022-10-10 09:14:18.409'),
(3, 'Gokul', 'gokulrajthangavel1998@gmail.com', '$2a$08$j0a/UYO8rY/sGww4V3xjvuQ6prZKl93IqbWFvouWjIQY5rypIRqEC', 'user', 'Active', 0, 0, '2022-11-02 03:59:42.814', NULL, '2022-11-02 03:59:42.814'),
(4, 'vimal', 'vimalraj.m@thinroot.in', '$2a$08$z8l4L36Zza9BG1FoD.ATq.IrkZakU1Hay.KQLt3LUK9UL4WDkSo1i', 'superAdmin', 'Active', 0, 0, '2022-11-02 04:01:28.609', NULL, '2022-11-02 04:01:28.609'),
(5, 'Hari', 'veeramvr003@gmail.com', '$2a$08$8O8VRJVRpFGCNLIipA3GI.BhdaoYV1Bp8FNA9t.QGyqQ1WyKzRRaS', 'superAdmin', 'Active', 0, 0, '2022-11-03 05:19:27.958', NULL, '2022-11-03 05:19:27.958'),
(6, 'srikanth', 'srikanth.s@oneuxdigital.com', '$2a$08$LD636uUXLUTLRAEmtdknqO3UPLAdyQ7mOR6xO8zOkMxSQGBYD5i9G', 'user', 'Active', 0, 0, '2022-11-03 05:24:29.546', NULL, '2022-11-03 05:24:29.546'),
(7, 'Santhosh', 'vimalvr003@gmail.com', '$2a$08$wL/6kOafvBWMKgM4g96EqOapiiew4T2sYY9opNnCURHzhOpdvk7LW', 'superAdmin', 'Active', 0, 0, '2022-11-04 04:56:01.935', NULL, '2022-11-04 04:56:01.935');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_address`
--
ALTER TABLE `business_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_category`
--
ALTER TABLE `business_category`
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
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_company_details`
--
ALTER TABLE `customers_company_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_project_details`
--
ALTER TABLE `customers_project_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_project_team`
--
ALTER TABLE `customer_project_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_approve`
--
ALTER TABLE `expenses_approve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses_status`
--
ALTER TABLE `expenses_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordersprojectdetails`
--
ALTER TABLE `ordersprojectdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_grievances`
--
ALTER TABLE `payment_grievances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people_education`
--
ALTER TABLE `people_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_details`
--
ALTER TABLE `project_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_via`
--
ALTER TABLE `purchase_via`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shareholders`
--
ALTER TABLE `shareholders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
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
-- AUTO_INCREMENT for table `business_address`
--
ALTER TABLE `business_address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_category`
--
ALTER TABLE `business_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_list_master`
--
ALTER TABLE `business_list_master`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `business_type`
--
ALTER TABLE `business_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers_company_details`
--
ALTER TABLE `customers_company_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers_project_details`
--
ALTER TABLE `customers_project_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_project_team`
--
ALTER TABLE `customer_project_team`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `expenses_approve`
--
ALTER TABLE `expenses_approve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `expenses_status`
--
ALTER TABLE `expenses_status`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ordersprojectdetails`
--
ALTER TABLE `ordersprojectdetails`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payment_grievances`
--
ALTER TABLE `payment_grievances`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `people_education`
--
ALTER TABLE `people_education`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_via`
--
ALTER TABLE `purchase_via`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shareholders`
--
ALTER TABLE `shareholders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
