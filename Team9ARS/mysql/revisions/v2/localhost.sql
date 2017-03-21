-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 21, 2017 at 12:29 AM
-- Server version: 5.6.31
-- PHP Version: 5.6.25

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
('4', '2017-02-27 16:46:03'),
('5', '2017-03-06 17:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `loginCredentials`
--

CREATE TABLE IF NOT EXISTS `loginCredentials` (
  `id` int(11) NOT NULL,
  `EmailAddress` varchar(1000) NOT NULL,
  `AccountType` enum('Admin','Manager','Customer') NOT NULL DEFAULT 'Customer',
  `Password` varchar(1000) NOT NULL,
  `tempPassword` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginCredentials`
--

INSERT INTO `loginCredentials` (`id`, `EmailAddress`, `AccountType`, `Password`, `tempPassword`) VALUES
(5, 'jonathon-tessmann@uiowa.edu', 'Customer', '$2y$10$terPEwKP1Gcxz3zZgoR7yO2vpt93FJJTRGznE1AcDhP4x7KFLDW/e', 0),
(18, 'jbtessmann@gmail.com', 'Admin', '$2y$10$lz6MOaGzu8hk6d4TlTXOV.xKH785De0PQVJc1u9dcc5tFCTk1fWaq', 0),
(25, 'jtessmanntest@gmail.com', 'Manager', '$2y$10$2.wgCTxiq/EGwg/ZSJ6FjeNIMFIaXc.Y1OcVUcRqB.q7UiiRdHWj6', 0),
(26, 'testperson@gmail.com', 'Admin', '$2y$10$OApM75Ba1iwOpHZHe3BtG.9r607x0RuM2ExBwW/6RT2uC9EjxvBVa', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
