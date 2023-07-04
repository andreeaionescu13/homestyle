-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 06, 2023 at 09:31 PM
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
-- Database: `onlineshop1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `ProductID` varchar(50) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`OrderID`, `ProductID`, `Quantity`) VALUES
(1654878258, 1654872289, 1),
(1654878258, 1654871258, 2),
(1654878258, 1654872419, 1),
(1654878258, 0, 0),
(1654878350, 1654872289, 1),
(1654878350, 1654871258, 2),
(1654878350, 1654872419, 1),
(1654878351, 1654872289, 1),
(1654878351, 1654871258, 2),
(1654878351, 1654872419, 1),
(1654878352, 1654872289, 1),
(1654878352, 1654871258, 2),
(1654878352, 1654872419, 1),
(1654878354, 1654872289, 1),
(1654878354, 1654871258, 2),
(1654878354, 1654872419, 1),
(1654878355, 1654872289, 1),
(1654878355, 1654871258, 2),
(1654878355, 1654872419, 1),
(2, 1654871258, 2),
(2, 1654871289, 1),
(4, 1654872419, 1),
(4, 1654871258, 3),
(4, 1654872289, 1),
(5, 1654872419, 1),
(5, 1654871258, 3),
(5, 1654872289, 1),
(4, 1654871289, 1),
(4, 1654871258, 2),
(5, 1654871258, 1),
(6, 1654871258, 1),
(6, 1654871289, 1),
(7, 1654871258, 1),
(7, 1654872289, 1),
(3, 1654871258, 3),
(3, 1654872289, 2),
(3, 1655718431, 3),
(1, 1654871258, 2),
(1, 1654871258, 1),
(1, 1654871289, 1),
(2, 1654871258, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` varchar(50) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `ManufacturerID` varchar(50) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `PieceNR` int(100) DEFAULT NULL,
  `Image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `Description`, `ManufacturerID`, `Price`, `PieceNR`, `Image`) VALUES
('1654871258', 'product1', 'description', '324352', 25.00, NULL, ''),
('1654871289', 'product22', 'description', '236789', 20.00, NULL, ''),
('1654872289', 'product3', 'description', '232213', 24.00, NULL, ''),
('1654872419', 'product4', 'description', '234252', 14.00, NULL, ''),
('1655718431', 'product5', 'description', '503427', 16.00, NULL, ''),
('1655997809', 'product6', 'description', '546792', 21.00, NULL, ''),
('1655997868', 'product7', 'description', '478201', 23.00, NULL, ''),
('1655997894', 'product7', 'description', '562839', 17.00, NULL, ''),
('1655997914', 'product8', 'description', '562838', 19.00, NULL, ''),
('1681138787', 'product9', 'description', '324357', 25.00, NULL, ''),
('1683136265', 'product10', 'description', '324358', 20.00, NULL, ''),
('1684692030', 'product11', 'description', '324358', 28.00, NULL, ''),
('1686076345', 'product12', 'description', '324359', 25.00, NULL, ''),
('1686079108', 'product1', 'description', '324352', 25.00, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order`
--

CREATE TABLE `shop_order` (
  `OrderID` int(255) NOT NULL,
  `CustomerID` int(255) DEFAULT NULL,
  `TotalPrice` int(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `DatePurchase` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shop_order`
--

INSERT INTO `shop_order` (`OrderID`, `CustomerID`, `TotalPrice`, `Status`, `DatePurchase`) VALUES
(1, 23, 95, 'pending', '2022-06-24 18:01:09'),
(2, 22, 25, 'pending', '2022-06-24 18:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(128) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerPhoneNumber` int(15) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `CustomerAddress` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Password`, `CustomerName`, `CustomerPhoneNumber`, `CustomerEmail`, `CustomerAddress`, `admin`) VALUES
(22, 'admin', '$2y$10$2SVmRY2M8aFHm/jq1Hd6DeHDqFdmS/3Z.6KhZugAeshedS6uApQIC', 'admin', 766666666, 'admin@gmail.com', 'cluj-Napoca', 1),
(23, 'user', '$2y$10$WUFkWkMGjfsNkVITHT6vfexedqfZnQ0u/E.U8jpoZlQ.Me5XMDAM.', 'user', 766666669, 'user@gmail.com', 'adresa', 0),
(24, 'andree', '$2y$10$kNaB9OlRwsIZy7nlrfS9ie/lXGI6NBcHJZu7Q6OB/uDyxueTQYaw.', 'Andreea', 755626272, 'andreeaionescu1301@yahoo.com', 'Cluj-Napoca', 0),
(25, 'andreea', '$2y$10$rA3uhW99Tq9lyQWYC.xQ/OiAqUsClFj7P3Q4s/ScuVrQH6MVNaP1i', NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `BookID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `OrderID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Cart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
