-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 12:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_admission`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `parentContact` varchar(50) DEFAULT NULL,
  `reasonForAdmission` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`id`, `name`, `age`, `grade`, `parentContact`, `reasonForAdmission`) VALUES
(9, 'Boby', 23, 'A', '7834998131', 'Job'),
(10, 'Rohan', 21, 'A', '7834998131', 'Job'),
(11, 'Boby Singh', 32, 'B', '7834998131', 'Work'),
(12, 'Boby ', 22, 'B', '7834998131', 'test'),
(13, 'Sachin', 34, 'c', '7834998131', 'job'),
(14, 'Boby kumar gautam', 43, 'B', '7834998131', 'Job'),
(15, 'Boby ', 22, 'B', '78349981312233', 'Job'),
(16, 'Boby umar', 33, 'A', '9811617517', 'test'),
(17, 'Shalu fagna', 29, 'A', '7834998131', 'Job'),
(18, 'Shweta', 26, 'B', '7834998131', 'Job');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
