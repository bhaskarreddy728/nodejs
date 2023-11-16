-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 06:39 AM
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
  `orderId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "Order" table',
  `refundReason` varchar(255) NOT NULL,
  `invoiceDoc` varchar(255) NOT NULL,
  `projectBudget` int(100) UNSIGNED NOT NULL,
  `currencyType` char(3) NOT NULL COMMENT 'Currency value entired for ex: " INR/ USD"',
  `refundedAmount` int(100) UNSIGNED NOT NULL,
  `paymentMethodId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "payment_method" table',
  `paymentType` varchar(50) NOT NULL COMMENT '''Populate "id" field value from "payment_method" table''',
  `customerId` int(11) UNSIGNED NOT NULL COMMENT 'Populate "id" field value from "customers" table',
  `companyName` varchar(255) NOT NULL COMMENT 'Populate "companyName" field value from "customers" table',
  `customerName` varchar(255) NOT NULL COMMENT 'Populate "customerName" field value from "customers" table',
  `clientDescription` text NOT NULL,
  `refundStatus` enum('paid','pending','cancelled') NOT NULL DEFAULT 'pending',
  `isDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'isDeleted value is "0: isVisible", "1: notVisible" on the data',
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "user_masters" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "user_masters" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores refunds data';

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `refundId`, `orderId`, `refundReason`, `invoiceDoc`, `projectBudget`, `currencyType`, `refundedAmount`, `paymentMethodId`, `paymentType`, `customerId`, `companyName`, `customerName`, `clientDescription`, `refundStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'RID-00000001', 1, 'Bigdata project - Milestone 4', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', 100000, 'INR', 100000, 2, 'Check', 1, 'Tcs', 'vimal', 'Bigdata project - Milestone 4 esciation due to failed', 'pending', 0, 0, '2022-11-07 13:01:36.428', NULL, '2022-11-07 13:01:36.428'),
(2, 'RID-00000002', 4, 'AI project - Milestone 8 esciation', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', 1000000, 'INR', 1000000, 5, 'Mobile payment', 3, 'HCL', 'raj', 'AI project - Milestone 8 esciation due to failed config', 'cancelled', 1, 0, '2022-11-07 13:04:05.192', NULL, '2022-11-07 13:04:05.192'),
(3, 'RID-00000003', 3, 'ClickUp project - Milestone 10', 'invoiceDoc-9fc31459-7697-4a5d-a799-dc0ed1132ec6.plain', 10000000, 'INR', 10000000, 2, 'Check', 2, 'Zoho', 'vimal raj', 'ClickUp project - Milestone 10 esciation due to failed details', 'pending', 0, 0, '2022-11-08 05:25:34.074', NULL, '2022-11-08 05:25:34.074');

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
  `ticketIssueDoc` varchar(255) NOT NULL,
  `peopleId` int(11) NOT NULL,
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

INSERT INTO `tickets` (`id`, `ticketId`, `issueTitle`, `ticketCategory`, `ticketPriority`, `companyDetail`, `ticketDescription`, `ticketIssueImage`, `ticketIssueDoc`, `peopleId`, `ticketStatus`, `isDeleted`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'TID-00000001', 'Navigate issue', 'product support', 'important', 'CHS', 'change the logo color', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 4, 'InProgress', 1, 0, '2022-10-31 08:35:56.382', NULL, '2022-10-31 08:35:56.382'),
(2, 'TID-00000002', 'Logo color Change', 'It support', 'important', 'Thinroot', 'change the logo color', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 5, 'InProgress', 1, 0, '2022-10-31 08:37:16.904', NULL, '2022-10-31 08:37:16.904'),
(3, 'TID-00000003', 'Banner color Change', 'It support', 'urgent', 'Thinroot', 'change the logo color', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 1, 'Yestoassign', 0, 0, '2022-10-31 13:31:45.329', NULL, '2022-10-31 13:31:45.329'),
(4, 'TID-00000004', 'Layout background color Change', 'Product support', 'urgent', 'Thinroot', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 2, 'Yestoassign', 0, 0, '2022-10-31 13:32:41.294', NULL, '2022-10-31 13:32:41.294'),
(5, 'TID-00000005', 'ticket add fuction issues', 'Product support', 'urgent', 'Thinroot', 'background color change', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 4, 'Yestoassign', 0, 0, '2022-11-02 03:53:59.407', NULL, '2022-11-02 03:53:59.407'),
(6, 'TID-00000006', 'ticket get method issues', 'It support', 'urgent', 'CHS', 'Fixed the issues', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 5, 'Yestoassign', 0, 0, '2022-11-02 03:31:56.768', NULL, '2022-11-02 03:31:56.768'),
(7, 'TID-00000007', 'ticket get method issues', 'It support', 'urgent', 'CHS', 'Fixed the issues', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 1, 'Yestoassign', 0, 0, '2022-11-02 03:30:39.238', NULL, '2022-11-02 03:30:39.238'),
(8, 'TID-00000008', 'ticket create method some field is missing', 'Product support', 'urgent', 'CHS', 'Fixed that issues', 'ticketIssueImage-5eb5ef15-22de-4ead-b4db-7ee526304823.png', 'ticketIssueDoc-60b1b17a-141c-4e61-a9bc-3ace8052bae7.plain', 4, 'Yestoassign', 0, 0, '2022-11-03 05:45:16.477', NULL, '2022-11-03 05:45:16.477'),
(9, 'TID-00000009', 'customer module create method some field is missing', 'Product support', 'urgent', 'Thinroot', 'Fixed that issues', 'ticketIssueImage-2ffcc7f3-a5c3-4280-bbde-5d06be2164dd.png', 'ticketIssueDoc-750553a9-79f7-4920-8c02-c1916bd58af8.plain', 2, 'Yestoassign', 0, 0, '2022-11-03 05:56:34.198', NULL, '2022-11-03 05:56:34.198');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shareholders`
--
ALTER TABLE `shareholders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
