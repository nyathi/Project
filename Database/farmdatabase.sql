-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 10, 2013 at 02:50 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `farmdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountdetails`
--

CREATE TABLE IF NOT EXISTS `accountdetails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(13) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accountdetails`
--

INSERT INTO `accountdetails` (`ID`, `id_number`) VALUES
(1, '8903216097086');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `IdNumber` varchar(20) NOT NULL,
  `AccountNumber` varchar(30) NOT NULL,
  `AccountType` varchar(20) NOT NULL,
  `BankName` varchar(25) NOT NULL,
  `Balance` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`IdNumber`, `AccountNumber`, `AccountType`, `BankName`, `Balance`) VALUES
('123456789', '123456', 'Saving', 'Absa Bank', 152000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `telephone` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `customer_id`, `name`, `telephone`, `email`, `gender`, `address`, `userName`, `password`) VALUES
(10, '8903216097086', 'justice', '0760742045', 'justice.nyathi@yahoo.com', 'justice', 'p.o box 302\r\nkhokhovela\r\n1367', 'nyathi', 'elton89@'),
(11, '6901026097086', 'sinnah', '0765970204', 'sinnah@gmail.com', 'sinnah', 'p.o box 302\r\nkhokhovela\r\n1367', 'ndlovu', 'elton89@');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `IdNumber` varchar(14) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `Username`, `IdNumber`, `Password`, `Role`) VALUES
(1, 'lo', '123456789', '123', 'User'),
(2, 'just', '8903216097086', '1234', 'Admin'),
(3, 'lac', '123456789', '6543', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(300) NOT NULL,
  `itemPrice` double NOT NULL,
  `numberOfItems` int(11) NOT NULL,
  `itemType` varchar(300) NOT NULL,
  `imagePath` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `itemName`, `itemPrice`, `numberOfItems`, `itemType`, `imagePath`) VALUES
(2, 'Cabbages', 55, 10, 'Vegetable', 'images/imagesCA8XYFU1.jpg'),
(3, 'Tomatoes', 45, 5, 'Vegetable', 'images/tomatos1.jpg'),
(4, 'Potatoes', 35, 5, 'Vegetable', 'images/potatoes.jpg'),
(5, 'Spinach', 45, 12, 'Vegatable', 'images/spinach.jpg'),
(6, 'Corn crop', 50, 250, 'Fruit', 'images/fg.jpg'),
(7, 'White Beans', 35, 10, 'Vegetable', 'images/whiteBeans.jpg'),
(13, 'Strew berry', 8, 50, 'Fruit', 'images/strowbarry.jpg'),
(12, 'Water melon', 12, 15, 'Fruit', 'images/water Melon.jpg'),
(14, 'Green peppers', 2, 15, 'Vegetable', 'images/imagesCAYLSLIC.jpg'),
(15, 'Cattle', 4500, 200, 'Live stock', 'images/imagesCAYC3PYV.jpg'),
(16, 'Sheep', 3000, 10, 'Live stock', 'images/ship.jpg'),
(17, 'Pig', 2500, 45, 'Live stock', 'images/pig.jpg'),
(18, 'Chickens', 450, 100, 'Live stock', 'images/chick.jpg'),
(19, 'Goat', 650, 100, 'Live stock', 'images/goat.jpg'),
(20, 'sunflower', 85, 100, 'Vegetable', 'images/sunflower.bmp'),
(21, 'turky', 200, 150, 'Live stock', 'images/turky3.bmp'),
(22, 'Cheese', 200, 150, 'Live stock', 'images/cheese.bmp'),
(24, 'Milk', 200, 5000, 'Live stock', 'images/milky.jpg'),
(25, 'eggs', 200, 5000, 'Live stock', 'images/eggs.jpg'),
(26, 'Asparagus', 60, 100, 'Vegetable', 'images/asparagus.jpg'),
(27, 'beetroot', 60, 250, 'Vegetable', 'images/imagesCAQ3B0N9.jpg'),
(28, 'chicken', 56.9, 25, 'Live stock', 'images/imagesCA3C28P8.jpg'),
(29, '', 0, 0, '', ''),
(300, 'chicken broilers', 80, 25, 'Live stock', 'images/imagesCA1ILD84.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registerdb`
--

CREATE TABLE IF NOT EXISTS `registerdb` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `Surname` varchar(250) NOT NULL,
  `IdNumber` varchar(250) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Address` varchar(300) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Email` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `registerdb`
--

INSERT INTO `registerdb` (`ID`, `Name`, `Surname`, `IdNumber`, `Gender`, `Address`, `Contact`, `Email`) VALUES
(1, 'des', 'nloll', '123456789', 'Male', 'fgghfgfgh', '785722112', 'des@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `traceorder`
--

CREATE TABLE IF NOT EXISTS `traceorder` (
  `CustomerID` varchar(20) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Total` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `traceorder`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
