-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2017 at 09:32 PM
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
-- Table structure for table `aircraft`
--

CREATE TABLE IF NOT EXISTS `aircraft` (
  `number` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `purchase date` date NOT NULL,
  `last service date` date NOT NULL,
  `model` char(20) NOT NULL,
  `manufacturer` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aircrafts`
--

CREATE TABLE IF NOT EXISTS `aircrafts` (
  `aircraftID` int(255) NOT NULL,
  `model` varchar(20) NOT NULL,
  `capacity` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircrafts`
--

INSERT INTO `aircrafts` (`aircraftID`, `model`, `capacity`) VALUES
(1, 'Boeing 747', 467),
(2, 'Boeing 717', 134),
(3, 'ModelJT', 257),
(4, 'Douglas DC-3', 32),
(5, 'Douglas DC-3', 24);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL,
  `first name` char(30) NOT NULL,
  `last name` char(30) NOT NULL,
  `phone number` int(11) NOT NULL,
  `date of birth` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
  `id` int(11) NOT NULL,
  `number` char(6) NOT NULL,
  `aircraft` int(11) NOT NULL,
  `departing airport` char(3) NOT NULL,
  `arrival airport` char(3) NOT NULL,
  `departure date` date NOT NULL,
  `departure time` time NOT NULL,
  `arrival date` date NOT NULL,
  `arrival time` time NOT NULL,
  `flight time` time NOT NULL,
  `number Passengers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('5', '2017-03-06 17:08:02'),
('18', '2017-03-27 20:54:52'),
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
  `Password` varchar(1000) NOT NULL,
  `tempPassword` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginCredentials`
--

INSERT INTO `loginCredentials` (`id`, `EmailAddress`, `AccountType`, `Password`, `tempPassword`) VALUES
(5, 'jonathon-tessmann@uiowa.edu', 'Customer', '$2y$10$terPEwKP1Gcxz3zZgoR7yO2vpt93FJJTRGznE1AcDhP4x7KFLDW/e', 0),
(18, 'jbtessmann@gmail.com', 'Admin', '$2y$10$lz6MOaGzu8hk6d4TlTXOV.xKH785De0PQVJc1u9dcc5tFCTk1fWaq', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD PRIMARY KEY (`aircraftID`);

--
-- Indexes for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircrafts`
--
ALTER TABLE `aircrafts`
  MODIFY `aircraftID` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
