-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2017 at 04:02 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_ticket_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(25) NOT NULL,
  `c_contact` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `mo_id` int(11) NOT NULL,
  `mo_name` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie_show`
--

CREATE TABLE `movie_show` (
  `movie_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `show_ID` int(11) NOT NULL,
  `show_Time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE `screen` (
  `sc_id` int(11) NOT NULL,
  `sc_name` varchar(25) NOT NULL,
  `max_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `screen_has_seats`
--

CREATE TABLE `screen_has_seats` (
  `screen_ID` int(11) NOT NULL,
  `seat_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_ID` int(11) NOT NULL,
  `seat_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_foreign_key_name` (`customer_id`),
  ADD KEY `fk_foreign_key_name_movie` (`show_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `c_id` (`c_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`mo_id`);

--
-- Indexes for table `movie_show`
--
ALTER TABLE `movie_show`
  ADD PRIMARY KEY (`show_ID`),
  ADD KEY `fk_foreign_key_movie` (`movie_id`),
  ADD KEY `fk_foreign_key_screen` (`screen_id`);

--
-- Indexes for table `screen`
--
ALTER TABLE `screen`
  ADD PRIMARY KEY (`sc_id`);

--
-- Indexes for table `screen_has_seats`
--
ALTER TABLE `screen_has_seats`
  ADD KEY `fk_foreign_key_screen1` (`screen_ID`),
  ADD KEY `fk_foreign_key_seat` (`seat_ID`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_ID`),
  ADD UNIQUE KEY `seat_ID` (`seat_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_foreign_key_name` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `fk_foreign_key_name_movie` FOREIGN KEY (`show_id`) REFERENCES `movie_show` (`show_ID`);

--
-- Constraints for table `movie_show`
--
ALTER TABLE `movie_show`
  ADD CONSTRAINT `fk_foreign_key_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`mo_id`),
  ADD CONSTRAINT `fk_foreign_key_screen` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`sc_id`);

--
-- Constraints for table `screen_has_seats`
--
ALTER TABLE `screen_has_seats`
  ADD CONSTRAINT `fk_foreign_key_screen1` FOREIGN KEY (`screen_ID`) REFERENCES `screen` (`sc_id`),
  ADD CONSTRAINT `fk_foreign_key_seat` FOREIGN KEY (`seat_ID`) REFERENCES `seats` (`seat_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
