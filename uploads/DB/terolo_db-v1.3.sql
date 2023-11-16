-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2022 at 11:08 AM
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
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `currentDesignation` varchar(255) NOT NULL,
  `currentCompany` varchar(255) NOT NULL,
  `currentTools` varchar(255) NOT NULL,
  `currentSkills` varchar(255) NOT NULL,
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

INSERT INTO `employee_details` (`id`, `currentDesignation`, `currentCompany`, `currentTools`, `currentSkills`, `experianceDesignation`, `experianceCompany`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, ' project', 'Thinroot', 'nodejs', 'react', 'team lead', 'crosshurdal', 0, '2022-09-28 04:34:22.101', NULL, '2022-09-28 04:34:22.101'),
(2, 'Team lead', 'crosshurdel', 'mongodb', 'angular', 'team lead', 'Thinroot', 0, '2022-09-28 07:34:06.550', NULL, '2022-09-28 07:34:06.550'),
(3, 'Team lead', 'crosshurdel', 'mongodb', 'angular', 'team lead', 'Thinroot', 0, '2022-09-28 07:34:39.197', NULL, '2022-09-28 07:34:39.197'),
(4, 'Team lead', 'crosshurdel', 'mongodb', 'angular', 'team lead', 'Thinroot', 0, '2022-09-28 07:45:31.304', NULL, '2022-09-28 07:45:31.304'),
(5, 'lead', 'crosshurdel', 'mongodb', 'angular', 'team lead', 'Thinroot', 0, '2022-09-28 07:49:31.736', NULL, '2022-09-28 07:49:31.736'),
(6, 'lead', 'crosshurdel', 'mongodb', 'angular', 'team lead', 'Thinroot', 0, '2022-09-28 07:56:57.966', NULL, '2022-09-28 07:56:57.966'),
(8, ' project', 'Thinroot', 'nodejs', 'react', 'team lead', 'crosshurdal', 0, '2022-09-28 11:15:28.398', NULL, '2022-09-28 11:15:28.398'),
(12, ' project', 'Thinroot', 'figma', 'react', 'team lead', 'crosshurdal', 0, '2022-09-30 08:46:03.378', NULL, '2022-09-30 08:46:03.378');

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
(2, 'e98d82ce-cfc0-4d9d-9b07-c9bbadcd24e2', 6, 0, '2022-09-27', '2022-09-28', '10000.00', '100.00', '999.99', 10, '', 0, '0.00', '', '', 0, '2022-09-26 14:47:13.969', NULL, '2022-09-26 14:47:13.969'),
(3, '4fa9c298-d191-4c59-bcba-e228107b3523', 4, 0, '2022-09-28', '2022-09-29', '1000.00', '1000.00', '999.99', 0, '', 0, '0.00', '', '', 0, '2022-09-28 07:16:56.509', NULL, '2022-09-28 07:16:56.509');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL,
  `experiance` int(11) NOT NULL,
  `info` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `abilities` varchar(255) NOT NULL,
  `dob` int(11) DEFAULT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `skypeId` varchar(255) NOT NULL,
  `employeeDetailsId` int(11) NOT NULL,
  `peopleEducationId` int(11) NOT NULL,
  `projectDetailsId` int(11) NOT NULL,
  `createdBy` int(11) UNSIGNED NOT NULL COMMENT 'Primary Key of "users" table',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedBy` int(11) UNSIGNED DEFAULT NULL COMMENT 'Primary Key of "users" table',
  `updatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores people data';

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `experiance`, `info`, `role`, `abilities`, `dob`, `bloodGroup`, `gender`, `language`, `email`, `skypeId`, `employeeDetailsId`, `peopleEducationId`, `projectDetailsId`, `createdBy`, `createdAt`, `updatedBy`, `updatedAt`) VALUES
(1, 'sahana', 4, 'the information', 'user', 'achieving', 29, 'A', 'female', 'english', 'sahana@gmail.com', 'sahana123', 1, 1, 1, 0, '2022-09-28 13:06:09.396', NULL, '2022-09-28 13:06:09.396'),
(11, 'srikanth', 4, 'the information', 'user', 'achieving', 29091999, 'A+', 'male', 'english', 'srikanth@gmail.com', 'srikanth123', 12, 12, 12, 0, '2022-09-30 08:46:03.387', NULL, '2022-09-30 08:46:03.387');

-- --------------------------------------------------------

--
-- Table structure for table `people_education`
--

CREATE TABLE `people_education` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `collegeName` varchar(255) NOT NULL,
  `collegeField` int(11) NOT NULL,
  `collegeYearFrom` int(11) NOT NULL,
  `collegeYearTo` int(11) NOT NULL,
  `collegeSummary` varchar(255) NOT NULL,
  `schoolName` varchar(255) NOT NULL,
  `schoolGrade` varchar(255) NOT NULL,
  `schoolYearFrom` int(11) NOT NULL,
  `schoolYearTo` int(11) NOT NULL,
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
(1, 'new', 0, 2020, 2022, 'good to work', 'rajeev', 'A', 2018, 2020, 'good to work', 0, '2022-09-28 04:34:22.091', NULL, '2022-09-28 04:34:22.091'),
(2, 'Horizan', 0, 2019, 2021, 'good to work', 'vasavi', 'A', 2019, 2021, 'good to work', 0, '2022-09-28 07:34:06.528', NULL, '2022-09-28 07:34:06.528'),
(3, 'Horizan', 0, 2019, 2021, 'good to work', 'vasavi', 'A', 2019, 2021, 'good to work', 0, '2022-09-28 07:34:39.188', NULL, '2022-09-28 07:34:39.188'),
(4, 'Horizan', 0, 2019, 2021, 'good to work', 'vasavi', 'A', 2019, 2021, 'good to work', 0, '2022-09-28 07:45:31.292', NULL, '2022-09-28 07:45:31.292'),
(5, 'new', 0, 2019, 2021, 'good to work', 'vasavi', 'A', 2019, 2021, 'good to work', 0, '2022-09-28 07:49:31.721', NULL, '2022-09-28 07:49:31.721'),
(6, 'new', 0, 2019, 2021, 'good to work', 'vasavi', 'A', 2019, 2021, 'good to work', 0, '2022-09-28 07:56:57.950', NULL, '2022-09-28 07:56:57.950'),
(8, 'new', 0, 2020, 2022, 'good to work', 'rajeev', 'A', 2018, 2020, 'good to work', 0, '2022-09-28 11:15:28.389', NULL, '2022-09-28 11:15:28.389'),
(12, 'IIT', 0, 2020, 2022, 'good to work', 'rajeev', 'A', 2018, 2020, 'good to work', 0, '2022-09-30 08:46:03.370', NULL, '2022-09-30 08:46:03.370');

-- --------------------------------------------------------

--
-- Table structure for table `project_details`
--

CREATE TABLE `project_details` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `projectDesignation` varchar(255) NOT NULL,
  `projectCompany` varchar(255) NOT NULL,
  `projectYearFrom` int(11) NOT NULL,
  `projectYearTo` int(11) NOT NULL,
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
(1, 'developer', 'oneux', 2015, 2020, 'Good', 0, '2022-09-28 04:34:22.080', NULL, '2022-09-28 04:34:22.080'),
(2, 'trainee', 'oneux', 2017, 2021, 'Good', 0, '2022-09-28 07:34:06.500', NULL, '2022-09-28 07:34:06.500'),
(3, 'trainee', 'oneux', 2017, 2021, 'Good', 0, '2022-09-28 07:34:39.180', NULL, '2022-09-28 07:34:39.180'),
(4, 'trainee', 'oneux', 2017, 2021, 'Good', 0, '2022-09-28 07:45:31.263', NULL, '2022-09-28 07:45:31.263'),
(5, 'assigned trainee', 'ripple', 2017, 2021, 'Good', 0, '2022-09-28 07:49:31.703', NULL, '2022-09-28 07:49:31.703'),
(6, 'assigned trainee', 'ripple', 2017, 2021, 'Good', 0, '2022-09-28 07:56:57.922', NULL, '2022-09-28 07:56:57.922'),
(8, 'developer', 'oneux', 2015, 2020, 'Good', 0, '2022-09-28 11:15:28.378', NULL, '2022-09-28 11:15:28.378'),
(12, 'Designer', 'oneux', 2015, 2020, 'Good', 0, '2022-09-30 08:46:03.362', NULL, '2022-09-30 08:46:03.362');

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
(1, 'vimal', 'veeramvr003@gmail.com', '$2a$08$B1rzohb32TECeqGLLGXtfu9crkpBX3ftYuV9JSxlxJiMkRUwkNJx2', 'admin', 'Active', 1, 0, '2022-09-23 06:22:34.834', NULL, '2022-09-23 06:22:34.834'),
(3, 'Gokul', 'gokulrajthangavel1998@gmail.com', '$2a$08$Y0gOKZhMA49v0db9UfZdPOuALBcQ55DKFYf1/bCVIjlJf9eilYZyS', 'user', 'Active', 0, 0, '2022-09-23 05:38:29.786', NULL, '2022-09-23 05:38:29.786'),
(4, 'Abi', 'abishekk98@gmail.com', '$2a$08$6Bc2U5pB60XBYKRBX0/vOud7SYaZc.reNMG2nkWbQhaUwSfRQ49aG', 'superAdmin', 'Active', 0, 0, '2022-09-23 05:39:01.854', NULL, '2022-09-23 05:39:01.854'),
(5, 'Madan', 'vimalvr003@gmail.com', '$2a$08$NzVeNNjUGZvS/dx1cjb9tudjJeZODCvNHnRSjKSU88R5Yi0aYmz3O', 'superAdmin', 'Active', 0, 0, '2022-09-26 05:10:24.451', NULL, '2022-09-26 05:10:24.451');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
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
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `people_education`
--
ALTER TABLE `people_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project_details`
--
ALTER TABLE `project_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
