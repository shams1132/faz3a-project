-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15 أكتوبر 2026 الساعة 20:27
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faz3a_db`
--

-- --------------------------------------------------------

--
-- بنية الجدول `donor`
--

CREATE TABLE `donor` (
  `Donor_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Blood_Type` varchar(10) NOT NULL,
  `Last_Donation_Date` date DEFAULT NULL,
  `Eligibility_Status` varchar(50) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `donor`
--

INSERT INTO `donor` (`Donor_ID`, `Name`, `Phone`, `Blood_Type`, `Last_Donation_Date`, `Eligibility_Status`, `Location_ID`) VALUES
(1, 'أحمد خالد إبراهيم', '0591234567', 'O+', '2026-01-15', 'Eligible', 1),
(2, 'سارة محمود علي', '0569876543', 'A+', '2025-11-20', 'Eligible', 2),
(3, 'محمد عبد الله حسن', '0598765432', 'B+', '2026-02-10', 'Eligible', 3),
(4, 'ريم أحمد قاسم', '0561122334', 'AB+', '2025-08-05', 'Eligible', 4),
(5, 'عمر فاروق أحمد', '0593344556', 'O-', '2026-03-01', 'Eligible', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `emergency_request`
--

CREATE TABLE `emergency_request` (
  `Request_ID` int(11) NOT NULL,
  `Blood_Type` varchar(10) NOT NULL,
  `Hospital_Name` varchar(100) NOT NULL,
  `Units_Needed` int(11) NOT NULL,
  `Contact_Phone` varchar(20) NOT NULL,
  `Status` varchar(20) DEFAULT 'Active',
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `emergency_request`
--

INSERT INTO `emergency_request` (`Request_ID`, `Blood_Type`, `Hospital_Name`, `Units_Needed`, `Contact_Phone`, `Status`, `Created_At`) VALUES
(1, 'O+', 'مستشفى ابن سينا التخصصي - جنين', 2, '0591234567', 'Pending', '2026-10-13 11:30:51'),
(2, 'A-', 'جنين - الحي الشرقي', 3, '0569876543', 'Approved', '2026-10-13 11:30:51');

-- --------------------------------------------------------

--
-- بنية الجدول `location`
--

CREATE TABLE `location` (
  `Location_ID` int(11) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `location`
--

INSERT INTO `location` (`Location_ID`, `Address`, `Latitude`, `Longitude`) VALUES
(1, 'مستشفى ابن سينا التخصصي - جنين', 32.46280000, 35.29510000),
(2, 'جنين - الحي الشرقي', 32.46120000, 35.29880000),
(3, 'جنين - حي الزهراء', 32.45800000, 35.29100000),
(4, 'قباطية - المركز', 32.41100000, 35.28150000),
(5, 'قباطية - الحي الغربي', 32.40850000, 35.27500000),
(6, 'برقين - الشارع الرئيسي', 32.43600000, 35.26100000),
(7, 'قباطية - مخرج البلدة', 32.41500000, 35.28600000),
(8, 'كفر دان - الشارع الرئيسي', 32.48200000, 35.24800000),
(9, 'برقين - وسط البلد', 32.43400000, 35.25800000),
(10, 'جنين - الشارع العسكري', 32.46450000, 35.29300000),
(11, 'قباطية - حارة الكميل', 32.41250000, 35.28300000),
(12, 'يعبد - الحي الجنوبي', 32.44600000, 35.16900000),
(13, 'جنين - شارع الناصرة', 32.46800000, 35.30100000),
(14, 'يعبد - الشارع الرئيسي', 32.44350000, 35.16700000),
(15, 'جنين - حي الجابريات', 32.45300000, 35.28800000),
(16, 'جنين - مخيم جنين', 32.46050000, 35.28650000),
(17, 'كفر دان - المرج', 32.48500000, 35.25100000),
(18, 'يعبد - حي القعدة', 32.44800000, 35.17200000),
(19, 'جنين - شارع حيفا', 32.46600000, 35.28900000),
(20, 'السيلة الحارثية', 32.49200000, 35.23400000),
(21, 'الزبابدة - الحي الشمالي', 32.38330000, 35.33330000);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`User_ID`, `Name`, `Email`, `Password`, `Created_At`) VALUES
(1, 'شمس', 'shams@faz3a.com', '123456', '2026-10-13 11:28:00'),
(2, 'جميلة', 'jamila@faz3a.com', '123456', '2026-10-13 11:28:00'),
(3, 'آية', 'aya@faz3a.com', '123456', '2026-10-13 11:28:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`Donor_ID`);

--
-- Indexes for table `emergency_request`
--
ALTER TABLE `emergency_request`
  ADD PRIMARY KEY (`Request_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `Donor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emergency_request`
--
ALTER TABLE `emergency_request`
  MODIFY `Request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
