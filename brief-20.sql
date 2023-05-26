-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2023 at 10:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brief-20`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_admin` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_admin`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Saad', 'Tebba', 'saad.tebba.solicode@gmail.com', 'saad123');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID_formation` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID_formation`, `subject`, `category`, `duration`, `description`) VALUES
(1, 'First course testing', 'Web Development', 138, 'A course that covers everything'),
(2, 'Suscipit quia irure ', 'Deserunt odio et ut ', 44, 'Quas et voluptatem e'),
(3, 'Ut voluptatem ad vo', 'Duis non laborum sin', 15, 'Incidunt labore ull'),
(4, 'Shopify Management For Freelancing', 'Business', 5, 'Shopify Management For Freelancing'),
(5, 'Unreal Engine 5 C++ Developer: Learn C++ & Make Video Games', 'Development', 30, 'Unreal Engine 5 C++ Developer: Learn C++ & Make Video Games');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `ID_apprenant` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`ID_apprenant`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Jared', 'Tyson', 'testingAccount', 'testing'),
(2, 'Inez', 'Lara', 'zirone@mailinator.com', '$2y$10$2P7UmXlnNjq3kDsDs201BeRoGsW0tpIhOn8zTBTibYPPum0vr2aOi'),
(3, 'Sasha', 'Mayer', 'ketoge@mailinator.com', '$2y$10$B9n7UVJgPq69jKVouxQMK.G9klrya7KRUbVMDK1f3pGk0s5jp5Ft2'),
(4, 'Orli', 'Oneill', 'joqufanow@mailinator.com', '$2y$10$k7QFCL55j2fh1fXPQFmAqO/Y8qabuYl.7.2WHAhjNoXmc3PH.nSqK');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `ID_apprenant` int(11) NOT NULL,
  `ID_session` int(11) NOT NULL,
  `resultat` varchar(50) DEFAULT NULL,
  `date_evaluation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`ID_apprenant`, `ID_session`, `resultat`, `date_evaluation`) VALUES
(1, 3, NULL, '2023-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `ID_session` int(11) NOT NULL,
  `starts` date NOT NULL,
  `ends` date NOT NULL,
  `places` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `Id_formateur` int(11) NOT NULL,
  `Id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`ID_session`, `starts`, `ends`, `places`, `state`, `Id_formateur`, `Id_formation`) VALUES
(1, '2021-05-03', '2023-05-31', 20, 'active', 1, 1),
(2, '2023-05-24', '2023-05-25', 30, 'not active', 1, 4),
(3, '2022-05-09', '2023-05-16', 10, 'active', 1, 4),
(4, '2023-05-01', '2023-05-03', 15, 'active', 1, 5),
(5, '2023-05-28', '2023-05-31', 15, 'active', 1, 1),
(6, '2023-03-13', '2023-04-06', 5, 'active', 1, 4),
(7, '2023-05-30', '2023-05-31', 0, 'active', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `ID_formateur` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`ID_formateur`, `FirstName`, `LastName`, `Email`, `Password`) VALUES
(1, 'Saad', 'Alilou', 'saad.alilou@gmail.com', 'saad123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID_formation`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`ID_apprenant`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`ID_apprenant`,`ID_session`),
  ADD KEY `ID_session` (`ID_session`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`ID_session`),
  ADD KEY `Id_formation` (`Id_formation`),
  ADD KEY `Id_formateur` (`Id_formateur`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`ID_formateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `ID_apprenant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `ID_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `ID_formateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`ID_apprenant`) REFERENCES `members` (`ID_apprenant`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`ID_session`) REFERENCES `session` (`ID_session`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`Id_formation`) REFERENCES `courses` (`ID_formation`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`Id_formateur`) REFERENCES `trainer` (`ID_formateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
