-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 25, 2022 lúc 02:54 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Laptop Acer'),
(2, 'Laptop Asus'),
(3, 'Laptop HP'),
(4, 'Laptop MSI'),
(5, 'Laptop Lenovo'),
(6, 'Laptop Dell');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `unit_price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `item`
--

INSERT INTO `item` (`item_id`, `product_id`, `unit_price`, `quantity`, `order_id`) VALUES
(9, 51, 77, 1, 14),
(10, 88, 50, 1, 14),
(11, 49, 52, 2, 15),
(12, 50, 54, 1, 15),
(13, 88, 50, 3, 15),
(14, 89, 48, 1, 15),
(15, 51, 77, 3, 16),
(16, 47, 60, 1, 16),
(17, 49, 52, 2, 17),
(18, 58, 59, 1, 17),
(19, 49, 52, 2, 21),
(20, 60, 68, 1, 22),
(21, 50, 54, 1, 23),
(22, 88, 49, 3, 23),
(23, 89, 48, 2, 23),
(24, 51, 76, 2, 24),
(25, 52, 64, 1, 24),
(26, 58, 59, 5, 25),
(27, 47, 60, 3, 25),
(28, 50, 54, 1, 26),
(29, 89, 48, 2, 26),
(30, 64, 71, 1, 27),
(31, 51, 76, 4, 27),
(32, 77, 53, 1, 27),
(33, 51, 76, 1, 28),
(34, 47, 60, 3, 28),
(35, 52, 64, 1, 29),
(36, 47, 60, 1, 30),
(37, 81, 42, 2, 31),
(38, 60, 68, 1, 31),
(39, 81, 42, 3, 32),
(40, 98, 42, 1, 33),
(41, 77, 53, 1, 33),
(42, 49, 52, 3, 34),
(43, 95, 44, 2, 34),
(44, 98, 70, 5, 35),
(45, 55, 67, 2, 35),
(46, 72, 70, 3, 35),
(47, 47, 60, 2, 36),
(48, 51, 76, 1, 37),
(49, 51, 76, 1, 38),
(50, 60, 68, 1, 39),
(51, 51, 76, 1, 40),
(52, 49, 52, 1, 41),
(53, 82, 45, 1, 42),
(54, 90, 36, 1, 44),
(55, 58, 59, 1, 45),
(56, 48, 60, 1, 46),
(57, 84, 38, 1, 47),
(58, 98, 70, 1, 48),
(59, 69, 41, 1, 49),
(60, 60, 68, 1, 50);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_user`
--

CREATE TABLE `order_user` (
  `order_id` bigint(20) NOT NULL,
  `buy_date` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `price_total` float NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_user`
--

INSERT INTO `order_user` (`order_id`, `buy_date`, `status`, `price_total`, `user_id`) VALUES
(40, '2022-04-23 00:00:00', 'SUCCESS', 81, 97),
(41, '2022-04-23 00:00:00', 'SUCCESS', 57, 97),
(42, '2022-04-23 00:00:00', 'SUCCESS', 50, 97),
(43, '2022-04-23 00:00:00', 'SUCCESS', 5, 97),
(44, '2022-04-23 00:00:00', 'SUCCESS', 41, 97),
(45, '2022-04-24 00:00:00', 'SUCCESS', 64, 98),
(46, '2022-04-24 00:00:00', 'SUCCESS', 65, 97),
(47, '2022-04-24 00:00:00', 'SUCCESS', 43, 98),
(48, '2022-04-24 00:00:00', 'SUCCESS', 75, 98),
(49, '2022-04-24 00:00:00', 'SUCCESS', 46, 98),
(50, '2022-04-25 00:00:00', 'SUCCESS', 73, 98);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sale_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `description`, `image`, `price`, `product_name`, `quantity`, `category_id`, `sale_id`) VALUES
(44, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 65, 'Laptop Acer Predator Helios 300', 150, 1, 's20pc'),
(47, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 67, 'Laptop Acer Predator Helios 300', 55, 1, 's10pc'),
(48, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 60, 'Laptop Gaming MSI GE66 Raider', 152, 4, 'default'),
(49, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 65, 'Laptop Gaming MSI GE66 Raider', 150, 4, 's20pc'),
(50, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 60, 'Laptop Gaming MSI GE66 Raider', 199, 4, 's10pc'),
(51, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 85, 'Laptop Lenovo Legion 5', 120, 5, 's10pc'),
(52, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 80, 'Laptop Lenovo Legion 5', 345, 5, 's20pc'),
(53, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 78, 'Laptop Lenovo Legion 5', 167, 5, 'default'),
(54, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 89, 'Laptop Lenovo Legion 5', 313, 5, 's30pc'),
(55, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 67, 'Laptop Gaming MSI GE66 Raider', 467, 4, 'default'),
(56, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 78, 'Laptop Gaming MSI GE66 Raider', 276, 4, 's10pc'),
(57, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 65, 'Laptop Gaming MSI GE66 Raider', 198, 4, 's20pc'),
(58, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 59, 'Laptop Acer Predator Helios 300', 435, 1, 'default'),
(59, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 70, 'Laptop Lenovo Legion 5', 365, 5, 's30pc'),
(60, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 85, 'Laptop Lenovo Legion 5', 423, 5, 's20pc'),
(61, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 59, 'Laptop Gaming MSI GE66 Raider', 531, 4, 's10pc'),
(62, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 79, 'Laptop Lenovo Legion 5', 484, 5, 'default'),
(63, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 79, 'Laptop Lenovo Legion 5', 567, 5, 's30pc'),
(64, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 89, 'Laptop Lenovo Legion 5', 462, 5, 's20pc'),
(65, 'Laptop Lenovo Legion 5 15ACH6H (82JU00YXVN) Geforce RTX 3060 6GB AMD Ryzen 7 5800H 8GB 512GB 15.6″ 165Hz IPS 100% sRGB 4-zones Win 11 Xanh', '1608623182252.jpg', 69, 'Laptop Lenovo Legion 5', 352, 5, 's10pc'),
(66, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 69, 'Laptop Gaming MSI GE66 Raider', 535, 4, 's40pc'),
(67, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 59, 'Laptop Gaming MSI GE66 Raider', 215, 4, 's30pc'),
(68, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 65, 'Laptop Gaming MSI GE66 Raider', 453, 4, 's20pc'),
(69, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 69, 'Laptop Gaming MSI GE66 Raider', 379, 4, 's40pc'),
(70, 'Laptop Gaming MSI GE66 Raider 12UGS 405VN / 463VN RTX 3070Ti 8GB Intel Core i9 12900HK 32GB 1TB 15.6″ 2K IPS 240Hz Perkey RGB Win 11', '1609035204723.jpg', 60, 'Laptop Gaming MSI GE66 Raider', 265, 4, 's30pc'),
(71, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 65, 'Laptop Acer Predator Helios 300', 343, 1, 's20pc'),
(72, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 78, 'Laptop Acer Predator Helios 300', 547, 1, 's10pc'),
(73, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 60, 'Laptop Acer Predator Helios 300', 743, 1, 's20pc'),
(74, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 65, 'Laptop Acer Predator Helios 300', 296, 1, 'default'),
(75, 'Laptop Acer Predator Helios 300 PH315-55-76KG Geforce RTX 3060 6GB Intel Core i7 12700H 16GB 512GB 15.6″ 2K IPS 165Hz 4-zones Win11', '1611853378099.jpg', 60, 'Laptop Acer Predator Helios 300', 343, 1, 's10pc'),
(77, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 59, 'Laptop Dell Alienware M15 R6', 834, 6, 's10pc'),
(78, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 56, 'Laptop Dell Alienware M15 R6', 783, 6, 's20pc'),
(79, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 45, 'Laptop Dell Alienware M15 R6', 673, 6, 'default'),
(80, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 49, 'Laptop Dell Alienware M15 R6', 348, 6, 's20pc'),
(81, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 78, 'Laptop Dell Alienware M15 R6', 934, 6, 's10pc'),
(82, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 50, 'Laptop Dell Alienware M15 R6', 582, 6, 's10pc'),
(83, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6? QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 50, 'Laptop Dell Alienware M15 R6', 563, 6, 's30pc'),
(84, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 55, 'Laptop Dell Alienware M15 R6', 328, 6, 's30pc'),
(85, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 49, 'Laptop Dell Alienware M15 R6', 921, 6, 's10pc'),
(86, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 59, 'Laptop Dell Alienware M15 R6', 445, 6, 's20pc'),
(87, 'Laptop Dell Alienware M15 R6 (P109F001ABL) Geforce RTX 3060 6GB Intel Core i7 11800H 1TB 32GB 15.6″ QHD 240Hz Perkey AlienFX Office Win 10', '1608622647893.jpg', 60, 'Laptop Dell Alienware M15 R6', 562, 6, 's20pc'),
(88, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 78, 'Laptop HP OMEN', 765, 3, 's10pc'),
(89, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 60, 'Laptop HP OMEN', 452, 3, 's20pc'),
(90, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 45, 'Laptop HP OMEN', 293, 3, 's20pc'),
(91, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 50, 'Laptop HP OMEN', 546, 3, 's30pc'),
(92, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 50, 'Laptop HP OMEN', 834, 3, 's10pc'),
(93, 'Laptop HP OMEN 16-e0177AX (4R0U9PA) GTX1650 4GB AMD R5 5600H 8GB 512GB 16.1” IPS 144Hz Backlight Keyboard Win 10 (Mica Silver)', '1609034816715.jpg', 59, 'Laptop HP OMEN', 453, 3, 's20pc'),
(94, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 60, 'Laptop ASUS ROG Zephyrus M16', 456, 2, 's10pc'),
(95, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 55, 'Laptop ASUS ROG Zephyrus M16', 738, 2, 's20pc'),
(96, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 49, 'Laptop ASUS ROG Zephyrus M16', 982, 2, 's10pc'),
(97, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 59, 'Laptop ASUS ROG Zephyrus M16', 213, 2, 's30pc'),
(98, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 78, 'Laptop ASUS ROG Zephyrus M16', 573, 2, 's10pc'),
(99, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 59, 'Laptop ASUS ROG Zephyrus M16', 837, 2, 's30pc'),
(100, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 60, 'Laptop ASUS ROG Zephyrus M16', 458, 2, 's30pc'),
(101, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 49, 'Laptop ASUS ROG Zephyrus M16', 635, 2, 's10pc'),
(107, 'Laptop ASUS ROG Zephyrus M16 GU603HR-K8036T Geforce RTX 3070 8GB Intel Core i9 11900H 32GB 2TB 16″ WQXGA 165Hz Win 10', '1609036791385.png', 64, 'Laptop ASUS ROG Zephyrus M16', 120, 2, 's30pc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MEMBER'),
(3, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sale`
--

CREATE TABLE `sale` (
  `sale_id` varchar(255) NOT NULL,
  `sale_percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_percent`) VALUES
('default', 0),
('s10pc', 10),
('s20pc', 20),
('s30pc', 30),
('s40pc', 40),
('s50', 50);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `verify` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `address`, `full_name`, `gender`, `image`, `password`, `phone`, `role_id`, `avatar`, `email`, `verify`) VALUES
(31, 'China - Tokyo - Mexico - Horykito', 'Mr. Admin', b'1', NULL, '$2a$10$bKK6RPKrht8zBKWxNNHkgOTA/kfR/FCQLCQH1z6Je7Cw7NkdRUjh.', '0999999999', 1, '1608484153089.jpg', 'admin@gmail.com', b'1'),
(95, 'TPHCM', 'Mr. Mo Mo', b'0', NULL, '$2a$10$4VmyvNz6gClK0lGg6awXWes15RiUuzuDw9sNOSAvEBJSgTO/5dOVO', '0973645345', 3, '1608484153089.jpg', 'amomo@gmail.com', b'1'),
(97, 'HÃ  ná»i', 'NguyÃ¡Â»Ân ChÃÂ¡nh TÃÂ­n', b'0', NULL, '$2a$10$bKK6RPKrht8zBKWxNNHkgOTA/kfR/FCQLCQH1z6Je7Cw7NkdRUjh.', '0924963557', 3, '1608484153089.jpg', 'chanhtin2203@gmail.com', b'1'),
(98, 'TPHCM', 'Nguyen Tin', b'0', NULL, '$2a$10$L8kWvaAlVq1InCRwDyDdueE3dLeQWNsReB2PdQ6nTJJcvYhp4.1Ri', '123456789', 3, '1608484153089.jpg', 'pytun130@gmail.com', b'1'),
(99, NULL, NULL, b'0', NULL, '$2a$10$P5NCKvYiOzuAOGV7gBmmR.LpQirf6XyZJRKbB908WQrvbEa.DR5NG', NULL, 3, '1608484153089.jpg', 'loldat@gmail.com', b'1'),
(100, NULL, NULL, b'0', NULL, '$2a$10$ZE1lfQVQm4x0xYyRYFwR6.ldW3iivMM8cST/zjjuSGPqpmQi4xD0O', NULL, 3, '1608484153089.jpg', 'zdmcsznhi@gmail.com', b'0');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Chỉ mục cho bảng `order_user`
--
ALTER TABLE `order_user`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  ADD KEY `FKtgpfnkn7etmfumakc3iq75e95` (`sale_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  ADD KEY `idx_user_password` (`password`(20));

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `order_user`
--
ALTER TABLE `order_user`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_user`
--
ALTER TABLE `order_user`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `FKtgpfnkn7etmfumakc3iq75e95` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
