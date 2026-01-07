-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 06:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Address_Type` enum('Home','Work','Other') DEFAULT 'Home',
  `Street_Address` text NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Zip_Code` varchar(20) NOT NULL,
  `Country` varchar(100) DEFAULT 'India',
  `Is_Default` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `User_ID`, `Address_Type`, `Street_Address`, `City`, `State`, `Zip_Code`, `Country`, `Is_Default`) VALUES
(1, 1, 'Home', '12 Lake Road', 'Dhaka', 'Dhaka', '1207', 'Bangladesh', 1),
(2, 2, 'Home', '45 River St', 'Dhaka', 'Dhaka', '1212', 'Bangladesh', 1),
(3, 3, 'Work', '88 Market Ave', 'Chittagong', 'Chittagong', '4000', 'Bangladesh', 1),
(4, 4, 'Home', '9 Park Lane', 'Khulna', 'Khulna', '9000', 'Bangladesh', 1),
(5, 5, 'Home', '5 Oak Street', 'Dhaka', 'Dhaka', '1209', 'Bangladesh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`Cart_ID`, `User_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `Cart_Item_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`Cart_Item_ID`, `Cart_ID`, `P_ID`, `Quantity`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 3, 4, 1),
(5, 4, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `C_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Picture` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`C_ID`, `Name`, `Picture`, `Description`) VALUES
(1, 'Electronics', 'electronics.jpg', 'Smartphones, laptops, accessories'),
(2, 'Clothing', 'clothing.jpg', 'Men and women wear'),
(3, 'Books', 'books.jpg', 'Novels and textbooks'),
(4, 'Home Appliances', 'home.jpg', 'Kitchen and household items'),
(5, 'Sports', 'sports.jpg', 'Sports and fitness equipment');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`User_ID`, `Name`, `Email`, `Password`) VALUES
(1, 'Samiya Islam', 'samiya@example.com', 'pass123'),
(2, 'Tasikul Islam', 'tasikul@example.com', 'pass456'),
(3, 'Ananya Chakraborty', 'ananya@example.com', 'pass789'),
(4, 'Rafi Khan', 'rafi@example.com', 'pass321'),
(5, 'Ahnat Islam', 'ahnat@example.com', 'pass654');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Order_Amount` decimal(10,2) NOT NULL,
  `Order_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Shipping_Address` text DEFAULT NULL,
  `Order_Status` enum('Pending','Confirmed','Shipped','Delivered','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `User_ID`, `Order_Amount`, `Order_Date`, `Shipping_Address`, `Order_Status`) VALUES
(1, 1, 329.99, '2025-10-30 10:16:52', '12 Lake Road, Dhaka', 'Delivered'),
(2, 2, 899.99, '2025-10-30 10:16:52', '45 River St, Dhaka', 'Shipped'),
(3, 3, 12.99, '2025-10-30 10:16:52', '88 Market Ave, Chittagong', 'Delivered'),
(4, 4, 25.50, '2025-10-30 10:16:52', '9 Park Lane, Khulna', 'Confirmed'),
(5, 5, 45.00, '2025-10-30 10:16:52', '5 Oak Street, Dhaka', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `Order_Item_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit_Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`Order_Item_ID`, `Order_ID`, `P_ID`, `Quantity`, `Unit_Price`) VALUES
(1, 1, 1, 1, 299.99),
(2, 1, 3, 2, 15.00),
(3, 2, 2, 1, 899.99),
(4, 3, 4, 1, 12.99),
(5, 4, 5, 1, 25.50);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Type` enum('Credit Card','Debit Card','Mobile Banking','Cash on Delivery') NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Payment_Status` enum('Pending','Completed','Failed','Refunded') DEFAULT 'Pending',
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Transaction_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Order_ID`, `Type`, `Amount`, `Payment_Status`, `Payment_Date`, `Transaction_ID`) VALUES
(1, 1, 'Credit Card', 329.99, 'Completed', '2025-10-30 10:18:05', 'TXN1001'),
(2, 2, '', 899.99, 'Completed', '2025-10-30 10:18:05', 'TXN1002'),
(3, 3, 'Cash on Delivery', 12.99, 'Completed', '2025-10-30 10:18:05', 'TXN1003'),
(4, 4, 'Debit Card', 25.50, 'Pending', '2025-10-30 10:18:05', 'TXN1004'),
(5, 5, '', 45.00, 'Pending', '2025-10-30 10:18:05', 'TXN1005');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `P_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` text DEFAULT NULL,
  `Stock_Quantity` int(11) DEFAULT 0,
  `C_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`P_ID`, `Name`, `Price`, `Description`, `Stock_Quantity`, `C_ID`) VALUES
(1, 'Smartphone X1', 299.99, '6.5 inch display, 128GB storage', 50, 1),
(2, 'Laptop Pro 15', 899.99, '15 inch display, 16GB RAM', 30, 1),
(3, 'Cotton T-Shirt', 15.00, 'Soft cotton material, unisex', 100, 2),
(4, 'Fiction Novel', 12.99, 'Bestselling fiction book', 75, 3),
(5, 'Electric Kettle', 25.50, '1.5L automatic shutoff kettle', 40, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`Cart_Item_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`Order_Item_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD UNIQUE KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `C_ID` (`C_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `Cart_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `Order_Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `P_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `customer` (`User_ID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `customer` (`User_ID`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `customer` (`User_ID`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`P_ID`) REFERENCES `product` (`P_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `category` (`C_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
