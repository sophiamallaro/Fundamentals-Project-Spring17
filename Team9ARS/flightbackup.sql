-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 26, 2017 at 09:34 PM
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
-- Table structure for table `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
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
  `aircraftID` int(255) NOT NULL,
  `uniqueID` int(255) NOT NULL,
  `number` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`source`, `destination`, `ddate`, `adate`, `firstClass`, `economy`, `dtime`, `atime`, `frequency`, `fcPrice`, `ePrice`, `aircraftID`, `uniqueID`, `number`) VALUES
('CID', 'ATL', '2017-04-17', '2017-04-17', 1, 4, '13:00:00', '16:00:00', 0, 300, 250, 1, 1, ''),
('CID', 'ATL', '2017-04-17', '2017-04-17', 1, 2, '09:00:00', '11:00:00', 0, 500, 100, 1, 2, ''),
('ORD', 'SFO', '2017-04-27', '2017-04-28', 1, 0, '15:00:00', '02:00:00', 0, 798, 456, 2, 3, ''),
('CID', 'JFK', '2017-04-11', '2017-04-11', 0, 0, '06:00:00', '11:00:00', 0, 345, 23, 4, 4, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`uniqueID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `uniqueID` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
