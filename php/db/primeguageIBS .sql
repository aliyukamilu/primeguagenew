-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 23, 2023 at 04:03 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primeguageIBS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrative_users`
--

CREATE TABLE `Administrative_users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dashboard_access` enum('view','full') NOT NULL,
  `analytics_access` enum('view','full') NOT NULL,
  `mda_access` enum('view','full') NOT NULL,
  `reports_access` enum('view','full') NOT NULL,
  `tax_payer_access` enum('view','full') NOT NULL,
  `users_access` enum('view','full') NOT NULL,
  `cms_access` enum('view','full') NOT NULL,
  `support` enum('view','full') NOT NULL,
  `img` longtext NOT NULL,
  `verification_status` longtext NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Administrative_users`
--

INSERT INTO `Administrative_users` (`id`, `fullname`, `email`, `phone`, `password`, `dashboard_access`, `analytics_access`, `mda_access`, `reports_access`, `tax_payer_access`, `users_access`, `cms_access`, `support`, `img`, `verification_status`, `time_in`) VALUES
(1, 'Primeguage', 'sule1@gmail.com', '123456789', '12345', 'full', 'full', 'full', 'full', 'full', 'full', 'full', 'full', 'lllll', 'gyhjkfdsndwineenkjad', '2023-02-02 07:30:44'),
(2, 'AbuBakar', 'sule1@gmail.com', '090275654', '12345', 'view', 'view', 'view', 'view', 'view', 'view', 'view', 'view', 'jhjhj.jpg', '12345678uy?trewqas#$dvcx23@!2', '2023-02-02 11:53:27');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `body` varchar(400) NOT NULL,
  `description` varchar(400) NOT NULL,
  `description_2` varchar(400) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `image`, `body`, `description`, `description_2`, `created_at`) VALUES
(1, 'string', 'Pay your tax today!', 'Let s build Akwaibom together ', ' ALL payment IN Akwaibom has been made easy, convenient, AND secure way TO pay ALL taxes OR bills owed TO the Akwaibom state government.', '2023-02-23 13:28:20'),
(2, 'string.jpg', 'Are you an individual or corporate body in Akwaibom,', 'Tax payments and all remittances to the Akwaibom government has been made easy…', '', '2023-02-23 13:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(350) NOT NULL,
  `email` varchar(300) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'string', 'Are you an individual or corporate body in Akwaibom,', 'Tax payments and all remittances to the Akwaibom government has been made easy…', '2023-02-23 14:01:24'),
(2, 'Sam Adeniyi', 'individual or corporate body in Akwaibom,', 'remittances to the Akwaibom government has been made easy…', '2023-02-23 14:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `payer_id` varchar(100) NOT NULL,
  `revenue_head` int(255) NOT NULL,
  `invoice_number` varchar(15) NOT NULL,
  `due_date` date NOT NULL,
  `payment_status` enum('paid','unpaid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `payer_id`, `revenue_head`, `invoice_number`, `due_date`, `payment_status`) VALUES
(547, '2', 7, '63d104f490253', '2023-01-25', 'unpaid'),
(548, '2', 9, '63d104f490253', '2023-02-25', 'unpaid'),
(549, '2', 10, '63d104f490253', '2023-02-25', 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `mda`
--

CREATE TABLE `mda` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `industry` varchar(500) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `geolocation` varchar(50) DEFAULT NULL,
  `lga` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `status` enum('active','deactivated') NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mda`
--

INSERT INTO `mda` (`id`, `fullname`, `email`, `phone`, `industry`, `state`, `geolocation`, `lga`, `address`, `status`, `time_in`) VALUES
(1, 'Sule MDA', 'sule@gmail.com', '2345667789', 'Commerce', 'Akwa Ibom', 'South', 'KKK', 'KKK', 'deactivated', '2023-01-09 18:31:08'),
(3, 'Sule MDA', 'sule22@gmail.com', '2345667789', 'Commerce', 'Akwa Ibom', 'South', 'KKK', 'KKK', 'deactivated', '2023-01-10 14:03:48'),
(4, 'AKIRS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(5, 'AGENCY FOR ADULT AND NON FORMAL EDUCATION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(6, 'AGRICULTURAL LOANS BOARD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(7, 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(8, 'AKWA IBOM HOTELS AND TOURISM BOARD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(9, 'AKWA IBOM STATE BUDGET OFFICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(10, 'AKWA IBOM STATE JUDICIARY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(11, 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(12, 'BUREAU OF TECHNICAL MATTERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(13, 'DEPARTMENT OF ESTABLISHMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(14, 'GENERAL SERVICE OFFICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(15, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(16, 'JUDIClAL SERVICE COMMISSION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(17, 'LAND USE ALLOCATION COMMITTEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(18, 'LAW REFORM COMMISSION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(19, 'LOCAL GOVT. SERVICE COMMISSION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(20, 'OFFICE OF THE A/C GENERAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(21, 'MINISTRY OF AGRICULTURE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(22, 'MINISTRY OF CULTURE AND TOURISM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(23, 'MINISTRY OF EDUCATION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(24, 'MINISTRY OF ENVIRONMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(25, 'MINISTRY OF FINANCE HQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(26, 'MINISTRY OF HEALTH HQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(27, 'MINISTRY OF HOUSING AND SPECIAL DUTIES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(28, 'MINISTRY OF INFORMATION AND COMMUNICATIONS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(29, 'MINISTRY OF JUSTICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(30, 'MIN. OF LANDS AND TOWN PLANNING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(31, 'MINISTRY OF LOCAL GOVERNMENT AND CHIEFTANCY AFFAIRS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(32, 'MINISTRY OF RURAL DEVELOPMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(33, 'MINISTRY OF SCIENCE AND TECHNOLOGY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(34, 'AKWA IBOM URBAN TAXI NETWORK LIMITED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(35, 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(36, 'MINISTRY OF WOMEN AFFAIRS AND SOCIAL DEVELOPMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(37, 'MINISTRY OF WORKS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(38, 'MINISTRY OF YOUTH AND SPORTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(39, 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(40, 'OFFICE OF THE AUDITOR GENERAL(STATE)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(41, 'OFFICE OF THE HEAD OF CIVIL SERVICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(42, 'OFFICE OF THE SECRETARY TO THE STATE GOVERNMENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(43, 'SURVEYOR GENERAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(44, 'POLITICAL AND LEGISLATIVE AFFAIRS BUREAU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(45, 'HOSPITAL MANAGEMENT BOARD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(46, 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(47, 'AKS CIVIL SERVICE COMMISSION', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(48, 'FINANCE AND GEN. PURPOSE COMMITTEE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(49, 'AKWA IBOM STATE FIRE SERVICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(50, 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05'),
(51, 'AKS COUNCIL FOR ARTS AND CULTURE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-01-18 07:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `mda_users`
--

CREATE TABLE `mda_users` (
  `id` int(11) NOT NULL,
  `mda_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(300) NOT NULL,
  `passwd` varchar(200) NOT NULL,
  `dashboard_access` enum('view','full') NOT NULL,
  `revenue_head_access` enum('view','full') NOT NULL,
  `payment_access` enum('view','full') NOT NULL,
  `users_access` enum('view','full') NOT NULL,
  `report_access` enum('view','full') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mda_users`
--

INSERT INTO `mda_users` (`id`, `mda_id`, `name`, `email`, `phone_number`, `passwd`, `dashboard_access`, `revenue_head_access`, `payment_access`, `users_access`, `report_access`, `created_at`) VALUES
(1, 6, 'paul', 'paul@gmail.com', '09067656744', '12345', 'full', 'full', 'full', 'full', 'full', '2023-02-02 12:35:12'),
(2, 5, 'Job Kolo', 'Job@gmail.com', '090654653444', '12345', 'full', 'full', 'full', 'full', 'full', '2023-02-02 12:36:17'),
(3, 6, 'Lawal', 'lawal@gmail.com', '0908787656', '12345', 'view', 'view', 'view', 'full', 'full', '2023-02-02 12:37:28'),
(4, 5, 'Bola Kolo', 'bola@gmail.com', '090654653444', '12345', 'full', 'full', 'full', 'full', 'full', '2023-02-02 16:40:58'),
(5, 5, 'Bola Kolo', 'ere@gmail.com', '090654653444', '12345', 'full', 'full', 'full', 'full', 'full', '2023-02-02 17:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `our_services`
--

CREATE TABLE `our_services` (
  `id` int(11) NOT NULL,
  `self_service` text NOT NULL,
  `pay_tax_and_services` text NOT NULL,
  `multiple_payment_channels` text NOT NULL,
  `payment_transaction_recods` text NOT NULL,
  `learn_more` text NOT NULL,
  `track_transaction` text NOT NULL,
  `safe_and_secure` text NOT NULL,
  `supports_24_7` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_services`
--

INSERT INTO `our_services` (`id`, `self_service`, `pay_tax_and_services`, `multiple_payment_channels`, `payment_transaction_recods`, `learn_more`, `track_transaction`, `safe_and_secure`, `supports_24_7`, `created_at`) VALUES
(1, 'Sign in which id update or register to pay bills or taxes as an Individual, corporate, state agency or federal agency.', 'You can pay for taxes, services or bills such as PAYE, Land use charge Vehicle registration, Withholding tax, Business premises, Capital gain tax, Waste management, etc.', 'Enjoy a faster and easier way to pay taxes or bills. Payments can be made against an invoice at any bank branch or online payments with debits cards (POS, Verve, Visa, or MasterCard', 'View your tax information and payment history over a period of time.', 'We are here to help you understand how to pay your bills or taxes with ease.', 'Easy access to your payment history and receipt. View, share and download your receipts with ease.', 'Payments are routed through the most secured channels, ensuring safe and secure transactions.', 'We are always available to assist and ensure that your tax payment and all payments to the government is seamless.', '2023-02-23 14:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `payer_user`
--

CREATE TABLE `payer_user` (
  `id` int(11) NOT NULL,
  `tax_number` varchar(50) NOT NULL,
  `category` enum('Corporate','Individual','State Agency','Federal Agency') NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `state` varchar(50) NOT NULL,
  `lga` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verification_status` varchar(500) NOT NULL,
  `tin_status` enum('Unverified','Verified') NOT NULL,
  `timeIn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payer_user`
--

INSERT INTO `payer_user` (`id`, `tax_number`, `category`, `first_name`, `surname`, `email`, `phone`, `state`, `lga`, `address`, `password`, `verification_status`, `tin_status`, `timeIn`) VALUES
(1, 'SDSD-SS', 'Individual', 'Abu', 'Abu', 'abu@gmail.com', '234234554465', 'Kano', '1673457750170', 'ddd', '453ewds', 'M3ZHWWV0NGgxVkdMRWV1NkY2b0JqZkM0Uml0dm95K1BTZzc2SUx4c2ZPZz0=', 'Unverified', '2023-01-24 11:10:56'),
(2, 'SDSD-SS-1', 'Individual', 'Abu', 'Abu', 'abu1234@gmail.com', '234234554465', 'Kano', '1673457750170', 'ddd', '453ewds', 'M3ZHWWV0NGgxVkdMRWV1NkY2b0JqZkM0Uml0dm95K1BTZzc2SUx4c2ZPZz0=1', 'Unverified', '2023-01-24 11:10:56'),
(3, '16753196822015', 'Corporate', 'Abu', 'Abu', 'abud@gmail.com', '234234554465', 'Kano', 'ss', 'ddd', '453ewds', 'S3hMSUtGVlBVT1Rud1k5MnJiZmx2VDRxZUZCeEUyeU14QkZMTnNVK3pCND0=', 'Unverified', '2023-02-02 06:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_2`
--

CREATE TABLE `payment_2` (
  `id` int(11) NOT NULL,
  `0` varchar(100) DEFAULT NULL,
  `1` int(255) DEFAULT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_collection_report_individual`
--

CREATE TABLE `payment_collection_report_individual` (
  `id` int(11) NOT NULL,
  `mda_id` varchar(255) NOT NULL,
  `revenue_head` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `payment_channel` enum('Remita','PayStack','FlutterWave','InterSwitch') NOT NULL,
  `payment_reference_number` varchar(50) NOT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `timeIn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_collection_report_individual`
--

INSERT INTO `payment_collection_report_individual` (`id`, `mda_id`, `revenue_head`, `user_id`, `invoice_number`, `payment_channel`, `payment_reference_number`, `receipt_number`, `timeIn`) VALUES
(4, 'AKIRS', 7, 1, '63cfc403aa282', 'PayStack', 'XDRR5WE-XX', 'XDRR5WE-ZX', '2023-01-24 13:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `payment_form_labels`
--

CREATE TABLE `payment_form_labels` (
  `id` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `mda_id` int(255) NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_form_labels`
--

INSERT INTO `payment_form_labels` (`id`, `table_name`, `content`, `mda_id`, `time_in`) VALUES
(25, 'payment_2', 'customer name^text,amount^number', 2, '2023-01-09 18:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `pending_payment_list`
--

CREATE TABLE `pending_payment_list` (
  `id` int(11) NOT NULL,
  `date_of_payment` varchar(200) NOT NULL,
  `payer_id` varchar(200) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mda_id` bigint(20) NOT NULL,
  `revenue_id` varchar(200) NOT NULL,
  `payment_amount` varchar(300) NOT NULL,
  `other_info` text NOT NULL,
  `payment_status` enum('unpaid','invoiced','paid') NOT NULL,
  `invoice_number` varchar(200) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pending_payment_list`
--

INSERT INTO `pending_payment_list` (`id`, `date_of_payment`, `payer_id`, `user_id`, `mda_id`, `revenue_id`, `payment_amount`, `other_info`, `payment_status`, `invoice_number`, `status`, `created_at`) VALUES
(1, '2023-01-17', '1', 1, 0, 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', '200', 'Mon, Tues, Wed', 'invoiced', NULL, 'inactive', '2023-02-02 16:25:11'),
(2, '2023-01-17', '1', 1, 0, 'AKIRS', '240', 'Mon, Tues, Wed', 'invoiced', NULL, 'inactive', '2023-02-02 16:26:13'),
(3, '2023-01-17', '2', 2, 0, 'AKIRS', '240', 'Mon, Tues, Wed', 'unpaid', NULL, 'inactive', '2023-02-02 16:56:14'),
(4, '2023-01-12', '1', 1, 0, 'AKIRS', '140', 'Mon, Tues, Wed, Wed', 'invoiced', NULL, 'inactive', '2023-02-02 17:26:27'),
(5, '2023-01-12', '1', 2, 5, 'AKIRS', '140', 'Mon, Tues, Wed', 'invoiced', NULL, 'inactive', '2023-02-02 17:32:12'),
(6, '2023-01-12', '1', 2, 5, 'AKIRS', '140', 'Mon, Tues, Wed', 'unpaid', NULL, 'inactive', '2023-02-02 17:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `revenue_heads`
--

CREATE TABLE `revenue_heads` (
  `id` int(11) NOT NULL,
  `COL_1` varchar(12) DEFAULT NULL,
  `COL_2` varchar(13) DEFAULT NULL,
  `COL_3` varchar(51) DEFAULT NULL,
  `COL_4` varchar(67) DEFAULT NULL,
  `COL_5` varchar(14) DEFAULT NULL,
  `COL_6` varchar(6) DEFAULT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revenue_heads`
--

INSERT INTO `revenue_heads` (`id`, `COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6`, `time_in`) VALUES
(2, '124456G', '12010104', 'AKIRS', 'Witholding Tax (General)', 'State Agency', '1100', '2023-01-23 08:22:55'),
(3, '', '12010105', 'AKIRS', 'Pay As You Earn (PAYE)', 'State Agency', '1000', '2023-01-18 07:41:29'),
(4, '', '12010106', 'AKIRS', 'Direct Assesment', 'State Agency', '2300', '2023-01-18 07:41:29'),
(5, '', '12010107', 'AKIRS', 'Stamp Duties', 'State Agency', '1000', '2023-01-18 07:41:29'),
(6, '', '12010117', 'AKIRS', 'Informal Sector Taxes', 'State Agency', '1200', '2023-01-18 07:41:29'),
(7, '', '12010108', 'AKIRS', 'Pools Betting Tax - Agents', 'Individual', '1150', '2023-01-18 07:41:29'),
(8, '', '12010109', 'AKIRS', 'Tax Arrears', 'State Agency', '4500', '2023-01-18 07:41:29'),
(9, '', '12020122', 'AKIRS', 'Pools Betting License: Issues', 'Individual', '2550', '2023-01-18 07:41:29'),
(10, '', '12020123', 'AKIRS', 'Pools Betting License: Renewals', 'Individual', '3555', '2023-01-18 07:41:29'),
(11, '', '12020124', 'AKIRS', 'Motor Vehicle License: Renewals', 'Federal Agency', '2310', '2023-01-18 07:41:29'),
(12, '', '12020458', 'AKIRS', 'Motor Vehicle License: Issues', 'Federal Agency', '1240', '2023-01-18 07:41:29'),
(13, '', '12020125', 'AKIRS', 'Drivers License - Renewals', 'Federal Agency', '5000', '2023-01-18 07:41:29'),
(14, '', '12020127', 'AKIRS', 'Drivers License - Issues', 'Federal Agency', '1010', '2023-01-18 07:41:29'),
(15, '', '12020465', 'AKIRS', 'Road Worthiness', 'Federal Agency', '4556', '2023-01-18 07:41:29'),
(16, '', '12020129', 'AKIRS', 'Dealers License', 'State Agency', '1234', '2023-01-18 07:41:29'),
(17, '', '12020445', 'AKIRS', 'Change of Engine', 'State Agency', '3200', '2023-01-18 07:41:29'),
(18, '', '12020445', 'AKIRS', 'Change of Ownership', 'State Agency', '1455', '2023-01-18 07:41:29'),
(19, '', '12020445', 'AKIRS', 'Proof of Ownership of Vehicle', 'State Agency', '1869', '2023-01-18 07:41:29'),
(20, '', '12020455', 'AKIRS', 'Replacement of Security Document', 'Federal Agency', '6547', '2023-01-18 07:41:29'),
(21, '', '12020455', 'AKIRS', 'Loss of Tax Reciept', 'State Agency', '8643', '2023-01-18 07:41:29'),
(22, '', '12020458', 'AKIRS', 'Registartion of Motor Vehicles Issues/Renewal', 'Federal Agency', '5673', '2023-01-18 07:41:29'),
(23, '', '12020478', 'AKIRS', 'Learners Permit', 'Federal Agency', '9876', '2023-01-18 07:41:29'),
(24, '', '12020448', 'AKIRS', 'Administrative Charges', 'State Agency', '5678', '2023-01-18 07:41:29'),
(25, '', '12020448', 'AKIRS', 'Economic Development Levy', 'State Agency', '1450', '2023-01-18 07:41:29'),
(26, '', '12020465', 'AKIRS', 'Extraction of Information', 'State Agency', '3301', '2023-01-18 07:41:29'),
(27, '', '12020465', 'AKIRS', 'Sealing of Document', 'State Agency', '3452', '2023-01-18 07:41:29'),
(28, '', '12020468', 'AKIRS', 'Disclosure Fees', 'State Agency', '4345', '2023-01-18 07:41:29'),
(29, '', '12010604', 'AKIRS', 'Sales of Condemn Stores', 'State Agency', '2000', '2023-01-18 07:41:29'),
(30, '', '12010485', 'AKIRS', 'Hackney Permit', 'State Agency', '2344', '2023-01-18 07:41:29'),
(31, '', '12010126', 'AKIRS', 'Gaming Machine license', 'State Agency', '5673', '2023-01-18 07:41:29'),
(32, '', '12010616', 'AKIRS', 'Sales of Unservicable Vehicle', 'State Agency', '4567', '2023-01-18 07:41:29'),
(33, '', '12010621', 'AKIRS', 'Sales of Unservicable Items', 'State Agency', '7656', '2023-01-18 07:41:29'),
(34, '', '12010632', 'AKIRS', 'Sales of Badges and Plate Numbers', 'State Agency', '6356', '2023-01-18 07:41:29'),
(35, '051706600100', '12020457', 'AGENCY FOR ADULT AND NON FORMAL EDUCATION', 'Reg. of Evening Continunig Education', 'Individual', '9564', '2023-01-18 07:41:29'),
(36, '', '12020457', 'AGENCY FOR ADULT AND NON FORMAL EDUCATION', 'Renewl Fee of Evening Continunig Education', 'Individual', '1342', '2023-01-18 07:41:29'),
(37, '', '12020448', 'AGENCY FOR ADULT AND NON FORMAL EDUCATION', 'Dev. Fee for Adult Edu. Training Centers', 'Individual', '2333', '2023-01-18 07:41:29'),
(38, '', '12020638', 'AGENCY FOR ADULT AND NON FORMAL EDUCATION', 'Sales of Forms for Opening of Cont. Edu. Centers', 'Individual', '3450', '2023-01-18 07:41:29'),
(39, '021511200100', '12021201', 'AGRICULTURAL LOANS BOARD', 'Charges on Loans Project Appraisal', 'State Agency', '3563', '2023-01-18 07:41:29'),
(40, '', '12021211', 'AGRICULTURAL LOANS BOARD', 'Recovery From Agric Loans Board', 'State Agency', '3123', '2023-01-18 07:41:29'),
(41, '01110190020', '12020713', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Electricity Surcharge', 'State Agency', '1000', '2023-01-18 07:41:29'),
(42, '', '12020458', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Taxi Registration', 'State Agency', '1001', '2023-01-18 07:41:29'),
(43, '', '12020462', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Landing Charges', 'State Agency', '1002', '2023-01-18 07:41:29'),
(44, '', '12020454', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Parking Charges', 'State Agency', '1003', '2023-01-18 07:41:29'),
(45, '', '12020454', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Overnight Parking', 'State Agency', '1004', '2023-01-18 07:41:29'),
(46, '', '12020463', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Excursion', 'State Agency', '1005', '2023-01-18 07:41:29'),
(47, '', '12020454', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Access Gate Charges', 'State Agency', '1006', '2023-01-18 07:41:29'),
(48, '', '12020462', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Apron Pass', 'State Agency', '1007', '2023-01-18 07:41:29'),
(49, '', '12020436', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Indoor Advert (Banner)', 'State Agency', '1008', '2023-01-18 07:41:29'),
(50, '', '12020473', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'On Duty Card', 'State Agency', '1009', '2023-01-18 07:41:29'),
(51, '', '12020462', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Passenger Service Charges', 'State Agency', '1010', '2023-01-18 07:41:29'),
(52, '', '12020805', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Desk Space', 'State Agency', '1011', '2023-01-18 07:41:29'),
(53, '', '12020484', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Trolley Service', 'State Agency', '1450', '2023-01-18 07:41:29'),
(54, '', '12020810', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Rent on Government Room', 'State Agency', '1451', '2023-01-18 07:41:29'),
(55, '', '12020620', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Fuel', 'State Agency', '1452', '2023-01-18 07:41:29'),
(56, '', '12020465', 'AKWA IBOM AIRPORT DEVELOPMENT COMPANY LIMITED', 'Service Recovery Charge', 'State Agency', '1453', '2023-01-18 07:41:29'),
(57, '011101900200', '12020449', 'AKWA IBOM HOTELS AND TOURISM BOARD', 'Franchise to Beauty Pageants', 'Corporate', '1455', '2023-01-18 07:41:29'),
(58, '', '12020449', 'AKWA IBOM HOTELS AND TOURISM BOARD', 'Grading Fees for Hospitality Establishment', 'State Agency', '1456', '2023-01-18 07:41:29'),
(59, '', '12020449', 'AKWA IBOM HOTELS AND TOURISM BOARD', 'Promotion Endorsement Fees for Tourism Enterprise', 'State Agency', '1457', '2023-01-18 07:41:29'),
(60, '', '12020457', 'AKWA IBOM HOTELS AND TOURISM BOARD', 'Reg. Fees for Hospitality Establishment', 'State Agency', '1458', '2023-01-18 07:41:29'),
(61, '', '12020623', 'AKWA IBOM HOTELS AND TOURISM BOARD', 'Sales of Registration Forms for Listing of Hotels', 'State Agency', '1560', '2023-01-18 07:41:29'),
(62, '02200030010', '12020616', 'AKWA IBOM STATE BUDGET OFFICE', 'Sales of Unserviceable Item', 'State Agency', '3450', '2023-01-18 07:41:29'),
(63, '', '12020631', 'AKWA IBOM STATE BUDGET OFFICE', 'Sales of Estimates Booklet', 'State Agency', '9800', '2023-01-18 07:41:29'),
(64, '', '12020455', 'AKWA IBOM STATE BUDGET OFFICE', 'Search Fees for the Lost of Service Document', 'State Agency', '4070', '2023-01-18 07:41:29'),
(65, '', '12020474', 'AKWA IBOM STATE BUDGET OFFICE', 'Margin for Revenue', 'State Agency', '6780', '2023-01-18 07:41:29'),
(66, '03180010010', '12020401', 'AKWA IBOM STATE JUDICIARY', 'Tribunal Fees', 'State Agency', '4550', '2023-01-18 07:41:29'),
(67, '', '12020703', 'AKWA IBOM STATE JUDICIARY', 'Fuel Dump', 'State Agency', '1111', '2023-01-18 07:41:29'),
(68, '', '12020705', 'AKWA IBOM STATE JUDICIARY', 'Hiring of Multi-Purpose Hall', 'Individual', '2342', '2023-01-18 07:41:29'),
(69, '', '12020401 - a', 'AKWA IBOM STATE JUDICIARY', 'Court Fees-a', 'State Agency', '2343', '2023-01-18 07:41:29'),
(70, '', '12020401 -b', 'AKWA IBOM STATE JUDICIARY', 'Customary Court Fees', 'State Agency', '2344', '2023-01-18 07:41:29'),
(71, '', '12020427', 'AKWA IBOM STATE JUDICIARY', 'Tenders Fees', 'Corporate', '2345', '2023-01-18 07:41:29'),
(72, '', '12020401', 'AKWA IBOM STATE JUDICIARY', 'Probate Fees', 'State Agency', '2346', '2023-01-18 07:41:29'),
(73, '', '12020502', 'AKWA IBOM STATE JUDICIARY', 'Court Fines', 'State Agency', '2347', '2023-01-18 07:41:29'),
(74, '', '12020502', 'AKWA IBOM STATE JUDICIARY', 'Customary Court Fines', 'State Agency', '6758', '2023-01-18 07:41:29'),
(75, '', '12020511', 'AKWA IBOM STATE JUDICIARY', 'Tribunal Fines', 'State Agency', '3582', '2023-01-18 07:41:29'),
(76, '', '12020604', 'AKWA IBOM STATE JUDICIARY', 'Reg. and Renewal of Contractor', 'State Agency', '9475', '2023-01-18 07:41:29'),
(77, '', '12020634', 'AKWA IBOM STATE JUDICIARY', 'Sales of Unserviceable Vehicles', 'State Agency', '8568', '2023-01-18 07:41:29'),
(78, '', '12020634', 'AKWA IBOM STATE JUDICIARY', 'Sales of Confiscated Goods', 'State Agency', '9274', '2023-01-18 07:41:29'),
(79, '01111880010', '12020448', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Search Fees for the Lost of Service Document', 'State Agency', '3857', '2023-01-18 07:41:29'),
(80, '', '12020433', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Co-operative Societies Registration Fees', 'State Agency', '3947', '2023-01-18 07:41:29'),
(81, '', '12020440', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Co-operative Audit and Supervision Fees', 'State Agency', '3658', '2023-01-18 07:41:29'),
(82, '', '12020455', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Replacement of lost Co-operative Certificate', 'State Agency', '2394', '2023-01-18 07:41:29'),
(83, '', '12020442', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Amendment of Co-operative Societies Bye-Law Fees', 'State Agency', '1993', '2023-01-18 07:41:29'),
(84, '', '12020456', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Registration projects', 'State Agency', '9287', '2023-01-18 07:41:29'),
(85, '', '12020442', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Co-operative Societies Renewal', 'State Agency', '3534', '2023-01-18 07:41:29'),
(86, '', '12020456', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Registration of Development Association', 'State Agency', '2453', '2023-01-18 07:41:29'),
(87, '', '12020616', 'BUREAU OF COOPERATIVE DEV. AND FOOD SUFFICIENCY', 'Sales of Unservicable Items', 'State Agency', '2563', '2023-01-18 07:41:29'),
(88, '011121000100', '12020441', 'BUREAU OF TECHNICAL MATTERS', 'Laboratoy Fees', 'State Agency', '4345', '2023-01-18 07:41:29'),
(89, '011121000100', '12020452', 'DEPARTMENT OF ESTABLISHMENT', 'Tuition Fees (CSTC)', 'Individual', '2443', '2023-01-18 07:41:29'),
(90, '', '12020456', 'DEPARTMENT OF ESTABLISHMENT', 'Registration Fees (CSTC)', 'Individual', '6832', '2023-01-18 07:41:29'),
(91, '', '12020452', 'DEPARTMENT OF ESTABLISHMENT', 'Fees for Compulsory Exams for Executive Cadre', 'Corporate', '3368', '2023-01-18 07:41:29'),
(92, '', '12020452', 'DEPARTMENT OF ESTABLISHMENT', 'Fees for Compulsory Exams for Administrative/Professional Officer', 'Corporate', '2592', '2023-01-18 07:41:29'),
(93, '', '12020452', 'DEPARTMENT OF ESTABLISHMENT', 'Fees for Confirmation/Promotion Exams for Clerical and Allied Staff', 'Corporate', '2389', '2023-01-18 07:41:29'),
(94, '', '12020508', 'DEPARTMENT OF ESTABLISHMENT', 'Late Collection of Statement of resulT certificate', 'Individual', '4826', '2023-01-18 07:41:29'),
(95, '', '12020506', 'DEPARTMENT OF ESTABLISHMENT', 'Fines of Lost of Establisshmeni Record', 'State Agency', '3894', '2023-01-18 07:41:29'),
(96, '', '12020455', 'DEPARTMENT OF ESTABLISHMENT', 'Fees for Collection of Certificate executive Class', 'Individual', '2848', '2023-01-18 07:41:29'),
(97, '', '12020455', 'DEPARTMENT OF ESTABLISHMENT', 'Fees for Collection of Certificate special Class', 'Individual', '3984', '2023-01-18 07:41:29'),
(98, '', '12020455', 'DEPARTMENT OF ESTABLISHMENT', 'Change of Name/Next of Kin', 'Individual', '9583', '2023-01-18 07:41:29'),
(99, '01119000100', '12020705', 'GENERAL SERVICE OFFICE', 'Hiring of Multi -Purpose Hall', 'Individual', '3589', '2023-01-18 07:41:29'),
(100, '', '12020460', 'GENERAL SERVICE OFFICE', 'Certficate of Origin - Public Service office', 'Individual', '8473', '2023-01-18 07:41:29'),
(101, '', '12020459', 'GENERAL SERVICE OFFICE', 'Clinic Fees from Staff Clinic. Wellington Bassey Way', 'Individual', '2748', '2023-01-18 07:41:29'),
(102, '', '12020801', 'GENERAL SERVICE OFFICE', 'Rent from Senior Staff Quaters', 'Corporate', '5732', '2023-01-18 07:41:29'),
(103, '', '12020806', 'GENERAL SERVICE OFFICE', 'Rent on Government Shops', 'State Agency', '6453', '2023-01-18 07:41:29'),
(104, '', '12020616', 'GENERAL SERVICE OFFICE', 'Sales of unserviceable item', 'Individual', '2847', '2023-01-18 07:41:29'),
(105, '', '', '', 'Earnings from Govt. Guest house', 'State Agency', '3757', '2023-01-18 07:41:29'),
(106, '', '', '', 'GSO', 'State Agency', '9849', '2023-01-18 07:41:29'),
(107, '03180110010', '12020510', 'JUDIClAL SERVICE COMMISSION', 'Tenders Fees coIlected from Contractors', 'State Agency', '3748', '2023-01-18 07:41:29'),
(108, '', '12020616', 'JUDIClAL SERVICE COMMISSION', 'Sales of Unservicable Item', 'Individual', '5736', '2023-01-18 07:41:29'),
(109, '', '12020651', 'JUDIClAL SERVICE COMMISSION', 'Sales of Customary Court Forms', 'Corporate', '8463', '2023-01-18 07:41:29'),
(110, '02600030010', '12020453', 'LAND USE ALLOCATION COMMITTEE', 'Application Fees for Government Plot (Residential)', 'Individual', '7352', '2023-01-18 07:41:29'),
(111, '', '12020453', 'LAND USE ALLOCATION COMMITTEE', 'Application Fees for Government Plot (Industrial)', 'Corporate', '2747', '2023-01-18 07:41:29'),
(112, '', '12020447', 'LAND USE ALLOCATION COMMITTEE', 'Site Inspection Fees', 'Corporate', '1283', '2023-01-18 07:41:29'),
(113, '', '12020453', 'LAND USE ALLOCATION COMMITTEE', 'Application Fees for Letter of Consent', 'Individual', '1234', '2023-01-18 07:41:29'),
(114, '', '12020460', 'LAND USE ALLOCATION COMMITTEE', 'Non-Refundable Application Fees for Certificate of Occupancy', 'State Agency', '3729', '2023-01-18 07:41:29'),
(115, '', '12020453', 'LAND USE ALLOCATION COMMITTEE', 'Renewal of Lettet of Consent Fees', 'Individual', '2947', '2023-01-18 07:41:29'),
(116, '', '12020447', 'LAND USE ALLOCATION COMMITTEE', 'Change of Data Fees', 'Individual', '8374', '2023-01-18 07:41:29'),
(117, '', '12020445', 'LAND USE ALLOCATION COMMITTEE', 'Change of Purpose Fees', 'Individual', '2849', '2023-01-18 07:41:29'),
(118, '', '12020616', 'LAND USE ALLOCATION COMMITTEE', 'Sales of Unserviceable Vehicles', 'Individual', '2749', '2023-01-18 07:41:29'),
(119, '', '', 'LAND USE ALLOCATION COMMITTEE', 'Land Use Dev. Clearance Certificate', 'Individual', '2344', '2023-01-18 07:41:29'),
(120, '032600200100', '12020601', 'LAW REFORM COMMISSION', 'Sales of AKS Laws ( Customary Law Mannual)', 'State Agency', '3874', '2023-01-18 07:41:29'),
(121, '', '12020601', 'LAW REFORM COMMISSION', 'Sales of Law Reform Commission Annual Report', 'State Agency', '2848', '2023-01-18 07:41:29'),
(122, '05510040010', '12020705', 'LOCAL GOVT. SERVICE COMMISSION', 'Hiring of Commission Hall', 'Individual', '9293', '2023-01-18 07:41:29'),
(123, '', '', 'LOCAL GOVT. SERVICE COMMISSION', 'Withholding Tax (State)', 'State Agency', '2343', '2023-01-18 07:41:29'),
(124, '', '', 'LOCAL GOVT. SERVICE COMMISSION', 'PAYE', 'State Agency', '2384', '2023-01-18 07:41:29'),
(125, '055100400100', '11010401', 'OFFICE OF THE A/C GENERAL', 'Derivation Revenue', 'Federal Agency', '2747', '2023-01-18 07:41:29'),
(126, '', '11010104', 'OFFICE OF THE A/C GENERAL', 'Budget support', 'Federal Agency', '2094', '2023-01-18 07:41:29'),
(127, '', '11010201', 'OFFICE OF THE A/C GENERAL', 'Federal Govt Share of VAT', 'Federal Agency', '1536', '2023-01-18 07:41:29'),
(128, '', '11010300', 'OFFICE OF THE A/C GENERAL', 'Federal Govt Faac', 'Federal Agency', '3876', '2023-01-18 07:41:29'),
(129, '', '12020731', 'OFFICE OF THE A/C GENERAL', 'Interest on Motor Vehicles loan', 'Federal Agency', '3362', '2023-01-18 07:41:29'),
(130, '', '12020732', 'OFFICE OF THE A/C GENERAL', 'Interest on Fixed Deposit', 'Federal Agency', '3672', '2023-01-18 07:41:29'),
(131, '', '12020455', 'OFFICE OF THE A/C GENERAL', 'Replacement of lost pension I.D card', 'Individual', '7264', '2023-01-18 07:41:29'),
(132, '', '12020601', 'OFFICE OF THE A/C GENERAL', 'Sale of Revised Edition ol Finance Reg.', 'State Agency', '2743', '2023-01-18 07:41:29'),
(133, '', '12020616', 'OFFICE OF THE A/C GENERAL', 'Sale of unserviceable', 'Individual', '2874', '2023-01-18 07:41:29'),
(134, '', '12020733', 'OFFICE OF THE A/C GENERAL', 'Hiring of ICT Centre', 'Individual', '2747', '2023-01-18 07:41:29'),
(135, '', '12010104', 'OFFICE OF THE A/C GENERAL', 'Withholding Tax (State)', 'State Agency', '2839', '2023-01-18 07:41:29'),
(136, '021500100100', '12020400', 'MINISTRY OF AGRICULTURE', 'Registration of Fishing Boats', 'Individual', '2839', '2023-01-18 07:41:29'),
(137, '', '12020456', 'MINISTRY OF AGRICULTURE', 'Registration ol Farmers-Rubber', 'Individual', '8747', '2023-01-18 07:41:29'),
(138, '', '12020456', 'MINISTRY OF AGRICULTURE', 'Registration of Farmers — Cocoa', 'Individual', '2847', '2023-01-18 07:41:29'),
(139, '', '12020456', 'MINISTRY OF AGRICULTURE', 'Registration of Rice Farmers', 'Individual', '8293', '2023-01-18 07:41:29'),
(140, '', '12020456', 'MINISTRY OF AGRICULTURE', 'Registration of Fishermen/Fish Farmers', 'Individual', '8284', '2023-01-18 07:41:29'),
(141, '', '12020446', 'MINISTRY OF AGRICULTURE', 'Veterinay Clinic Treatment Fees', 'Individual', '9284', '2023-01-18 07:41:29'),
(142, '', '12020446', 'MINISTRY OF AGRICULTURE', 'Vaccination and Consultancy Fees', 'Individual', '8273', '2023-01-18 07:41:29'),
(143, '', '12020456', 'MINISTRY OF AGRICULTURE', 'Registration of Farmers — Oil Palm', 'Individual', '2533', '2023-01-18 07:41:29'),
(144, '', '12020446', 'MINISTRY OF AGRICULTURE', 'Processing of Rice', 'State Agency', '1247', '2023-01-18 07:41:29'),
(145, '', '12020446', 'MINISTRY OF AGRICULTURE', 'Tractor Hiring Service', 'Individual', '2632', '2023-01-18 07:41:29'),
(146, '', '12010114', 'MINISTRY OF AGRICULTURE', 'Livestock Sales Tax', 'Individual', '7237', '2023-01-18 07:41:29'),
(147, '', '12020905', 'MINISTRY OF AGRICULTURE', 'Lease of Swamp Land to Rice Farmers/Lease of Upland to Rice Farmers', 'State Agency', '6000', '2023-01-18 07:41:29'),
(148, '', '12020609', 'MINISTRY OF AGRICULTURE', 'Sales of Agricultural Product', 'Corporate', '5600', '2023-01-18 07:41:29'),
(149, '', '12020609', 'MINISTRY OF AGRICULTURE', 'Sales of Banana, Plantain, Pineapple, suckers citrus seedling etc.', 'Individual', '8765', '2023-01-18 07:41:29'),
(150, '', '12020617', 'MINISTRY OF AGRICULTURE', 'Sales of Eggs, BroiTers and Spent Birds', 'Individual', '7432', '2023-01-18 07:41:29'),
(151, '', '12020617', 'MINISTRY OF AGRICULTURE', 'Sales of Day Old Chicks', 'Individual', '8754', '2023-01-18 07:41:29'),
(152, '', '12020618', 'MINISTRY OF AGRICULTURE', 'Sales of Fish/Fingerlings', 'Individual', '7543', '2023-01-18 07:41:29'),
(153, '', '12020618', 'MINISTRY OF AGRICULTURE', 'Sales of Fishing Inputs', 'Individual', '1267', '2023-01-18 07:41:29'),
(154, '', '12020641', 'MINISTRY OF AGRICULTURE', 'Sales of Ice/Rental of Smoking Klins', 'Individual', '2432', '2023-01-18 07:41:29'),
(155, '', '12020643', 'MINISTRY OF AGRICULTURE', 'Sales of Rice Seeds and farmers', 'Individual', '4243', '2023-01-18 07:41:29'),
(156, '', '12020645', 'MINISTRY OF AGRICULTURE', 'Sales of Small Ruminants (Sheep and Goat)', 'Individual', '1237', '2023-01-18 07:41:29'),
(157, '', '12020649', 'MINISTRY OF AGRICULTURE', 'Surplus from Sales of Meat and Bleeding Stock (Piggery)', 'Individual', '4624', '2023-01-18 07:41:29'),
(158, '', '12020121', 'MINISTRY OF AGRICULTURE', 'Veterinary Permits', 'State Agency', '2028', '2023-01-18 07:41:29'),
(159, '023600100100', '12020709', 'MINISTRY OF CULTURE AND TOURISM', 'E - Tourism', 'State Agency', '9263', '2023-01-18 07:41:29'),
(160, '', '12020717', 'MINISTRY OF CULTURE AND TOURISM', 'Hiring of Ibom Plaza', 'State Agency', '6368', '2023-01-18 07:41:29'),
(161, '', '12020719', 'MINISTRY OF CULTURE AND TOURISM', 'Ibom Kitchen', 'State Agency', '6369', '2023-01-18 07:41:29'),
(162, '', '12020417', 'MINISTRY OF CULTURE AND TOURISM', 'Registration of Tourism Promoters', 'State Agency', '6370', '2023-01-18 07:41:29'),
(163, '', '12020456', 'MINISTRY OF CULTURE AND TOURISM', 'Registration Arts & Cultural Performance Fees', 'State Agency', '6371', '2023-01-18 07:41:29'),
(164, '', '12020465', 'MINISTRY OF CULTURE AND TOURISM', 'Endorsement Fees for Arts and Culture Festival', 'State Agency', '6372', '2023-01-18 07:41:29'),
(165, '', '12020465', 'MINISTRY OF CULTURE AND TOURISM', 'Renewal of Art & Culture Festival', 'State Agency', '6373', '2023-01-18 07:41:29'),
(166, '', '12021111', 'MINISTRY OF CULTURE AND TOURISM', 'Interest on Investment on Le Meridian Ibom Golf Course and Hotels', 'State Agency', '6374', '2023-01-18 07:41:29'),
(167, '', '12020616', 'MINISTRY OF CULTURE AND TOURISM', 'Sales of unserviceable items', 'Individual', '6375', '2023-01-18 07:41:29'),
(168, '', '12020647', 'MINISTRY OF CULTURE AND TOURISM', 'Sales og Works of Arts', 'Individual', '6376', '2023-01-18 07:41:29'),
(169, '', '12020803', 'MINISTRY OF CULTURE AND TOURISM', 'Rent on Ibibio Museum Parks', 'State Agency', '6377', '2023-01-18 07:41:29'),
(170, '051700100100', '12020705', 'MINISTRY OF EDUCATION', 'Hiring of Libraiy Hall (AKS LB)', 'Corporate', '1120', '2023-01-18 07:41:29'),
(171, '', '', '', 'ENDL Application Fees', 'Corporate', '1121', '2023-01-18 07:41:29'),
(172, '', '12020705', 'MINISTRY OF EDUCATION', 'Hiring e-Library Hall', 'Corporate', '1146', '2023-01-18 07:41:29'),
(173, '', '12020705', 'MINISTRY OF EDUCATION', 'Hiring of other Library Halls', 'Corporate', '2348', '2023-01-18 07:41:29'),
(174, '', '12020705', 'MINISTRY OF EDUCATION', 'Hiring of Library Hall (AKS LB)', 'Corporate', '3216', '2023-01-18 07:41:29'),
(175, '', '12020705', 'MINISTRY OF EDUCATION', 'Hiring e-Library Hall', 'Corporate', '2358', '2023-01-18 07:41:29'),
(176, '', '12020455', 'MINISTRY OF EDUCATION', 'Search Fees For Lost Certificates/Statement of Results', 'Individual', '3456', '2023-01-18 07:41:29'),
(177, '', '12020457', 'MINISTRY OF EDUCATION', 'Registration of Private Educational Institutions', 'Individual', '1439', '2023-01-18 07:41:29'),
(178, '', '12020457', 'MINISTRY OF EDUCATION', 'Fees for Public Education Facilities', 'State Agency', '6083', '2023-01-18 07:41:29'),
(179, '', '12020457', 'MINISTRY OF EDUCATION', 'French Tutorial Class to Public', 'Individual', '1300', '2023-01-18 07:41:29'),
(180, '', '12020457', 'MINISTRY OF EDUCATION', 'Renewal of Private Educational Institutions', 'Individual', '4009', '2023-01-18 07:41:29'),
(181, '', '12020505', 'MINISTRY OF EDUCATION', 'Fines for Overdue Books (Library Department)', 'Individual', '5432', '2023-01-18 07:41:29'),
(182, '', '12020507', 'MINISTRY OF EDUCATION', 'Fines on Operation of Illegal Schools', 'Individual', '6743', '2023-01-18 07:41:29'),
(183, '', '12020604', 'MINISTRY OF EDUCATION', 'Sales of Condemned Stores', 'Individual', '5439', '2023-01-18 07:41:29'),
(184, '', '12020715', 'MINISTRY OF EDUCATION', 'Hiring of Chairs (Library Department)', 'Individual', '6570', '2023-01-18 07:41:29'),
(185, '', '12020467', 'MINISTRY OF EDUCATION', 'Registration/Renewals of Library Membership', 'Individual', '7042', '2023-01-18 07:41:29'),
(186, '', '12020604', 'MINISTRY OF EDUCATION', 'Exam Reg Fee for Private School', 'Individual', '3212', '2023-01-18 07:41:29'),
(187, '', '', '', 'Dev fee for Adult trainning centre', 'Individual', '3000', '2023-01-18 07:41:29'),
(188, '', '', '', 'Sale of form for cont.Edu', 'Individual', '3200', '2023-01-18 07:41:29'),
(189, '', '12020637', 'MINISTRY OF EDUCATION', 'Sales of Form for Private Edu. Inst.', 'Individual', '2890', '2023-01-18 07:41:29'),
(190, '', '12020644', 'MINISTRY OF EDUCATION', 'Sales of Science Equipment', 'Individual', '1270', '2023-01-18 07:41:29'),
(191, '053500100100', '12020417', 'MINISTRY OF ENVIRONMENT', 'Renewal of Environmental Contractors/Consultants', 'State Agency', '3752', '2023-01-18 07:41:29'),
(192, '', '12020417', 'MINISTRY OF ENVIRONMENT', 'Registration of Environmental Contractors/Consultants', 'State Agency', '2647', '2023-01-18 07:41:29'),
(193, '', '12020448', 'MINISTRY OF ENVIRONMENT', 'Refuse and Tariff Fee', 'State Agency', '1283', '2023-01-18 07:41:29'),
(194, '', '12020438', 'MINISTRY OF ENVIRONMENT', 'Mining Fees', 'State Agency', '7126', '2023-01-18 07:41:29'),
(195, '', '12020451', 'MINISTRY OF ENVIRONMENT', 'Forests Fees', 'State Agency', '2642', '2023-01-18 07:41:29'),
(196, '', '12020431', 'MINISTRY OF ENVIRONMENT', 'Pollution Mgt and Efflucnce discharge Fee', 'State Agency', '7372', '2023-01-18 07:41:29'),
(197, '', '12020447', 'MINISTRY OF ENVIRONMENT', 'Environmental Fees', 'State Agency', '6463', '2023-01-18 07:41:29'),
(198, '', '12020503', 'MINISTRY OF ENVIRONMENT', 'EnvironmentaI Defaulters (Fines)', 'Individual', '3647', '2023-01-18 07:41:29'),
(199, '', '', 'MINISTRY OF ENVIRONMENT', 'Waste Management Fees', 'State Agency', '8273', '2023-01-18 07:41:29'),
(200, '', '', 'MINISTRY OF ENVIRONMENT', 'Roof Rack Permit', 'Individual', '2617', '2023-01-18 07:41:29'),
(201, '', '12020504', 'MINISTRY OF ENVIRONMENT', 'Forestry Fine', 'Individual', '1263', '2023-01-18 07:41:29'),
(202, '', '12020134', 'MINISTRY OF ENVIRONMENT', 'Forestry General License', 'State Agency', '3278', '2023-01-18 07:41:29'),
(203, '', '12020604', 'MINISTRY OF ENVIRONMENT', 'Sales of Condenmed Stores', 'State Agency', '2648', '2023-01-18 07:41:29'),
(204, '', '12020619', 'MINISTRY OF ENVIRONMENT', 'Sales of Forestry Product - Timber', 'Individual', '1273', '2023-01-18 07:41:29'),
(205, '', '12020619', 'MINISTRY OF ENVIRONMENT', 'Sales of Forestry Product - Ornamental', 'Individual', '8463', '2023-01-18 07:41:29'),
(206, '02200010010', '12020809', 'MINISTRY OF FINANCE HQ', 'Exceptional/Extra-ordinary Income', 'State Agency', '7234', '2023-01-18 07:41:29'),
(207, '', '12021103', 'MINISTRY OF FINANCE HQ', 'Investment Income', 'State Agency', '2347', '2023-01-18 07:41:29'),
(208, '', '14030100', 'MINISTRY OF FINANCE HQ', 'Domestic Loans/Borrowing Receipts', 'State Agency', '3648', '2023-01-18 07:41:29'),
(209, '', '14030100', 'MINISTRY OF FINANCE HQ', 'Internal loans', 'State Agency', '8374', '2023-01-18 07:41:29'),
(210, '', '14020103', 'MINISTRY OF FINANCE HQ', 'Privatization of State own Enterprise/Investment Income', 'State Agency', '2638', '2023-01-18 07:41:29'),
(211, '', '12021205', 'MINISTRY OF FINANCE HQ', 'Interest on car loans', 'Individual', '2732', '2023-01-18 07:41:29'),
(212, '052100100100', '12020441', 'MINISTRY OF HEALTH HQ', 'Laboratory Fees for Public Health', 'State Agency', '2543', '2023-01-18 07:41:29'),
(213, '', '12020452', 'MINISTRY OF HEALTH HQ', 'Tuition Fees for Student Nurses/Midwiyes', 'Individual', '4567', '2023-01-18 07:41:29'),
(214, '', '12020447', 'MINISTRY OF HEALTH HQ', 'Minor Surgical Intervention', 'Individual', '2747', '2023-01-18 07:41:29'),
(215, '', '12020475', 'MINISTRY OF HEALTH HQ', 'Medical Certificate for Fitness', 'Individual', '6452', '2023-01-18 07:41:29'),
(216, '', '12020447', 'MINISTRY OF HEALTH HQ', 'Wound Dressing and /Minor Suturing', 'Individual', '9182', '2023-01-18 07:41:29'),
(217, '', '12020452', 'MINISTRY OF HEALTH HQ', 'Entrance Examination Fees for Training Nurses and Paramedical Staff', 'Individual', '1638', '2023-01-18 07:41:29'),
(218, '', '12020458', 'MINISTRY OF HEALTH HQ', 'Registration Fees Ambulances', 'Individual', '3721', '2023-01-18 07:41:29'),
(219, '', '12020465', 'MINISTRY OF HEALTH HQ', 'Revenue for Govt Hospital', 'State Agency', '5273', '2023-01-18 07:41:29'),
(220, '', '12020459', 'MINISTRY OF HEALTH HQ', 'Registration Fees for Mortuary Clinic', 'Individual', '2537', '2023-01-18 07:41:29'),
(221, '', '12020459', 'MINISTRY OF HEALTH HQ', 'Registration /RenewaI Fees for Private Medical Clinic', 'Individual', '8365', '2023-01-18 07:41:29'),
(222, '', '12020472', 'MINISTRY OF HEALTH HQ', 'Hostel Fees For Student Nurses/Midwives', 'Individual', '1732', '2023-01-18 07:41:29'),
(223, '', '12020458', 'MINISTRY OF HEALTH HQ', 'Renewal Fees Ambulances', 'Individual', '6367', '2023-01-18 07:41:29'),
(224, '', '12020459', 'MINISTRY OF HEALTH HQ', 'Renewal fees for Mortuary Clinic', 'Individual', '6128', '2023-01-18 07:41:29'),
(225, '', '12020603', 'MINISTRY OF HEALTH HQ', 'Sales of Cards (2 Staff Clinics & Eye Clinic)', 'Individual', '1273', '2023-01-18 07:41:29'),
(226, '', '12020133', 'MINISTRY OF HEALTH HQ', 'Patent Medicine Proprietary Vendors Licenses', 'Corporate', '2732', '2023-01-18 07:41:29'),
(227, '', '12020604', 'MINISTRY OF HEALTH HQ', 'Sales of Condemned Stores', 'Individual', '1832', '2023-01-18 07:41:29'),
(228, '', '12020447', 'MINISTRY OF HEALTH HQ', 'Other Medical Charges/On Duty Card', 'Individual', '2874', '2023-01-18 07:41:29'),
(229, '025300100100', '12020438', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Building Plans Vetting Fees', 'State Agency', '3764', '2023-01-18 07:41:29'),
(230, '', '12020438', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Preparation of Bill of Quantities Fees', 'State Agency', '2833', '2023-01-18 07:41:29'),
(231, '', '12020480', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Vetting of Mechanical & Engineering (M&E)Drawing', 'State Agency', '3882', '2023-01-18 07:41:29'),
(232, '', '12020431', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Preparation of Working Drawing Fees', 'State Agency', '8366', '2023-01-18 07:41:29'),
(233, '', '12020116', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Property Tax', 'State Agency', '2742', '2023-01-18 07:41:29'),
(234, '', '12020906', 'MINISTRY OF HOUSING AND SPECIAL DUTIES', 'Rent on Govt. Building/Quavers', 'State Agency', '7376', '2023-01-18 07:41:29'),
(235, '012300100100', '12020715', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Hiring of PubIic Address System', 'Individual', '7362', '2023-01-18 07:41:29'),
(236, '', '12020449', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Renewal of Newspapers and Magazines', 'Individual', '8377', '2023-01-18 07:41:29'),
(237, '', '12020449', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Registration of Newspapers and Magazines', 'Individual', '2972', '2023-01-18 07:41:29'),
(238, '', '12020468', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Media Centre Fees', 'Individual', '7365', '2023-01-18 07:41:29'),
(239, '', '12020616', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Sales of Unserviceable Vehicles', 'Individual', '2765', '2023-01-18 07:41:29'),
(240, '', '12020721', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Printing on Payment', 'Individual', '2736', '2023-01-18 07:41:29'),
(241, '', '12020604', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Sales of Condemned Stores', 'Individual', '2874', '2023-01-18 07:41:29'),
(242, '', '12020616', 'MINISTRY OF INFORMATION AND COMMUNICATIONS', 'Sales of Unserviceable Vehicles', 'Individual', '8263', '2023-01-18 07:41:29'),
(243, '032600100100', '12020465', 'MINISTRY OF JUSTICE', 'Public Trustee and Administration', 'Federal Agency', '2364', '2023-01-18 07:41:29'),
(244, '', '12020440', 'MINISTRY OF JUSTICE', 'Agreement Fee/Consultancy Services', 'Federal Agency', '2874', '2023-01-18 07:41:29'),
(245, '', '12020601', 'MINISTRY OF JUSTICE', 'Sales of Unserviceable Items', 'Individual', '9482', '2023-01-18 07:41:29'),
(246, '', '12020601', 'MINISTRY OF JUSTICE', 'Sales of Revised Edition Law', 'State Agency', '8762', '2023-01-18 07:41:29'),
(247, '', '12020640', 'MINISTRY OF JUSTICE', 'Sales of High Court Civil Procedure', 'Federal Agency', '2742', '2023-01-18 07:41:29'),
(248, '026000100100', '12020904', 'MIN. OF LANDS AND TOWN PLANNING', 'Ground Rent', 'Individual', '9483', '2023-01-18 07:41:29'),
(249, '', '12020486', 'MIN. OF LANDS AND TOWN PLANNING', 'Registration fee for Ad-on-LDP-Station', 'Individual', '2768', '2023-01-18 07:41:29'),
(250, '', '12020437', 'MIN. OF LANDS AND TOWN PLANNING', 'Deeds Preparation Approval, Execution and Registration Fees', 'State Agency', '3687', '2023-01-18 07:41:29'),
(251, '', '12020438', 'MIN. OF LANDS AND TOWN PLANNING', 'Building Plans and Inspection Fees', 'Individual', '8746', '2023-01-18 07:41:29'),
(252, '', '12020455', 'MIN. OF LANDS AND TOWN PLANNING', 'Search Fee', 'Individual', '7482', '2023-01-18 07:41:29'),
(253, '', '12020440', 'MIN. OF LANDS AND TOWN PLANNING', 'Annual Pratice fee for Consultant Town Planning', 'Individual', '8467', '2023-01-18 07:41:29'),
(254, '', '12020807', 'MIN. OF LANDS AND TOWN PLANNING', 'Rent on Industrial Estate', 'Individual', '8847', '2023-01-18 07:41:29'),
(255, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Site Analysis Report Fees', 'Individual', '9734', '2023-01-18 07:41:29'),
(256, '', '12020453', 'MIN. OF LANDS AND TOWN PLANNING', 'Non-Refundable Application Fees for Letters of Consent', 'Individual', '7262', '2023-01-18 07:41:29'),
(257, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Plot Identification Fees', 'Individual', '2764', '2023-01-18 07:41:29'),
(258, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Land Use Development Clearance Certificate', 'Individual', '2738', '2023-01-18 07:41:29'),
(259, '', '12020438', 'MIN. OF LANDS AND TOWN PLANNING', 'Approval Fees for Private Layout Plans', 'Individual', '8276', '2023-01-18 07:41:29'),
(260, '', '12020431', 'MIN. OF LANDS AND TOWN PLANNING', 'Environmental Impact Analysis Report Fees                   *', 'Individual', '4253', '2023-01-18 07:41:29'),
(261, '', '12020465', 'MIN. OF LANDS AND TOWN PLANNING', 'Oil/Gas Fees', 'Individual', '7251', '2023-01-18 07:41:29'),
(262, '', '12020448', 'MIN. OF LANDS AND TOWN PLANNING', 'Revenue from Communication Masks', 'State Agency', '2472', '2023-01-18 07:41:29'),
(263, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Sitting /ApprovaI of GSM Renewal Charges', 'State Agency', '3622', '2023-01-18 07:41:29'),
(264, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Siting / Approval of GSM Masks', 'State Agency', '2743', '2023-01-18 07:41:29'),
(265, '', '12020447', 'MIN. OF LANDS AND TOWN PLANNING', 'Urban Development Fees', 'State Agency', '8466', '2023-01-18 07:41:29'),
(266, '', '12010112', 'MIN. OF LANDS AND TOWN PLANNING', 'Property Tax (Urban Devt Tax)', 'State Agency', '3264', '2023-01-18 07:41:29'),
(267, '', '12020901', 'MIN. OF LANDS AND TOWN PLANNING', 'Land Rent — Temporary right of Occupancy', 'State Agency', '3747', '2023-01-18 07:41:29'),
(268, '', '12020901', 'MIN. OF LANDS AND TOWN PLANNING', 'Premium on Lands', 'State Agency', '2743', '2023-01-18 07:41:29'),
(269, '', '12020132', 'MIN. OF LANDS AND TOWN PLANNING', 'Container Strcutures Permit', 'State Agency', '8346', '2023-01-18 07:41:29'),
(270, '', '12020901', 'MIN. OF LANDS AND TOWN PLANNING', 'Rent on State Lands (Residential)', 'State Agency', '8366', '2023-01-18 07:41:29'),
(271, '', '12020901', 'MIN. OF LANDS AND TOWN PLANNING', 'Land Use Rent (Privace C/O)', 'State Agency', '2373', '2023-01-18 07:41:29'),
(272, '', '12020616', 'MIN. OF LANDS AND TOWN PLANNING', 'Sales of unserviceabIe items', 'Individual', '2843', '2023-01-18 07:41:29'),
(273, '', '12020906', 'MIN. OF LANDS AND TOWN PLANNING', 'Rent on Govt Property withstate', 'Federal Agency', '2848', '2023-01-18 07:41:29'),
(274, '', '12020616', 'MIN. OF LANDS AND TOWN PLANNING', 'Sales of Unserviceable Motor Vehicles', 'Individual', '9483', '2023-01-18 07:41:29'),
(275, '', '', 'MIN. OF LANDS AND TOWN PLANNING', 'Consultation Fees', 'Individual', '8376', '2023-01-18 07:41:29'),
(276, '', '12020621', 'MIN. OF LANDS AND TOWN PLANNING', 'Sales of Master Plan', 'State Agency', '2748', '2023-01-18 07:41:29'),
(277, '045100200100', '12020465', 'MINISTRY OF LOCAL GOVERNMENT AND CHIEFTANCY AFFAIRS', 'Rating Valuation Fees', 'State Agency', '8397', '2023-01-18 07:41:29'),
(278, '', '12020135', 'MINISTRY OF LOCAL GOVERNMENT AND CHIEFTANCY AFFAIRS', 'Licencing of Place of Worship', 'State Agency', '2648', '2023-01-18 07:41:29'),
(279, '', '12020136', 'MINISTRY OF LOCAL GOVERNMENT AND CHIEFTANCY AFFAIRS', 'Renewal of licence of Registered Place of Worship', 'State Agency', '3843', '2023-01-18 07:41:29'),
(280, '0', '12020456', 'MINISTRY OF RURAL DEVELOPMENT', 'Registration of Projects', 'State Agency', '2847', '2023-01-18 07:41:29'),
(281, '', '12020448', 'MINISTRY OF RURAL DEVELOPMENT', 'Project Servicing fee', 'State Agency', '9487', '2023-01-18 07:41:29'),
(282, '', '12020456', 'MINISTRY OF RURAL DEVELOPMENT', 'Registration of Development Associations', 'State Agency', '9384', '2023-01-18 07:41:29'),
(283, '', '12020616', 'MINISTRY OF RURAL DEVELOPMENT', 'Sales of Unserviceable Items', 'Individual', '5987', '2023-01-18 07:41:29'),
(284, '022800100100', '12020441', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Laboratory Services Fees', 'Individual', '2874', '2023-01-18 07:41:29'),
(285, '', '12020449', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Fee for Cyber Café/Computer Operation', 'Individual', '2493', '2023-01-18 07:41:29'),
(286, '', '12020453', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'ICT Acedamy Fees', 'Individual', '4976', '2023-01-18 07:41:29'),
(287, '', '12020705', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Hiring e-Library Hall', 'Individual', '3957', '2023-01-18 07:41:29'),
(288, '', '12020705', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Revenue from e-library', 'State Agency', '3874', '2023-01-18 07:41:29'),
(289, '', '12020130', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Inspection and Licensing of Lab', 'State Agency', '2948', '2023-01-18 07:41:29'),
(290, '', '12020616', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Sales of Unserviceable Motor Vehicles/Items', 'Individual', '2747', '2023-01-18 07:41:29'),
(291, '', '12020465', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Internet Services', 'Individual', '2847', '2023-01-18 07:41:29'),
(292, '', '12020804', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Rent on Canteen/Conference Hall', 'Individual', '2846', '2023-01-18 07:41:29'),
(293, '', '12020608', 'MINISTRY OF SCIENCE AND TECHNOLOGY', 'Sales of Produced Chemicals', 'State Agency', '2374', '2023-01-18 07:41:29'),
(294, '0', '12020704', 'AKWA IBOM URBAN TAXI NETWORK LIMITED', 'Fares form Taxi', 'State Agency', '8384', '2023-01-18 07:41:29'),
(295, '', '12020704', 'AKWA IBOM URBAN TAXI NETWORK LIMITED', 'Fares form Marc BuseS', 'State Agency', '2943', '2023-01-18 07:41:29'),
(296, '', '12020704', 'AKWA IBOM URBAN TAXI NETWORK LIMITED', 'Fares from City Buses', 'State Agency', '4959', '2023-01-18 07:41:29'),
(297, '022900100100', '12020718', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Hiring of Towing of Trucks / Van', 'Individual', '9483', '2023-01-18 07:41:29'),
(298, '', '12020449', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Registration of Driving School', 'Individual', '3748', '2023-01-18 07:41:29'),
(299, '', '12020458', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Registration of Comm. Vehicle / TryCycles', 'Individual', '4858', '2023-01-18 07:41:29'),
(300, '', '12020462', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Landing and Take Off £ees', 'Individual', '3858', '2023-01-18 07:41:29'),
(301, '', '12020449', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Renewal of Driving School', 'Individual', '3848', '2023-01-18 07:41:29'),
(302, '', '12020458', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Renewal of Comm. Vehicle/Tricycles', 'Individual', '2938', '2023-01-18 07:41:29'),
(303, '', '12020465', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Motor Traffic Road Worthless Test', 'Individual', '3947', '2023-01-18 07:41:29'),
(304, '', '12020482', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Sea Worthiness Certification', 'Individual', '3854', '2023-01-18 07:41:29'),
(305, '', '12020465', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Motor Traffic Examination Fees', 'Individual', '5938', '2023-01-18 07:41:29'),
(306, '', '12020465', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Motor Traffic Driving Test', 'Individual', '2746', '2023-01-18 07:41:29'),
(307, '', '12020448', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Manifest', 'Individual', '3748', '2023-01-18 07:41:29'),
(308, '', '12020464', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Maritime Derivable Revenue', 'Individual', '3849', '2023-01-18 07:41:29'),
(309, '', '12020464', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Maritime Emblems Fees', 'Individual', '3988', '2023-01-18 07:41:29'),
(310, '', '12020483', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Whaf landing fee on Petroleun Product', 'Individual', '3842', '2023-01-18 07:41:29'),
(311, '', '12020458', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Boat Registration Fees', 'Individual', '3847', '2023-01-18 07:41:29'),
(312, '', '12020462', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Loading / Take OfT Fees', 'Individual', '3984', '2023-01-18 07:41:29'),
(313, '', '12020509', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Pounding of Illegal Parking', 'Individual', '4858', '2023-01-18 07:41:29'),
(314, '', '12010111', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Road Tsx', 'Individual', '3848', '2023-01-18 07:41:29'),
(315, '', '12020664', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Daily Ticketing on Tric cle,Taxis snd Bus', 'Individual', '3848', '2023-01-18 07:41:29'),
(316, '', '12020616', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Other Unspecified Revenue (Unservicable Items)', 'Individual', '5038', '2023-01-18 07:41:29'),
(317, '', '12020910', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Rent on Used of State Water Ways', 'Individual', '3894', '2023-01-18 07:41:29'),
(318, '', '12020625', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'SaIes of Highway Codes', 'Individual', '4856', '2023-01-18 07:41:29'),
(319, '', '12020646', 'MINISTRY OF TRANSPORT AND PETROLEUM RESOURCES', 'Sales of Vehicle Emblems', 'Individual', '3875', '2023-01-18 07:41:29'),
(320, '051400100100', '12020705', 'MINISTRY OF WOMEN AFFAIRS AND SOCIAL DEVELOPMENT', 'Hiring of Women Development Hall', 'Individual', '3498', '2023-01-18 07:41:29'),
(321, '', '12020456', 'MINISTRY OF WOMEN AFFAIRS AND SOCIAL DEVELOPMENT', 'Registrstion Fee of women NGO', 'Individual', '2876', '2023-01-18 07:41:29'),
(322, '', '12020456', 'MINISTRY OF WOMEN AFFAIRS AND SOCIAL DEVELOPMENT', 'Revalidation Fee of women NGO', 'Individual', '2384', '2023-01-18 07:41:29'),
(323, '053900100100', '12020410', 'MINISTRY OF WORKS', 'Weight and Measure of Tippers', 'Individual', '2948', '2023-01-18 07:41:29'),
(324, '', '12020428', 'MINISTRY OF WORKS', 'Caution fees', 'Individual', '3866', '2023-01-18 07:41:29'),
(325, '', '12020462', 'MINISTRY OF WORKS', 'State Haulage for all Manufacturing cop', 'State Agency', '3974', '2023-01-18 07:41:29'),
(326, '', '12020441', 'MINISTRY OF WORKS', 'Soil Material Laboratory', 'State Agency', '4863', '2023-01-18 07:41:29'),
(327, '', '12020454', 'MINISTRY OF WORKS', 'Delivery fee', 'Individual', '8455', '2023-01-18 07:41:29'),
(328, '', '12020436', 'MINISTRY OF WORKS', 'Hoisting of Banners', 'Individual', '2876', '2023-01-18 07:41:29'),
(329, '', '12020473', 'MINISTRY OF WORKS', 'Road Rehabilitation and city permit', 'State Agency', '1762', '2023-01-18 07:41:29'),
(330, '', '12020450', 'MINISTRY OF WORKS', 'Inspcction Fees (Peuol Station)', 'State Agency', '1972', '2023-01-18 07:41:29'),
(331, '', '12020448', 'MINISTRY OF WORKS', 'Right of Way', 'State Agency', '7369', '2023-01-18 07:41:29'),
(332, '', '12020908', 'MINISTRY OF WORKS', 'RenT of MOW Filling Stations', 'State Agency', '2874', '2023-01-18 07:41:29'),
(333, '', '12020909', 'MINISTRY OF WORKS', 'Rent of Overhead Tank', 'State Agency', '8792', '2023-01-18 07:41:29'),
(334, '', '12020616', 'MINISTRY OF WORKS', 'Sales of Unserviceable Vehicles, Plants and Equipment', 'Individual', '2948', '2023-01-18 07:41:29'),
(335, '053900100100', '12020714', 'MINISTRY OF YOUTH AND SPORTS', 'Gate Taking/Hiring of Stadium', 'Individual', '8778', '2023-01-18 07:41:29'),
(336, '', '12020456', 'MINISTRY OF YOUTH AND SPORTS', 'Registration of Youth Associations', 'State Agency', '2847', '2023-01-18 07:41:29'),
(337, '', '12020456', 'MINISTRY OF YOUTH AND SPORTS', 'Revalidation of Youth Associations', 'State Agency', '3846', '2023-01-18 07:41:29'),
(338, '014000100100', '12020417', 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', 'Registration fee (Ext. Auditors)', 'State Agency', '9474', '2023-01-18 07:41:29'),
(339, '', '12020465', 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', 'Audit Arrears', 'State Agency', '8366', '2023-01-18 07:41:29'),
(340, '', '12020465', 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', 'Audit Fees', 'State Agency', '8476', '2023-01-18 07:41:29'),
(341, '', '12020440', 'OFFICE OF THE AUDITOR GENERAL(LOCAL GOVERNMENT)', 'Audit Consul fancy Fees', 'Individual', '3873', '2023-01-18 07:41:29'),
(342, '014000100100', '12020465', 'OFFICE OF THE AUDITOR GENERAL(STATE)', 'Audit fees', 'State Agency', '9847', '2023-01-18 07:41:29'),
(343, '', '12020440', 'OFFICE OF THE AUDITOR GENERAL(STATE)', 'Audit Consultancy fees', 'Individual', '9487', '2023-01-18 07:41:29'),
(344, '', '12020456', 'OFFICE OF THE AUDITOR GENERAL(STATE)', 'Registration of Audit Firms', 'State Agency', '2748', '2023-01-18 07:41:29'),
(345, '', '12020456', 'OFFICE OF THE AUDITOR GENERAL(STATE)', 'Renewal of Audit Firms', 'State Agency', '3848', '2023-01-18 07:41:29'),
(346, '', '12020616', 'OFFICE OF THE AUDITOR GENERAL(STATE)', 'Sales of Unserviceable Item', 'Individual', '9473', '2023-01-18 07:41:29'),
(347, '012500100100', '12020705', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Hiring of Secretarait Complex Auditorium', 'Federal Agency', '3779', '2023-01-18 07:41:29'),
(348, '', '12020449', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Reg/Rwal Fees for Training and Consultancy Services', 'Federal Agency', '3987', '2023-01-18 07:41:29'),
(349, '', '12020465', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Civil Service Rule Scheme', 'Federal Agency', '4987', '2023-01-18 07:41:29'),
(350, '', '12020601', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Sales of Civil Service Rule Booklets', 'Federal Agency', '4873', '2023-01-18 07:41:29'),
(351, '', '12020604', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Sales of Staff List', 'Federal Agency', '3854', '2023-01-18 07:41:29'),
(352, '', '12020616', 'OFFICE OF THE HEAD OF CIVIL SERVICE', 'Sales of Unserviceable Item', 'Individual', '3848', '2023-01-18 07:41:29'),
(353, '011101300100', '12020417', 'OFFICE OF THE SECRETARY TO THE STATE GOVERNMENT', 'Registration and Renewal of Contractor', 'State Agency', '3497', '2023-01-18 07:41:29'),
(354, '', '12020642', 'OFFICE OF THE SECRETARY TO THE STATE GOVERNMENT', 'Sales of Pilgrims Reg Forms', 'State Agency', '7363', '2023-01-18 07:41:29'),
(355, '023400200100', '', 'SURVEYOR GENERAL', 'OPL Exclusive Prospective License', 'Individual', '8466', '2023-01-18 07:41:29'),
(356, '', '12020438', 'SURVEYOR GENERAL', 'Survery Fees', 'Individual', '8376', '2023-01-18 07:41:29'),
(357, '', '12020460', 'SURVEYOR GENERAL', 'Certificate of Depost', 'Individual', '8576', '2023-01-18 07:41:29'),
(358, '', '12020447', 'SURVEYOR GENERAL', 'Site Inspection Fees', 'Individual', '8364', '2023-01-18 07:41:29'),
(359, '', '12020455', 'SURVEYOR GENERAL', 'Search Fees', 'Individual', '9847', '2023-01-18 07:41:29'),
(360, '', '12020621', 'SURVEYOR GENERAL', 'Sales of Map', 'State Agency', '9857', '2023-01-18 07:41:29'),
(361, '', '12020314', 'SURVEYOR GENERAL', 'Royalties on Plan and Map Films', 'State Agency', '8757', '2023-01-18 07:41:29'),
(362, '02340020010', '12020456', 'POLITICAL AND LEGISLATIVE AFFAIRS BUREAU', 'Registration of Political Association', 'State Agency', '6374', '2023-01-18 07:41:29'),
(363, '', '12020457', 'POLITICAL AND LEGISLATIVE AFFAIRS BUREAU', 'Renewal Fee for Political Association', 'State Agency', '2747', '2023-01-18 07:41:29'),
(364, '02340020010', '12020452', 'HOSPITAL MANAGEMENT BOARD', 'Medical Examination', 'Individual', '2474', '2023-01-18 07:41:29'),
(365, '', '12020441', 'HOSPITAL MANAGEMENT BOARD', 'Medical Laboratory Fees', 'Individual', '2974', '2023-01-18 07:41:29'),
(366, '', '12020459-a', 'HOSPITAL MANAGEMENT BOARD', 'HospitaI Fees', 'Individual', '8273', '2023-01-18 07:41:29'),
(367, '', '12020459-b', 'HOSPITAL MANAGEMENT BOARD', 'Mortuary fees', 'Individual', '2873', '2023-01-18 07:41:29'),
(368, '', '12020468-b', 'HOSPITAL MANAGEMENT BOARD', 'Fixed Fees', 'Individual', '8473', '2023-01-18 07:41:29'),
(369, '', '', 'HOSPITAL MANAGEMENT BOARD', 'X-Ray Fees', 'Individual', '8489', '2023-01-18 07:41:29'),
(370, '', '12020468-c', 'HOSPITAL MANAGEMENT BOARD', 'Operation', 'Individual', '2648', '2023-01-18 07:41:29'),
(371, '', '', 'HOSPITAL MANAGEMENT BOARD', 'Scan', 'Individual', '8243', '2023-01-18 07:41:29'),
(372, '022200100100', '12010110', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Produce Sales Tax', 'State Agency', '4726', '2023-01-18 07:41:29'),
(373, '', '12020448', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Produce Dev. Fund', 'State Agency', '3948', '2023-01-18 07:41:29'),
(374, '', '12020449-a', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Reg. of Business Premises', 'State Agency', '8363', '2023-01-18 07:41:29'),
(375, '', '12020449-b', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Reg. of Produce Stores', 'State Agency', '8483', '2023-01-18 07:41:29'),
(376, '', '12020449-c', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Listing & Reco Hotels Tourism Entterp. Fees', 'State Agency', '2739', '2023-01-18 07:41:29'),
(377, '', '12020449-d', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Renewal of produce scores', 'State Agency', '4934', '2023-01-18 07:41:29');
INSERT INTO `revenue_heads` (`id`, `COL_1`, `COL_2`, `COL_3`, `COL_4`, `COL_5`, `COL_6`, `time_in`) VALUES
(378, '', '1202449- e', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Renewal of Business Premises', 'State Agency', '8473', '2023-01-18 07:41:29'),
(379, '', '12020450', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Produce Inspection Fees', 'State Agency', '9473', '2023-01-18 07:41:29'),
(380, '', '12020455', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Replacement of Lost Cert. of Reg. Fees', 'Individual', '8473', '2023-01-18 07:41:29'),
(381, '', '12020456', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Produre Merchant Reg. Fees', 'Individual', '2848', '2023-01-18 07:41:29'),
(382, '', '12020514', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Fine for Non-Compliance with produce Law', 'State Agency', '3857', '2023-01-18 07:41:29'),
(383, '', '12020515', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Fine for using Platform other than Registered Place', 'State Agency', '9473', '2023-01-18 07:41:29'),
(384, '', '12020516', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Wrong Grading of Produce', 'State Agency', '8747', '2023-01-18 07:41:29'),
(385, '', '12020636', 'MINISTRY OF INVESTMENT, COMMERCE AND INDUSTRY', 'Sales of Desk Dairy', 'Individual', '2377', '2023-01-18 07:41:29'),
(386, '014700100100', '12020601', 'AKS CIVIL SERVICE COMMISSION', 'Sales of Annual Report', 'State Agency', '3747', '2023-01-18 07:41:29'),
(387, '', '12020455', 'AKS CIVIL SERVICE COMMISSION', 'Search Fees for the Lost of Service Doc.', 'State Agency', '4778', '2023-01-18 07:41:29'),
(388, '014700100100', '12020417', 'FINANCE AND GEN. PURPOSE COMMITTEE', 'Registration and Renewal of Contractor', 'State Agency', '7478', '2023-01-18 07:41:29'),
(389, '', '12020453', 'FINANCE AND GEN. PURPOSE COMMITTEE', 'Processing Fees', 'State Agency', '2634', '2023-01-18 07:41:29'),
(390, '', '12020427', 'FINANCE AND GEN. PURPOSE COMMITTEE', 'Fees tor Tenders Documents', 'State Agency', '2838', '2023-01-18 07:41:29'),
(391, '', '12020417', 'FINANCE AND GEN. PURPOSE COMMITTEE', 'Renewal of Contractors', 'State Agency', '1294', '2023-01-18 07:41:29'),
(392, '', '12020417', 'FINANCE AND GEN. PURPOSE COMMITTEE', 'Registration of Contractors', 'State Agency', '2894', '2023-01-18 07:41:29'),
(393, '023405600100', '12020428', 'AKWA IBOM STATE FIRE SERVICE', 'Fire Safety Certitlcate to Petrol Station', 'State Agency', '2484', '2023-01-18 07:41:29'),
(394, '', '12020436', 'AKWA IBOM STATE FIRE SERVICE', 'Hoisting of Banners', 'Individual', '1467', '2023-01-18 07:41:29'),
(395, '', '12020430', 'AKWA IBOM STATE FIRE SERVICE', 'Inspection Fees (Petrol Station)', 'Individual', '2812', '2023-01-18 07:41:29'),
(396, '0', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Fencing Fees', 'State Agency', '1000', '2023-01-18 07:41:29'),
(397, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Building Plan Fees', 'State Agency', '9383', '2023-01-18 07:41:29'),
(398, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Site Plan Analysis Report Fees', 'State Agency', '2848', '2023-01-18 07:41:29'),
(399, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Application For Letter of Consent', 'State Agency', '2848', '2023-01-18 07:41:29'),
(400, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Environment Impact Assessment Report', 'State Agency', '3847', '2023-01-18 07:41:29'),
(401, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Temporary Structure Fees', 'State Agency', '3848', '2023-01-18 07:41:29'),
(402, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Pegging Fees', 'State Agency', '4857', '2023-01-18 07:41:29'),
(403, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Petition Fees', 'State Agency', '8547', '2023-01-18 07:41:29'),
(404, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Opening of Roads', 'State Agency', '5483', '2023-01-18 07:41:29'),
(405, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Allocation of Plot Fees', 'State Agency', '4873', '2023-01-18 07:41:29'),
(406, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Borehole Development Fees', 'State Agency', '3948', '2023-01-18 07:41:29'),
(407, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Burial Fees', 'State Agency', '3839', '2023-01-18 07:41:29'),
(408, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Site Clearance', 'State Agency', '3390', '2023-01-18 07:41:29'),
(409, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Mast Antenna', 'State Agency', '3489', '2023-01-18 07:41:29'),
(410, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Re-Submission', 'State Agency', '3849', '2023-01-18 07:41:29'),
(411, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Charting Fees', 'State Agency', '3948', '2023-01-18 07:41:29'),
(412, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Building Regulation Fees', 'State Agency', '9484', '2023-01-18 07:41:29'),
(413, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Sales - General', 'State Agency', '9384', '2023-01-18 07:41:29'),
(414, '', '', 'UYO CAPITAL CITY DEVELOPMENT AUTHORITY', 'Building Application Form', 'State Agency', '9478', '2023-01-18 07:41:29'),
(415, '0', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Registration of Cultural Troupe', 'Individual', '4673', '2023-01-18 07:41:29'),
(416, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Cultural Performance', 'Individual', '7364', '2023-01-18 07:41:29'),
(417, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Production/Sales of Arts Work', 'Individual', '2473', '2023-01-18 07:41:29'),
(418, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Craft Shop', 'Individual', '3473', '2023-01-18 07:41:29'),
(419, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Renting of Councils Hall', 'Individual', '3743', '2023-01-18 07:41:29'),
(420, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Variety Show', 'Individual', '3747', '2023-01-18 07:41:29'),
(421, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Hiring of Costumes', 'Individual', '3848', '2023-01-18 07:41:29'),
(422, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Income from Millennium Band', 'Individual', '4857', '2023-01-18 07:41:29'),
(423, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Hiring of Council Band', 'Individual', '4748', '2023-01-18 07:41:29'),
(424, '', '', 'AKS COUNCIL FOR ARTS AND CULTURE', 'Sundry Revenue', 'Individual', '3747', '2023-01-18 07:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `revenue_heads1`
--

CREATE TABLE `revenue_heads1` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `mda_id` int(255) NOT NULL,
  `time_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `revenue_heads1`
--

INSERT INTO `revenue_heads1` (`id`, `fullname`, `description`, `amount`, `mda_id`, `time_in`) VALUES
(1, '2', 'lll', 2.50, 2, '2023-01-11 14:40:59'),
(2, '22', 'lll', 2.50, 2, '2023-01-11 14:41:08'),
(3, 'PAYE', 'tax to be paid as PAYE', 3232.00, 2, '2023-01-14 09:31:39'),
(4, '434', 'fsgd', 2232.00, 2, '2023-01-14 15:28:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrative_users`
--
ALTER TABLE `Administrative_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mda`
--
ALTER TABLE `mda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `mda_users`
--
ALTER TABLE `mda_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_services`
--
ALTER TABLE `our_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payer_user`
--
ALTER TABLE `payer_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_2`
--
ALTER TABLE `payment_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_collection_report_individual`
--
ALTER TABLE `payment_collection_report_individual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_form_labels`
--
ALTER TABLE `payment_form_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_payment_list`
--
ALTER TABLE `pending_payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenue_heads`
--
ALTER TABLE `revenue_heads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenue_heads1`
--
ALTER TABLE `revenue_heads1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Administrative_users`
--
ALTER TABLE `Administrative_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=550;

--
-- AUTO_INCREMENT for table `mda`
--
ALTER TABLE `mda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `mda_users`
--
ALTER TABLE `mda_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `our_services`
--
ALTER TABLE `our_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payer_user`
--
ALTER TABLE `payer_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_2`
--
ALTER TABLE `payment_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_collection_report_individual`
--
ALTER TABLE `payment_collection_report_individual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_form_labels`
--
ALTER TABLE `payment_form_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pending_payment_list`
--
ALTER TABLE `pending_payment_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `revenue_heads`
--
ALTER TABLE `revenue_heads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `revenue_heads1`
--
ALTER TABLE `revenue_heads1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
