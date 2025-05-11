-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2025 at 03:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `habits`
--

CREATE TABLE `habits` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(7) NOT NULL,
  `streak` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `habits`
--

INSERT INTO `habits` (`id`, `name`, `color`, `streak`) VALUES
(20, 'singing', '#c4b4fd', '[{\"name\":\"January\",\"streak\":[{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{
\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{
\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]}
,{\"name\":\"February\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},
{\"marked\":false},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{
\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":true}]},{\"name\":\"March\",\"streak\":[{\"marked\":true},{\"marked\":true},{\"marked\":true},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"April\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"May\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"June\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"July\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"August\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"September\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"October\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"November\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]},{\"name\":\"December\",\"streak\":[{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false},{\"marked\":false}]}]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `habits`
--
ALTER TABLE `habits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
