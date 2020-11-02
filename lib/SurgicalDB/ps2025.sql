-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2020 at 12:16 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ps2025`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `challenge_id` int(11) NOT NULL,
  `challenge_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`challenge_id`, `challenge_name`) VALUES
(1, 'Continuous Stitch'),
(3, 'Interrupt Stitch'),
(4, 'Knot Tying');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `uc_id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `challenge_id` int(4) NOT NULL,
  `date` date NOT NULL,
  `smooth_score` decimal(4,0) NOT NULL,
  `steady_score` decimal(4,0) NOT NULL,
  `speed_score` decimal(4,0) NOT NULL,
  `accuracy_score` decimal(4,0) NOT NULL,
  `avg_score` decimal(4,0) NOT NULL,
  `time` double(4,0) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `uc_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`uc_id`, `user_id`, `challenge_id`, `date`, `smooth_score`, `steady_score`, `speed_score`, `accuracy_score`, `avg_score`, `time`, `feedback`, `uc_type`) VALUES
(1, 35, 1, '2020-10-16', '70', '68', '70', '72', '70', 22, 'Great Work! You got credit!', 'Challenge'),
(2, 37, 1, '2020-10-16', '64', '66', '62', '64', '64', 24, 'You got a pass! Try doing better next time!', 'Challenge'),
(3, 34, 1, '2020-10-16', '82', '76', '76', '70', '76', 20, 'Excellent work! You got distinction, now far from HD!', 'Challenge'),
(4, 36, 1, '2020-10-16', '72', '70', '74', '72', '72', 21, 'Great Work! You got a high credit!', 'Challenge'),
(5, 38, 1, '2020-10-16', '86', '90', '82', '86', '86', 17, 'Excellent work! You got a HD!', 'Challenge');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `uname` varchar(12) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `utype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `lname`, `email`, `uname`, `pass`, `utype`) VALUES
(34, 'Sandra', 'T', 'sandra@gmail.com', 'sandra', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(35, 'Jack', 'KS', 'jack@gmail.com', 'jack', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(36, 'Nabin', 'MD', 'md@gmail.com', 'md', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(37, 'Megh', 'P', 'megh@gmail.com', 'megh', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(38, 'Gough', 'L', 'gough@gmail.com', 'gough', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(39, 'Anupama', 'A', 'anupama@gmail.com', 'anu', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$ebdffb7cfeb3abb355113c1cf79cbb21f4cba9342ed2029e8c0bb53e175218b6798ea5d5ca0384db5b256d3cb6462d7c8acd16cff8f1a8ae2e3b224a7e3d91b9', 'USER'),
(41, 'NewAnupama', 'A', 'anupama@gmail.com', 'anu1', '$pcks$64,10000,64$530f8afbc74536b9a963b4f1c4cb738bcea7403d4d606b6e074ec5d3baf39d18$9fa3725c6b839152f2d59a9696e4d6d0c456c81300e79a18ef0617f8e37a3b9926147f381d48edc3b9b5d4129e1b2a2565aa9a6d44f3252a1aa6a6a2a48c5698', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`challenge_id`),
  ADD UNIQUE KEY `challenge_name` (`challenge_name`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`uc_id`),
  ADD KEY `challenge_id` (`challenge_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `challenge_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `uc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`challenge_id`),
  ADD CONSTRAINT `leaderboard_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
