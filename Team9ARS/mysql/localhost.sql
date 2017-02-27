-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2017 at 05:18 PM
-- Server version: 5.6.31
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ARS`
--

-- --------------------------------------------------------

--
-- Table structure for table `loginAttempts`
--

CREATE TABLE IF NOT EXISTS `loginAttempts` (
  `userID` varchar(1000) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginAttempts`
--

INSERT INTO `loginAttempts` (`userID`, `time`) VALUES
('4', '2017-02-27 16:23:18'),
('4', '2017-02-27 16:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `loginCredentials`
--

CREATE TABLE IF NOT EXISTS `loginCredentials` (
  `id` int(11) NOT NULL,
  `EmailAddress` varchar(1000) NOT NULL,
  `AccountType` enum('Admin','Manager','Customer') NOT NULL DEFAULT 'Customer',
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginCredentials`
--

INSERT INTO `loginCredentials` (`id`, `EmailAddress`, `AccountType`, `Password`) VALUES
(4, 'jbtessmann@gmail.com', 'Customer', '$2y$10$or8maTeUlyFpV6NZfTumGuLzTtJq6oewPWD7KsCiemWuHfU/mD0MO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
