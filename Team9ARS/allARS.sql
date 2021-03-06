-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 26, 2017 at 09:46 PM
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
  `econCapacity` int(255) NOT NULL,
  `firstClassCapacity` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircrafts`
--

INSERT INTO `aircrafts` (`aircraftID`, `model`, `econCapacity`, `firstClassCapacity`) VALUES
(1, 'Boeing 747', 467, 534),
(2, 'Boeing 717', 134, 234),
(3, 'ModelJT', 257, 345),
(4, 'Douglas DC-3', 32, 22),
(5, 'testCraft', 785, 455),
(6, 'Boeing565', 234, 543);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `bookingID` int(255) NOT NULL,
  `accountID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `flightID` varchar(255) NOT NULL,
  `ticketID` int(255) NOT NULL,
  `class` enum('Economy','First Class','','') NOT NULL,
  `Cancellation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bookingID`, `accountID`, `name`, `flightID`, `ticketID`, `class`, `Cancellation`) VALUES
(12, 'jtessmanntest@gmail.com', 'Jonathon Tessmann', 'IA2', 0, 'Economy', 0),
(13, 'jtessmanntest@gmail.com', 'sophie', 'IA1', 0, 'Economy', 0),
(14, 'jtessmanntest@gmail.com', 'Delene Tessmann', 'IA1', 0, 'Economy', 0),
(17, 'jbtessmann@gmail.com', 'Nephew', 'IA3', 0, 'Economy', 0),
(18, 'jtessmanntest@gmail.com', 'Sister', 'IA1', 0, 'Economy', 0),
(19, 'jtessmanntest@gmail.com', 'test', 'IA3', 0, 'Economy', 0),
(20, 'jtessmanntest@gmail.com', 'test', 'IA3', 0, 'Economy', 0),
(21, 'jtessmanntest@gmail.com', 'Jon T.', 'IA2', 0, 'First Class', 0),
(22, 'jonathon-tessmann@uiowa.edu', 'Jon Tessmann', 'IA6', 0, 'Economy', 0),
(23, 'jtessmanntest@gmail.com', 'Jonathon Tessmann', 'IA2', 0, 'Economy', 0),
(24, 'jtessmanntest@gmail.com', 'Jon', 'IA1', 0, 'Economy', 0),
(25, 'jtessmanntest@gmail.com', 'Jon', 'IA1', 0, 'Economy', 0),
(26, 'jtessmanntest@gmail.com', 'Jon', 'IA1', 0, 'Economy', 0),
(27, 'jtessmanntest@gmail.com', 'JonT', 'IA1', 0, 'Economy', 0),
(28, 'jtessmanntest@gmail.com', 'JonT', 'IA1', 0, 'Economy', 0),
(29, 'jtessmanntest@gmail.com', 'JonT', 'IA1', 0, 'Economy', 0),
(30, 'jtessmanntest@gmail.com', 'JonT', 'IA1', 0, 'Economy', 0),
(31, 'jtessmanntest@gmail.com', 'JonT', 'IA1', 0, 'Economy', 0),
(32, 'jtessmanntest@gmail.com', 'Bozo', 'IA1', 0, 'Economy', 0),
(33, 'jtessmanntest@gmail.com', 'foobar', 'IA1', 0, 'First Class', 0),
(34, 'jtessmanntest@gmail.com', 'foobarer', 'IA2', 0, 'Economy', 0),
(35, 'jtessmanntest@gmail.com', 'tessyTess', 'IA3', 0, 'First Class', 1),
(36, 'jonathon-tessmann@uiowa.edu', 'sfsdfdgadf', 'IA2', 0, 'Economy', 0),
(37, '', '', 'IA2', 0, 'First Class', 1),
(38, 'jtessmanntest@gmail.com', 'Jonathon Brody Tessmann', 'IA1', 0, 'First Class', 0);

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
-- Table structure for table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `number` varchar(8) NOT NULL,
  `source` varchar(3) NOT NULL,
  `destination` varchar(8) NOT NULL,
  `ddate` date NOT NULL,
  `adate` date NOT NULL,
  `firstClass` int(11) NOT NULL,
  `economy` int(11) NOT NULL,
  `dtime` time NOT NULL,
  `atime` time NOT NULL,
  `frequency` int(11) NOT NULL,
  `fcPrice` int(11) NOT NULL,
  `ePrice` int(11) NOT NULL,
  `aircraftID` int(11) NOT NULL,
  `uniqueID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`number`, `source`, `destination`, `ddate`, `adate`, `firstClass`, `economy`, `dtime`, `atime`, `frequency`, `fcPrice`, `ePrice`, `aircraftID`, `uniqueID`) VALUES
('IA1', 'CID', 'ATL', '2017-05-01', '2017-05-01', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 185),
('IA1', 'CID', 'ATL', '2017-05-08', '2017-05-08', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 186),
('IA1', 'CID', 'ATL', '2017-05-15', '2017-05-15', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 187),
('IA1', 'CID', 'ATL', '2017-05-22', '2017-05-22', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 188),
('IA1', 'CID', 'ATL', '2017-05-29', '2017-05-29', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 189),
('IA1', 'CID', 'ATL', '2017-06-05', '2017-06-05', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 190),
('IA1', 'CID', 'ATL', '2017-06-12', '2017-06-12', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 191),
('IA1', 'CID', 'ATL', '2017-06-19', '2017-06-19', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 192),
('IA1', 'CID', 'ATL', '2017-06-26', '2017-06-26', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 193),
('IA1', 'CID', 'ATL', '2017-07-03', '2017-07-03', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 194),
('IA1', 'CID', 'ATL', '2017-07-10', '2017-07-10', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 195),
('IA1', 'CID', 'ATL', '2017-07-17', '2017-07-17', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 196),
('IA1', 'CID', 'ATL', '2017-07-24', '2017-07-24', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 197),
('IA1', 'CID', 'ATL', '2017-07-31', '2017-07-31', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 198),
('IA1', 'CID', 'ATL', '2017-08-07', '2017-08-07', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 199),
('IA1', 'CID', 'ATL', '2017-08-14', '2017-08-14', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 200),
('IA1', 'CID', 'ATL', '2017-08-21', '2017-08-21', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 201),
('IA1', 'CID', 'ATL', '2017-08-28', '2017-08-28', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 202),
('IA1', 'CID', 'ATL', '2017-09-04', '2017-09-04', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 203),
('IA1', 'CID', 'ATL', '2017-09-11', '2017-09-11', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 204),
('IA1', 'CID', 'ATL', '2017-09-18', '2017-09-18', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 205),
('IA1', 'CID', 'ATL', '2017-09-25', '2017-09-25', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 206),
('IA1', 'CID', 'ATL', '2017-10-02', '2017-10-02', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 207),
('IA1', 'CID', 'ATL', '2017-10-09', '2017-10-09', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 208),
('IA1', 'CID', 'ATL', '2017-10-16', '2017-10-16', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 209),
('IA1', 'CID', 'ATL', '2017-10-23', '2017-10-23', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 210),
('IA1', 'CID', 'ATL', '2017-10-30', '2017-10-30', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 211),
('IA1', 'CID', 'ATL', '2017-11-06', '2017-11-06', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 212),
('IA1', 'CID', 'ATL', '2017-11-13', '2017-11-13', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 213),
('IA1', 'CID', 'ATL', '2017-11-20', '2017-11-20', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 214),
('IA1', 'CID', 'ATL', '2017-11-27', '2017-11-27', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 215),
('IA1', 'CID', 'ATL', '2017-12-04', '2017-12-04', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 216),
('IA1', 'CID', 'ATL', '2017-12-11', '2017-12-11', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 217),
('IA1', 'CID', 'ATL', '2017-12-18', '2017-12-18', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 218),
('IA1', 'CID', 'ATL', '2017-12-25', '2017-12-25', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 219),
('IA1', 'CID', 'ATL', '2018-01-01', '2018-01-01', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 220),
('IA1', 'CID', 'ATL', '2018-01-08', '2018-01-08', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 221),
('IA1', 'CID', 'ATL', '2018-01-15', '2018-01-15', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 222),
('IA1', 'CID', 'ATL', '2018-01-22', '2018-01-22', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 223),
('IA1', 'CID', 'ATL', '2018-01-29', '2018-01-29', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 224),
('IA1', 'CID', 'ATL', '2018-02-05', '2018-02-05', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 225),
('IA1', 'CID', 'ATL', '2018-02-12', '2018-02-12', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 226),
('IA1', 'CID', 'ATL', '2018-02-19', '2018-02-19', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 227),
('IA1', 'CID', 'ATL', '2018-02-26', '2018-02-26', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 228),
('IA1', 'CID', 'ATL', '2018-03-05', '2018-03-05', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 229),
('IA1', 'CID', 'ATL', '2018-03-12', '2018-03-12', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 230),
('IA1', 'CID', 'ATL', '2018-03-19', '2018-03-19', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 231),
('IA1', 'CID', 'ATL', '2018-03-26', '2018-03-26', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 232),
('IA1', 'CID', 'ATL', '2018-04-02', '2018-04-02', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 233),
('IA1', 'CID', 'ATL', '2018-04-09', '2018-04-09', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 234),
('IA1', 'CID', 'ATL', '2018-04-16', '2018-04-16', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 235),
('IA1', 'CID', 'ATL', '2018-04-23', '2018-04-23', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 236),
('IA1', 'CID', 'ATL', '2018-04-30', '2018-04-30', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 237),
('IA1', 'CID', 'ATL', '2018-05-07', '2018-05-07', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 238),
('IA1', 'CID', 'ATL', '2018-05-14', '2018-05-14', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 239),
('IA1', 'CID', 'ATL', '2018-05-21', '2018-05-21', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 240),
('IA1', 'CID', 'ATL', '2018-05-28', '2018-05-28', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 241),
('IA1', 'CID', 'ATL', '2018-06-04', '2018-06-04', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 242),
('IA1', 'CID', 'ATL', '2018-06-11', '2018-06-11', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 243),
('IA1', 'CID', 'ATL', '2018-06-18', '2018-06-18', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 244),
('IA1', 'CID', 'ATL', '2018-06-25', '2018-06-25', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 245),
('IA1', 'CID', 'ATL', '2018-07-02', '2018-07-02', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 246),
('IA1', 'CID', 'ATL', '2018-07-09', '2018-07-09', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 247),
('IA1', 'CID', 'ATL', '2018-07-16', '2018-07-16', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 248),
('IA1', 'CID', 'ATL', '2018-07-23', '2018-07-23', 65, 0, '08:00:00', '11:00:00', 1, 500, 400, 1, 249),
('IA2', 'CID', 'ATL', '2017-05-01', '2017-05-01', 0, 0, '14:00:00', '18:00:00', 0, 400, 200, 1, 250),
('IA3', 'CID', 'JFK', '2017-05-01', '2017-05-01', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 251),
('IA3', 'CID', 'JFK', '2017-05-08', '2017-05-08', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 252),
('IA3', 'CID', 'JFK', '2017-05-15', '2017-05-15', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 253),
('IA3', 'CID', 'JFK', '2017-05-22', '2017-05-22', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 254),
('IA3', 'CID', 'JFK', '2017-05-29', '2017-05-29', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 255),
('IA3', 'CID', 'JFK', '2017-06-05', '2017-06-05', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 256),
('IA3', 'CID', 'JFK', '2017-06-12', '2017-06-12', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 257),
('IA3', 'CID', 'JFK', '2017-06-19', '2017-06-19', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 258),
('IA3', 'CID', 'JFK', '2017-06-26', '2017-06-26', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 259),
('IA3', 'CID', 'JFK', '2017-07-03', '2017-07-03', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 260),
('IA3', 'CID', 'JFK', '2017-07-10', '2017-07-10', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 261),
('IA3', 'CID', 'JFK', '2017-07-17', '2017-07-17', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 262),
('IA3', 'CID', 'JFK', '2017-07-24', '2017-07-24', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 263),
('IA3', 'CID', 'JFK', '2017-07-31', '2017-07-31', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 264),
('IA3', 'CID', 'JFK', '2017-08-07', '2017-08-07', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 265),
('IA3', 'CID', 'JFK', '2017-08-14', '2017-08-14', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 266),
('IA3', 'CID', 'JFK', '2017-08-21', '2017-08-21', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 267),
('IA3', 'CID', 'JFK', '2017-08-28', '2017-08-28', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 268),
('IA3', 'CID', 'JFK', '2017-09-04', '2017-09-04', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 269),
('IA3', 'CID', 'JFK', '2017-09-11', '2017-09-11', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 270),
('IA3', 'CID', 'JFK', '2017-09-18', '2017-09-18', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 271),
('IA3', 'CID', 'JFK', '2017-09-25', '2017-09-25', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 272),
('IA3', 'CID', 'JFK', '2017-10-02', '2017-10-02', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 273),
('IA3', 'CID', 'JFK', '2017-10-09', '2017-10-09', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 274),
('IA3', 'CID', 'JFK', '2017-10-16', '2017-10-16', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 275),
('IA3', 'CID', 'JFK', '2017-10-23', '2017-10-23', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 276),
('IA3', 'CID', 'JFK', '2017-10-30', '2017-10-30', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 277),
('IA3', 'CID', 'JFK', '2017-11-06', '2017-11-06', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 278),
('IA3', 'CID', 'JFK', '2017-11-13', '2017-11-13', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 279),
('IA3', 'CID', 'JFK', '2017-11-20', '2017-11-20', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 280),
('IA3', 'CID', 'JFK', '2017-11-27', '2017-11-27', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 281),
('IA3', 'CID', 'JFK', '2017-12-04', '2017-12-04', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 282),
('IA3', 'CID', 'JFK', '2017-12-11', '2017-12-11', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 283),
('IA3', 'CID', 'JFK', '2017-12-18', '2017-12-18', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 284),
('IA3', 'CID', 'JFK', '2017-12-25', '2017-12-25', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 285),
('IA3', 'CID', 'JFK', '2018-01-01', '2018-01-01', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 286),
('IA3', 'CID', 'JFK', '2018-01-08', '2018-01-08', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 287),
('IA3', 'CID', 'JFK', '2018-01-15', '2018-01-15', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 288),
('IA3', 'CID', 'JFK', '2018-01-22', '2018-01-22', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 289),
('IA3', 'CID', 'JFK', '2018-01-29', '2018-01-29', 0, 0, '06:00:00', '08:00:00', 1, 700, 500, 1, 290),
('IA4', 'JFK', 'ATL', '2017-05-01', '2017-05-01', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 291),
('IA4', 'JFK', 'ATL', '2017-05-08', '2017-05-08', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 292),
('IA4', 'JFK', 'ATL', '2017-05-15', '2017-05-15', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 293),
('IA4', 'JFK', 'ATL', '2017-05-22', '2017-05-22', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 294),
('IA4', 'JFK', 'ATL', '2017-05-29', '2017-05-29', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 295),
('IA4', 'JFK', 'ATL', '2017-06-05', '2017-06-05', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 296),
('IA4', 'JFK', 'ATL', '2017-06-12', '2017-06-12', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 297),
('IA4', 'JFK', 'ATL', '2017-06-19', '2017-06-19', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 298),
('IA4', 'JFK', 'ATL', '2017-06-26', '2017-06-26', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 299),
('IA4', 'JFK', 'ATL', '2017-07-03', '2017-07-03', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 300),
('IA4', 'JFK', 'ATL', '2017-07-10', '2017-07-10', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 301),
('IA4', 'JFK', 'ATL', '2017-07-17', '2017-07-17', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 302),
('IA4', 'JFK', 'ATL', '2017-07-24', '2017-07-24', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 303),
('IA4', 'JFK', 'ATL', '2017-07-31', '2017-07-31', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 304),
('IA4', 'JFK', 'ATL', '2017-08-07', '2017-08-07', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 305),
('IA4', 'JFK', 'ATL', '2017-08-14', '2017-08-14', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 306),
('IA4', 'JFK', 'ATL', '2017-08-21', '2017-08-21', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 307),
('IA4', 'JFK', 'ATL', '2017-08-28', '2017-08-28', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 308),
('IA4', 'JFK', 'ATL', '2017-09-04', '2017-09-04', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 309),
('IA4', 'JFK', 'ATL', '2017-09-11', '2017-09-11', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 310),
('IA4', 'JFK', 'ATL', '2017-09-18', '2017-09-18', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 311),
('IA4', 'JFK', 'ATL', '2017-09-25', '2017-09-25', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 312),
('IA4', 'JFK', 'ATL', '2017-10-02', '2017-10-02', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 313),
('IA4', 'JFK', 'ATL', '2017-10-09', '2017-10-09', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 314),
('IA4', 'JFK', 'ATL', '2017-10-16', '2017-10-16', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 315),
('IA4', 'JFK', 'ATL', '2017-10-23', '2017-10-23', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 316),
('IA4', 'JFK', 'ATL', '2017-10-30', '2017-10-30', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 317),
('IA4', 'JFK', 'ATL', '2017-11-06', '2017-11-06', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 318),
('IA4', 'JFK', 'ATL', '2017-11-13', '2017-11-13', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 319),
('IA4', 'JFK', 'ATL', '2017-11-20', '2017-11-20', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 320),
('IA4', 'JFK', 'ATL', '2017-11-27', '2017-11-27', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 321),
('IA4', 'JFK', 'ATL', '2017-12-04', '2017-12-04', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 322),
('IA4', 'JFK', 'ATL', '2017-12-11', '2017-12-11', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 323),
('IA4', 'JFK', 'ATL', '2017-12-18', '2017-12-18', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 324),
('IA4', 'JFK', 'ATL', '2017-12-25', '2017-12-25', 0, 0, '18:00:00', '20:00:00', 1, 300, 200, 1, 325),
('IA6', 'ATL', 'CID', '2017-05-03', '2017-05-03', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 326),
('IA6', 'ATL', 'CID', '2017-05-10', '2017-05-10', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 327),
('IA6', 'ATL', 'CID', '2017-05-17', '2017-05-17', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 328),
('IA6', 'ATL', 'CID', '2017-05-24', '2017-05-24', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 329),
('IA6', 'ATL', 'CID', '2017-05-31', '2017-05-31', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 330),
('IA6', 'ATL', 'CID', '2017-06-07', '2017-06-07', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 331),
('IA6', 'ATL', 'CID', '2017-06-14', '2017-06-14', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 332),
('IA6', 'ATL', 'CID', '2017-06-21', '2017-06-21', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 333),
('IA6', 'ATL', 'CID', '2017-06-28', '2017-06-28', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 334),
('IA6', 'ATL', 'CID', '2017-07-05', '2017-07-05', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 335),
('IA6', 'ATL', 'CID', '2017-07-12', '2017-07-12', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 336),
('IA6', 'ATL', 'CID', '2017-07-19', '2017-07-19', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 337),
('IA6', 'ATL', 'CID', '2017-07-26', '2017-07-26', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 338),
('IA6', 'ATL', 'CID', '2017-08-02', '2017-08-02', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 339),
('IA6', 'ATL', 'CID', '2017-08-09', '2017-08-09', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 340),
('IA6', 'ATL', 'CID', '2017-08-16', '2017-08-16', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 341),
('IA6', 'ATL', 'CID', '2017-08-23', '2017-08-23', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 342),
('IA6', 'ATL', 'CID', '2017-08-30', '2017-08-30', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 343),
('IA6', 'ATL', 'CID', '2017-09-06', '2017-09-06', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 344),
('IA6', 'ATL', 'CID', '2017-09-13', '2017-09-13', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 345),
('IA6', 'ATL', 'CID', '2017-09-20', '2017-09-20', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 346),
('IA6', 'ATL', 'CID', '2017-09-27', '2017-09-27', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 347),
('IA6', 'ATL', 'CID', '2017-10-04', '2017-10-04', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 348),
('IA6', 'ATL', 'CID', '2017-10-11', '2017-10-11', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 349),
('IA6', 'ATL', 'CID', '2017-10-18', '2017-10-18', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 350),
('IA6', 'ATL', 'CID', '2017-10-25', '2017-10-25', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 351),
('IA6', 'ATL', 'CID', '2017-11-01', '2017-11-01', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 352),
('IA6', 'ATL', 'CID', '2017-11-08', '2017-11-08', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 353),
('IA6', 'ATL', 'CID', '2017-11-15', '2017-11-15', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 354),
('IA6', 'ATL', 'CID', '2017-11-22', '2017-11-22', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 355),
('IA6', 'ATL', 'CID', '2017-11-29', '2017-11-29', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 356),
('IA6', 'ATL', 'CID', '2017-12-06', '2017-12-06', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 357),
('IA6', 'ATL', 'CID', '2017-12-13', '2017-12-13', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 358),
('IA6', 'ATL', 'CID', '2017-12-20', '2017-12-20', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 359),
('IA6', 'ATL', 'CID', '2017-12-27', '2017-12-27', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 360),
('IA6', 'ATL', 'CID', '2018-01-03', '2018-01-03', 0, 0, '06:00:00', '09:00:00', 1, 500, 200, 1, 361),
('IA7', 'ATL', 'SFO', '2017-05-03', '2017-05-03', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 362),
('IA7', 'ATL', 'SFO', '2017-05-10', '2017-05-10', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 363),
('IA7', 'ATL', 'SFO', '2017-05-17', '2017-05-17', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 364),
('IA7', 'ATL', 'SFO', '2017-05-24', '2017-05-24', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 365),
('IA7', 'ATL', 'SFO', '2017-05-31', '2017-05-31', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 366),
('IA7', 'ATL', 'SFO', '2017-06-07', '2017-06-07', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 367),
('IA7', 'ATL', 'SFO', '2017-06-14', '2017-06-14', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 368),
('IA7', 'ATL', 'SFO', '2017-06-21', '2017-06-21', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 369),
('IA7', 'ATL', 'SFO', '2017-06-28', '2017-06-28', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 370),
('IA7', 'ATL', 'SFO', '2017-07-05', '2017-07-05', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 371),
('IA7', 'ATL', 'SFO', '2017-07-12', '2017-07-12', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 372),
('IA7', 'ATL', 'SFO', '2017-07-19', '2017-07-19', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 373),
('IA7', 'ATL', 'SFO', '2017-07-26', '2017-07-26', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 374),
('IA7', 'ATL', 'SFO', '2017-08-02', '2017-08-02', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 375),
('IA7', 'ATL', 'SFO', '2017-08-09', '2017-08-09', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 376),
('IA7', 'ATL', 'SFO', '2017-08-16', '2017-08-16', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 377),
('IA7', 'ATL', 'SFO', '2017-08-23', '2017-08-23', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 378),
('IA7', 'ATL', 'SFO', '2017-08-30', '2017-08-30', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 379),
('IA7', 'ATL', 'SFO', '2017-09-06', '2017-09-06', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 380),
('IA7', 'ATL', 'SFO', '2017-09-13', '2017-09-13', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 381),
('IA7', 'ATL', 'SFO', '2017-09-20', '2017-09-20', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 382),
('IA7', 'ATL', 'SFO', '2017-09-27', '2017-09-27', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 383),
('IA7', 'ATL', 'SFO', '2017-10-04', '2017-10-04', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 384),
('IA7', 'ATL', 'SFO', '2017-10-11', '2017-10-11', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 385),
('IA7', 'ATL', 'SFO', '2017-10-18', '2017-10-18', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 386),
('IA7', 'ATL', 'SFO', '2017-10-25', '2017-10-25', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 387),
('IA7', 'ATL', 'SFO', '2017-11-01', '2017-11-01', 0, 0, '07:00:00', '08:00:00', 1, 800, 600, 1, 388),
('IA9', 'SFO', 'CID', '2017-05-03', '2017-05-03', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 389),
('IA9', 'SFO', 'CID', '2017-05-10', '2017-05-10', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 390),
('IA9', 'SFO', 'CID', '2017-05-17', '2017-05-17', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 391),
('IA9', 'SFO', 'CID', '2017-05-24', '2017-05-24', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 392),
('IA9', 'SFO', 'CID', '2017-05-31', '2017-05-31', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 393),
('IA9', 'SFO', 'CID', '2017-06-07', '2017-06-07', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 394),
('IA9', 'SFO', 'CID', '2017-06-14', '2017-06-14', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 395),
('IA9', 'SFO', 'CID', '2017-06-21', '2017-06-21', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 396),
('IA9', 'SFO', 'CID', '2017-06-28', '2017-06-28', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 397),
('IA9', 'SFO', 'CID', '2017-07-05', '2017-07-05', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 398),
('IA9', 'SFO', 'CID', '2017-07-12', '2017-07-12', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 399),
('IA9', 'SFO', 'CID', '2017-07-19', '2017-07-19', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 400),
('IA9', 'SFO', 'CID', '2017-07-26', '2017-07-26', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 401),
('IA9', 'SFO', 'CID', '2017-08-02', '2017-08-02', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 402),
('IA9', 'SFO', 'CID', '2017-08-09', '2017-08-09', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 403),
('IA9', 'SFO', 'CID', '2017-08-16', '2017-08-16', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 404),
('IA9', 'SFO', 'CID', '2017-08-23', '2017-08-23', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 405),
('IA9', 'SFO', 'CID', '2017-08-30', '2017-08-30', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 406),
('IA9', 'SFO', 'CID', '2017-09-06', '2017-09-06', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 407),
('IA9', 'SFO', 'CID', '2017-09-13', '2017-09-13', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 408),
('IA9', 'SFO', 'CID', '2017-09-20', '2017-09-20', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 409),
('IA9', 'SFO', 'CID', '2017-09-27', '2017-09-27', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 410),
('IA9', 'SFO', 'CID', '2017-10-04', '2017-10-04', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 411),
('IA9', 'SFO', 'CID', '2017-10-11', '2017-10-11', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 412),
('IA9', 'SFO', 'CID', '2017-10-18', '2017-10-18', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 413),
('IA9', 'SFO', 'CID', '2017-10-25', '2017-10-25', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 414),
('IA9', 'SFO', 'CID', '2017-11-01', '2017-11-01', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 415),
('IA9', 'SFO', 'CID', '2017-11-08', '2017-11-08', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 416),
('IA9', 'SFO', 'CID', '2017-11-15', '2017-11-15', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 417),
('IA9', 'SFO', 'CID', '2017-11-22', '2017-11-22', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 418),
('IA9', 'SFO', 'CID', '2017-11-29', '2017-11-29', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 419),
('IA9', 'SFO', 'CID', '2017-12-06', '2017-12-06', 0, 0, '20:00:00', '23:00:00', 1, 500, 400, 1, 420),
('IA10', 'JFK', 'SFO', '2017-05-03', '2017-05-03', 0, 0, '11:00:00', '20:00:00', 1, 342, 123, 2, 421),
('IA10', 'JFK', 'SFO', '2017-05-10', '2017-05-10', 0, 0, '11:00:00', '20:00:00', 1, 342, 123, 2, 422),
('IA10', 'JFK', 'SFO', '2017-05-17', '2017-05-17', 0, 0, '11:00:00', '20:00:00', 1, 342, 123, 2, 423),
('IA10', 'JFK', 'SFO', '2017-05-24', '2017-05-24', 0, 0, '11:00:00', '20:00:00', 1, 342, 123, 2, 424);

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
('4', '2017-02-27 16:46:03'),
('18', '2017-04-10 02:32:07'),
('18', '2017-04-10 18:29:49'),
('18', '2017-04-17 19:32:45'),
('19', '2017-04-20 16:31:52'),
('19', '2017-04-24 16:56:17'),
('19', '2017-04-24 19:15:44'),
('5', '2017-04-24 19:18:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginCredentials`
--

INSERT INTO `loginCredentials` (`id`, `EmailAddress`, `AccountType`, `Password`, `tempPassword`) VALUES
(5, 'jonathon-tessmann@uiowa.edu', 'Manager', '$2y$10$terPEwKP1Gcxz3zZgoR7yO2vpt93FJJTRGznE1AcDhP4x7KFLDW/e', 0),
(18, 'jbtessmann@gmail.com', 'Admin', '$2y$10$lz6MOaGzu8hk6d4TlTXOV.xKH785De0PQVJc1u9dcc5tFCTk1fWaq', 0),
(19, 'jtessmanntest@gmail.com', 'Customer', '$2y$10$p4De/kDHNXmC857L6Jbu0eTUWlSGlsci1SBvRPIHc/.prwRQHgduu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reciepts`
--

CREATE TABLE IF NOT EXISTS `reciepts` (
  `recieptID` int(255) NOT NULL,
  `accountID` varchar(255) NOT NULL,
  `class` enum('Economy','First Class','','') NOT NULL,
  `price` int(255) NOT NULL,
  `purchaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reciepts`
--

INSERT INTO `reciepts` (`recieptID`, `accountID`, `class`, `price`, `purchaseDate`, `name`) VALUES
(4, 'jtessmanntest@gmail.com', 'Economy', 400, '2017-04-10 06:25:39', 'Jonathon Tessmann'),
(5, 'jtessmanntest@gmail.com', 'Economy', 250, '2017-04-10 06:32:15', 'sophie'),
(6, 'jtessmanntest@gmail.com', 'Economy', 250, '2017-04-10 18:29:26', 'Delene Tessmann'),
(7, 'jbtessmann@gmail.com', 'Economy', 456, '2017-04-10 18:59:28', 'Nephew'),
(8, 'jbtessmann@gmail.com', 'Economy', 456, '2017-04-10 19:02:49', 'Nephew'),
(9, 'jbtessmann@gmail.com', 'Economy', 456, '2017-04-10 19:03:25', 'Nephew'),
(10, 'jtessmanntest@gmail.com', 'Economy', 250, '2017-04-10 19:06:27', 'Sister'),
(12, 'jtessmanntest@gmail.com', 'Economy', 456, '2017-04-10 19:20:28', 'test'),
(13, 'jtessmanntest@gmail.com', 'First Class', 500, '2017-04-10 19:23:02', 'Jon T.'),
(14, 'jonathon-tessmann@uiowa.edu', 'Economy', 23, '2017-04-10 20:48:31', 'Jon Tessmann'),
(15, 'jtessmanntest@gmail.com', 'Economy', 100, '2017-04-10 21:26:45', 'Jonathon Tessmann'),
(16, 'jtessmanntest@gmail.com', 'Economy', 250, '2017-04-17 20:31:15', 'JonT'),
(17, 'jtessmanntest@gmail.com', 'Economy', 250, '2017-04-17 21:01:02', 'Bozo'),
(18, 'jtessmanntest@gmail.com', 'First Class', 300, '2017-04-20 16:44:12', 'foobar'),
(19, 'jtessmanntest@gmail.com', 'Economy', 100, '2017-04-20 16:49:14', 'foobarer'),
(20, 'jtessmanntest@gmail.com', 'First Class', 798, '2017-04-24 16:47:45', 'tessyTess'),
(21, 'jonathon-tessmann@uiowa.edu', 'Economy', 100, '2017-04-24 19:43:09', 'sfsdfdgadf'),
(22, '', 'First Class', 500, '2017-04-26 19:30:37', ''),
(23, 'jtessmanntest@gmail.com', 'First Class', 500, '2017-04-26 21:40:48', 'Jonathon Brody Tessmann');

-- --------------------------------------------------------

--
-- Table structure for table `seating`
--

CREATE TABLE IF NOT EXISTS `seating` (
  `number` int(255) NOT NULL,
  `flightID` varchar(255) NOT NULL,
  `bookingID` int(255) NOT NULL,
  `carryOn` int(255) NOT NULL,
  `numBags` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seating`
--

INSERT INTO `seating` (`number`, `flightID`, `bookingID`, `carryOn`, `numBags`) VALUES
(2, 'IA3', 35, 1, 5),
(3, 'IA2', 12, 0, 5),
(4, 'IA3', 17, 1, 2),
(5, 'IA3', 19, 1, 2),
(6, 'IA1', 14, 1, 5),
(7, 'IA3', 17, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD PRIMARY KEY (`aircraftID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`bookingID`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`uniqueID`);

--
-- Indexes for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reciepts`
--
ALTER TABLE `reciepts`
  ADD PRIMARY KEY (`recieptID`);

--
-- Indexes for table `seating`
--
ALTER TABLE `seating`
  ADD PRIMARY KEY (`number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircrafts`
--
ALTER TABLE `aircrafts`
  MODIFY `aircraftID` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `bookingID` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `uniqueID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=425;
--
-- AUTO_INCREMENT for table `loginCredentials`
--
ALTER TABLE `loginCredentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `reciepts`
--
ALTER TABLE `reciepts`
  MODIFY `recieptID` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `seating`
--
ALTER TABLE `seating`
  MODIFY `number` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
