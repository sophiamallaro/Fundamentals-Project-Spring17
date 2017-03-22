-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2017 at 09:36 PM
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
  `customer id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginCredentials`
--

INSERT INTO `loginCredentials` (`id`, `EmailAddress`, `AccountType`, `Password`, `customer id`) VALUES
(4, 'jbtessmann@gmail.com', 'Admin', '$2y$10$or8maTeUlyFpV6NZfTumGuLzTtJq6oewPWD7KsCiemWuHfU/mD0MO', 0),
(5, 'sophia-mallaro@uiowa.edu', 'Admin', '$2y$10$0.HarxInQIkIcldaL0PvfuZhfme8FSEvM8myKJJBbxho0mOk3vq5O', 0),
(6, 'sophiemallaro4@gmail.com', 'Customer', '$2y$10$va0J05PJySK1efusllFXpOvZ2jjXnWtqIh0e66OqY/JYSOlDbxBue', 0),
(7, 'hannah.l.mallaro@vanderbilt.edu', 'Customer', '$2y$10$gJZgLyXXwfgN8SzSzH384OB2IBFrBiTCaYULgDEfIETen3B1Lv5ru', 0),
(8, 'sophiem13@gmail.com', 'Customer', '$2y$10$cqpyLVaGMy.dCkvXULgHU.k1JCAk1/qzPNR7Ks6MpzBxla3zyHL/2', 0),
(9, 'sophiamallaro@gmail.com', 'Customer', '$2y$10$50GPDreFe2stg05Owd745uf15h6Yi59RmGS2GDGHSgTIlCQ8PgIFG', 0),
(10, 'mike.mallaro@vgm.com', 'Customer', '$2y$10$YOU/I/7/kBESi0wrEN0/aeT1dzDn9IXTBEZ0N5wWZsAUKUxwkxIUG', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL,
  `reservation num` char(10) NOT NULL,
  `customer` int(11) NOT NULL,
  `flight` int(11) NOT NULL,
  `number passengers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
