-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2015 at 08:59 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tidiit`
--
CREATE DATABASE IF NOT EXISTS `tidiit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tidiit`;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `bankId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`bankId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `bannerId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bannerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `big_unit`
--

CREATE TABLE IF NOT EXISTS `big_unit` (
  `bigUnitId` int(11) NOT NULL AUTO_INCREMENT,
  `smallUnitId` int(11) NOT NULL,
  `bgUnitName` int(11) NOT NULL,
  `relation` int(11) NOT NULL,
  `noOfTimesUsed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bigUnitId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `billing_address`
--

CREATE TABLE IF NOT EXISTS `billing_address` (
  `billingAddressId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `countryId` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `contactNo` varchar(50) NOT NULL,
  PRIMARY KEY (`billingAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cartId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(255) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `discountId` int(11) NOT NULL,
  `priceAfterDiscount` float(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `weight` float(10,3) NOT NULL,
  `discountAmount` float(10,2) NOT NULL,
  `cartDate` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart_order`
--

CREATE TABLE IF NOT EXISTS `cart_order` (
  `cartOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `cartId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  PRIMARY KEY (`cartOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `parrentCategoryId` bigint(20) NOT NULL,
  `categoryName` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `isTop` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=>top,1=>Not Top',
  `image` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `showProduct` tinyint(4) NOT NULL DEFAULT '1',
  `isAddToCart` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `metaTitle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `metaKeyWord` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `metaDescription` varchar(1000) COLLATE latin1_general_ci NOT NULL,
  `note` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `extraNote` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category_tag`
--

CREATE TABLE IF NOT EXISTS `category_tag` (
  `categoryTagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryId` bigint(11) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`categoryTagId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE IF NOT EXISTS `cms` (
  `cmsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `metaTitle` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `metaKeyWord` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `metaDescription` varbinary(500) NOT NULL,
  `shortBody` varbinary(100) NOT NULL,
  `body` longtext COLLATE latin1_general_ci,
  `categoryId` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cmsId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `countryCode` varchar(3) NOT NULL DEFAULT '',
  `countryName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`countryId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=241 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryId`, `countryCode`, `countryName`) VALUES
(1, 'US', 'USA'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecudaor'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'KW', 'Kuwait'),
(116, 'KG', 'Kyrgyzstan'),
(117, 'LA', 'Lao People''s Democratic Republic'),
(118, 'LV', 'Latvia'),
(119, 'LB', 'Lebanon'),
(120, 'LS', 'Lesotho'),
(121, 'LR', 'Liberia'),
(122, 'LY', 'Libyan Arab Jamahiriya'),
(123, 'LI', 'Liechtenstein'),
(124, 'LT', 'Lithuania'),
(125, 'LU', 'Luxembourg'),
(126, 'MO', 'Macau'),
(127, 'MK', 'Macedonia'),
(128, 'MG', 'Madagascar'),
(129, 'MW', 'Malawi'),
(130, 'MY', 'Malaysia'),
(131, 'MV', 'Maldives'),
(132, 'ML', 'Mali'),
(133, 'MT', 'Malta'),
(134, 'MH', 'Marshall Islands'),
(135, 'MQ', 'Martinique'),
(136, 'MR', 'Mauritania'),
(137, 'MU', 'Mauritius'),
(138, 'TY', 'Mayotte'),
(139, 'MX', 'Mexico'),
(140, 'FM', 'Micronesia, Federated States of'),
(141, 'MD', 'Moldova, Republic of'),
(142, 'MC', 'Monaco'),
(143, 'MN', 'Mongolia'),
(144, 'MS', 'Montserrat'),
(145, 'MA', 'Morocco'),
(146, 'MZ', 'Mozambique'),
(147, 'MM', 'Myanmar'),
(148, 'NA', 'Namibia'),
(149, 'NR', 'Nauru'),
(150, 'NP', 'Nepal'),
(151, 'NL', 'Netherlands'),
(152, 'AN', 'Netherlands Antilles'),
(153, 'NC', 'New Caledonia'),
(154, 'NZ', 'New Zealand'),
(155, 'NI', 'Nicaragua'),
(156, 'NE', 'Niger'),
(157, 'NG', 'Nigeria'),
(158, 'NU', 'Niue'),
(159, 'NF', 'Norfork Island'),
(160, 'MP', 'Northern Mariana Islands'),
(161, 'NO', 'Norway'),
(162, 'OM', 'Oman'),
(163, 'PK', 'Pakistan'),
(164, 'PW', 'Palau'),
(165, 'PA', 'Panama'),
(166, 'PG', 'Papua New Guinea'),
(167, 'PY', 'Paraguay'),
(168, 'PE', 'Peru'),
(169, 'PH', 'Philippines'),
(170, 'PN', 'Pitcairn'),
(171, 'PL', 'Poland'),
(172, 'PT', 'Portugal'),
(173, 'PR', 'Puerto Rico'),
(174, 'QA', 'Qatar'),
(175, 'RE', 'Reunion'),
(176, 'RO', 'Romania'),
(177, 'RU', 'Russian Federation'),
(178, 'RW', 'Rwanda'),
(179, 'KN', 'Saint Kitts and Nevis'),
(180, 'LC', 'Saint Lucia'),
(181, 'VC', 'Saint Vincent and the Grenadines'),
(182, 'WS', 'Samoa'),
(183, 'SM', 'San Marino'),
(184, 'ST', 'Sao Tome and Principe'),
(185, 'SA', 'Saudi Arabia'),
(186, 'SN', 'Senegal'),
(187, 'SC', 'Seychelles'),
(188, 'SL', 'Sierra Leone'),
(189, 'SG', 'Singapore'),
(190, 'SK', 'Slovakia'),
(191, 'SI', 'Slovenia'),
(192, 'SB', 'Solomon Islands'),
(193, 'SO', 'Somalia'),
(194, 'ZA', 'South Africa'),
(195, 'GS', 'South Georgia South Sandwich Islands'),
(196, 'ES', 'Spain'),
(197, 'LK', 'Sri Lanka'),
(198, 'SH', 'St. Helena'),
(199, 'PM', 'St. Pierre and Miquelon'),
(200, 'SD', 'Sudan'),
(201, 'SR', 'Suriname'),
(202, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(203, 'SZ', 'Swaziland'),
(204, 'SE', 'Sweden'),
(205, 'CH', 'Switzerland'),
(206, 'SY', 'Syrian Arab Republic'),
(207, 'TW', 'Taiwan'),
(208, 'TJ', 'Tajikistan'),
(209, 'TZ', 'Tanzania, United Republic of'),
(210, 'TH', 'Thailand'),
(211, 'TG', 'Togo'),
(212, 'TK', 'Tokelau'),
(213, 'TO', 'Tonga'),
(214, 'TT', 'Trinidad and Tobago'),
(215, 'TN', 'Tunisia'),
(216, 'TR', 'Turkey'),
(217, 'TM', 'Turkmenistan'),
(218, 'TC', 'Turks and Caicos Islands'),
(219, 'TV', 'Tuvalu'),
(220, 'UG', 'Uganda'),
(222, 'AE', 'UAE'),
(223, 'GB', 'UK'),
(224, 'UM', 'United States minor outlying islands'),
(225, 'UY', 'Uruguay'),
(226, 'UZ', 'Uzbekistan'),
(227, 'VU', 'Vanuatu'),
(228, 'VA', 'Vatican City State'),
(229, 'VE', 'Venezuela'),
(230, 'VN', 'Vietnam'),
(231, 'VG', 'Virigan Islands (British)'),
(232, 'VI', 'Virgin Islands (U.S.)'),
(233, 'WF', 'Wallis and Futuna Islands'),
(234, 'EH', 'Western Sahara'),
(235, 'YE', 'Yemen'),
(236, 'YU', 'Yugoslavia'),
(237, 'ZR', 'Zaire'),
(238, 'ZM', 'Zambia'),
(239, 'ZW', 'Zimbabwe'),
(240, 'OTH', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `couponId` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `type` enum('percentage','fix') NOT NULL DEFAULT 'fix' COMMENT '0=>Fix,1=>for %',
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`couponId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE IF NOT EXISTS `discount` (
  `discountId` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `type` enum('percentage','fix') NOT NULL DEFAULT 'fix' COMMENT '0=>Fix,1=>for %',
  `amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`discountId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `templateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `faqId` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answer` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`faqId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `finance_info`
--

CREATE TABLE IF NOT EXISTS `finance_info` (
  `financeInfoId` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankId` int(11) NOT NULL,
  `accountNo` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `ifscCode` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`financeInfoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `orderId` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(20) NOT NULL,
  `orderAmount` float(10,2) NOT NULL,
  `userId` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `subTotalAmount` float(10,2) NOT NULL,
  `discountAmount` float(10,2) NOT NULL,
  `taxID` int(11) NOT NULL,
  `taxAmount` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shippingId` int(11) NOT NULL,
  `shippingamount` float(10,2) NOT NULL,
  `userNote` text NOT NULL,
  `aproxMateDeliveryDate` date NOT NULL,
  `redeemPoints` int(11) NOT NULL,
  `redeemAmount` float(10,2) NOT NULL,
  `shippingCountryId` int(11) NOT NULL,
  `userPreferredDeliveryDate` date NOT NULL,
  `userSpecialOccasion` varchar(255) DEFAULT NULL,
  `specialInstruction` varchar(255) DEFAULT NULL,
  `shippingAddresssId` bigint(20) NOT NULL,
  `orderStateId` int(1) NOT NULL DEFAULT '1',
  `userShippingLocation` varchar(5) NOT NULL,
  `IP` varchar(20) NOT NULL,
  `cancelDate` datetime NOT NULL,
  `orderDeviceType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>Web Order, 2=> Mobile Web, 3=> Mobile App',
  `parrentOrderID` bigint(20) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_coupon`
--

CREATE TABLE IF NOT EXISTS `order_coupon` (
  `orderCouponId` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `couponId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`orderCouponId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `orderHistrory` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `historyBy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=>User,1=>By Admin,2=>By Vender',
  `actionOwnerId` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `actionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderHistrory`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_review`
--

CREATE TABLE IF NOT EXISTS `order_review` (
  `orderReviewId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` text NOT NULL,
  `addedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderReviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_state`
--

CREATE TABLE IF NOT EXISTS `order_state` (
  `orderStateId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`orderStateId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_config`
--

CREATE TABLE IF NOT EXISTS `payment_gateway_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signature` varchar(255) NOT NULL,
  `endPoint` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `host` varchar(100) NOT NULL,
  `ipnEndPoint` varchar(255) NOT NULL,
  `gatewayName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productId` bigint(20) NOT NULL AUTO_INCREMENT,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL,
  `shortDescription` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `weight` float(5,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `metaTitle` varchar(255) NOT NULL,
  `metaKeyword` tinytext NOT NULL,
  `metaDescription` tinytext NOT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Do the product is taxabel product or not0=>No,1=>yes',
  `minQty` int(11) NOT NULL,
  `relatedProductIds` varchar(255) NOT NULL COMMENT 'related product ids will as string like 15,25,38,59',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `model` varchar(25) DEFAULT NULL,
  `isNew` tinyint(1) NOT NULL DEFAULT '0',
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `bigUnitId` int(11) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE IF NOT EXISTS `product_brand` (
  `productBrandId` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `brandId` int(11) NOT NULL,
  PRIMARY KEY (`productBrandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `productCategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  PRIMARY KEY (`productCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_deal`
--

CREATE TABLE IF NOT EXISTS `product_deal` (
  `productDealId` bigint(11) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL,
  PRIMARY KEY (`productDealId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `productImageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`productImageId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE IF NOT EXISTS `product_price` (
  `productPriceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `price` float(15,2) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`productPriceId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE IF NOT EXISTS `product_tag` (
  `productTagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `productId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`productTagId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleGroupId` int(11) NOT NULL,
  `roleTitle` varchar(100) NOT NULL,
  `roleAccessTitle` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `isUsed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role_group`
--

CREATE TABLE IF NOT EXISTS `role_group` (
  `roleGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `accessTitle` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `isUsed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleGroupId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role_group`
--

INSERT INTO `role_group` (`roleGroupId`, `title`, `accessTitle`, `status`, `isUsed`) VALUES
(1, 'Manage Role', 'role', 1, 0),
(2, 'Manage User', 'user', 1, 0),
(3, 'Manage Order', 'order', 1, 0),
(4, 'Manage Configuration', 'site_config', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_finance_info`
--

CREATE TABLE IF NOT EXISTS `seller_finance_info` (
  `sellerFinanceInfoId` bigint(20) NOT NULL,
  `financeInfoId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipped_history`
--

CREATE TABLE IF NOT EXISTS `shipped_history` (
  `shippedHistoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `trackingUrl` varchar(255) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`shippedHistoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE IF NOT EXISTS `shipping_address` (
  `shippingAddressId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `countryId` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `contactNo` varchar(50) NOT NULL,
  `contactNo2` varchar(50) NOT NULL,
  PRIMARY KEY (`shippingAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `small_unit`
--

CREATE TABLE IF NOT EXISTS `small_unit` (
  `smallUnitId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`smallUnitId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `small_unit`
--

INSERT INTO `small_unit` (`smallUnitId`, `name`) VALUES
(1, 'Kg'),
(2, 'Ltr'),
(3, 'pc');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `stateId` bigint(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) DEFAULT NULL,
  `countryId` int(11) NOT NULL,
  `stateCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=210 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateId`, `stateName`, `countryId`, `stateCode`) VALUES
(1, 'Alabama', 1, 'AL'),
(2, 'Alaska', 1, 'AK'),
(3, 'Arizona', 1, 'AZ'),
(4, 'Arkansas', 1, 'AR'),
(5, 'California', 1, 'CA'),
(6, 'Colorado', 1, 'CO'),
(7, 'Connecticut', 1, 'CT'),
(8, 'Delaware', 1, 'DE'),
(9, 'Florida', 1, 'FL'),
(10, 'Georgia', 1, 'GA'),
(11, 'Hawaii', 1, 'HI'),
(12, 'Idaho', 1, 'ID'),
(13, 'Illinois', 1, 'IL'),
(14, 'Indiana', 1, 'IN'),
(15, 'Iowa', 1, 'IA'),
(16, 'Kansas', 1, 'KS'),
(17, 'Kentucky', 1, 'KY'),
(18, 'Louisiana', 1, 'LA'),
(19, 'Maine', 1, 'ME'),
(20, 'Maryland', 1, 'MD'),
(21, 'Massachusetts', 1, 'MA'),
(22, 'Michigan', 1, 'MI'),
(23, 'Minnesota', 1, 'MN'),
(24, 'Mississippi', 1, 'MS'),
(25, 'Missouri', 1, 'MO'),
(26, 'Montana', 1, 'MT'),
(27, 'Nebraska', 1, 'NE'),
(28, 'Nevada', 1, 'NE'),
(29, 'New Hampshire', 1, 'NH'),
(30, 'New Jersey', 1, 'NJ'),
(31, 'New Mexico', 1, 'NM'),
(32, 'New York', 1, 'NY'),
(33, 'North Carolina', 1, 'NC'),
(34, 'North Dakota', 1, 'ND'),
(35, 'Ohio', 1, 'OH'),
(36, 'Oklahoma', 1, 'OK'),
(37, 'Oregon', 1, 'OR'),
(38, 'Pennsylvania', 1, 'PA'),
(39, 'Rhode Island', 1, 'RI'),
(40, 'South Carolina', 1, 'SC'),
(41, 'South Dakota', 1, 'SD'),
(42, 'Tennessee', 1, 'TN'),
(43, 'Texas', 1, 'TX'),
(44, 'Utah', 1, 'UT'),
(45, 'Vermont', 1, 'VT'),
(46, 'Virginia', 1, 'VA'),
(47, 'Washington', 1, 'WA'),
(48, 'West Virginia', 1, 'WV'),
(49, 'Wisconsin', 1, 'WI'),
(50, 'Wyoming', 1, 'WY'),
(52, 'Puerto Rico', 1, 'PR'),
(53, 'U.S. Virgin Islands', 1, 'VI'),
(54, 'American Samoa', 1, 'AS'),
(55, 'Guam', 1, 'GU'),
(56, 'Northern Mariana Islands', 1, 'MP'),
(202, 'san jose', 223, NULL),
(70, 'Northwest Territories ', 2, NULL),
(71, 'Nunavut ', 2, NULL),
(72, 'Yukon Territory ', 2, NULL),
(73, 'ANDAMAN AND NICOBAR ISLANDS', 99, NULL),
(74, 'ANDHRA PRADESH', 99, NULL),
(75, 'ASSAM', 99, NULL),
(76, 'BIHAR', 99, NULL),
(77, 'CHATTISGARH', 99, NULL),
(78, 'CHANDIGARH', 99, NULL),
(79, 'DAMAN AND DIU', 99, NULL),
(80, 'DELHI', 99, NULL),
(81, 'DADRA AND NAGAR HAVELI', 99, NULL),
(82, 'GOA', 99, NULL),
(83, 'GUJARAT', 99, NULL),
(84, 'HIMACHAL PRADESH', 99, NULL),
(85, 'HARYANA', 99, NULL),
(86, 'JAMMU AND KASHMIR', 99, NULL),
(87, 'JHARKHAND', 99, NULL),
(88, 'KERALA', 99, NULL),
(89, 'KARNATAKA', 99, NULL),
(90, 'LAKSHADWEEP', 99, NULL),
(91, 'MEGHALAYA', 99, NULL),
(92, 'MAHARASHTRA', 99, NULL),
(93, 'MANIPUR', 99, NULL),
(94, 'MADHYA PRADESH', 99, NULL),
(95, 'MIZORAM', 99, NULL),
(96, 'NAGALAND', 99, NULL),
(97, 'ORISSA', 99, NULL),
(98, 'PUNJAB', 99, NULL),
(99, 'PONDICHERRY', 99, NULL),
(100, 'RAJASTHAN', 99, NULL),
(101, 'SIKKIM', 99, NULL),
(102, 'TAMIL NADU', 99, NULL),
(103, 'TRIPURA', 99, NULL),
(104, 'UTTARAKHAND', 99, NULL),
(105, 'UTTAR PRADESH', 99, NULL),
(106, 'WEST BENGAL', 99, NULL),
(107, 'Others', 1000, NULL),
(108, 'Ontario', 2, 'ON'),
(109, 'Quebec', 2, 'QC'),
(110, 'Nova Scotia', 2, 'NS'),
(111, 'New Brunswick', 2, 'NB'),
(112, 'Manitoba', 2, 'MB'),
(113, 'British Columbia', 2, 'BC'),
(114, 'Prince Edward Island', 2, 'PE'),
(115, 'Saskatchewan', 2, 'SK'),
(116, 'Alberta', 2, 'AB'),
(117, 'Newfoundland and Labrador', 2, 'NL'),
(118, 'Berkshire', 223, NULL),
(119, 'Avon', 223, NULL),
(120, 'Bedfordshire', 223, NULL),
(121, 'City of Bristol', 223, NULL),
(122, 'Buckinghamshire', 223, NULL),
(123, 'Cambridgeshire', 223, NULL),
(124, 'Cambridgeshire and Isle of Ely', 223, NULL),
(125, 'Cheshire', 223, NULL),
(126, 'Cleveland', 223, NULL),
(127, 'Cornwall', 223, NULL),
(128, 'Cumberland', 223, NULL),
(129, 'Cumbria', 223, NULL),
(130, 'Derbyshire', 223, NULL),
(131, 'Devon', 223, NULL),
(132, 'Dorset', 223, NULL),
(133, 'Durham', 223, NULL),
(134, 'East Suffolk', 223, NULL),
(135, 'East Sussex', 223, NULL),
(136, 'Essex', 223, NULL),
(137, 'Gloucestershire', 223, NULL),
(138, 'Greater London', 223, NULL),
(139, 'Greater Manchester', 223, NULL),
(140, 'Hampshire', 223, NULL),
(141, 'Hereford and Worcester', 223, NULL),
(142, 'Herefordshire', 223, NULL),
(143, 'Hertfordshire', 223, NULL),
(144, 'Humberside', 223, NULL),
(145, 'Huntingdon and Peterborough', 223, NULL),
(146, 'Huntingdonshire', 223, NULL),
(147, 'Isle of Ely', 223, NULL),
(148, 'Isle of Wight', 223, NULL),
(149, 'Kent', 223, NULL),
(150, 'Leicestershire', 223, NULL),
(151, 'Lincolnshire', 223, NULL),
(152, 'Lincolnshire, Parts of Holland', 223, NULL),
(153, 'Lincolnshire, Parts of Kesteven', 223, NULL),
(154, 'Lincolnshire, Parts of Lindsey', 223, NULL),
(155, 'London', 223, NULL),
(156, 'City of London', 223, NULL),
(157, 'Merseyside', 223, NULL),
(158, 'Middlesex', 223, NULL),
(159, 'Norfolk', 223, NULL),
(160, 'Northamptonshire', 223, NULL),
(161, 'Northumberland', 223, NULL),
(162, 'North Humberside', 223, NULL),
(163, 'North Yorkshire', 223, NULL),
(164, 'Nottinghamshire', 223, NULL),
(165, 'Oxfordshire', 223, NULL),
(166, 'Soke of Peterborough', 223, NULL),
(167, 'Rutland', 223, NULL),
(168, 'Shropshire (Salop)', 223, NULL),
(169, 'Somerset', 223, NULL),
(170, 'South Humberside', 223, NULL),
(171, 'South Yorkshire', 223, NULL),
(172, 'Staffordshire', 223, NULL),
(173, 'Suffolk', 223, NULL),
(174, 'Surrey', 223, NULL),
(175, 'Sussex', 223, NULL),
(176, 'Tyne and Wear', 223, NULL),
(177, 'Warwickshire', 223, NULL),
(178, 'West Midlands', 223, NULL),
(179, 'Westmorland', 223, NULL),
(180, 'West Suffolk', 223, NULL),
(181, 'West Sussex', 223, NULL),
(182, 'West Yorkshire', 223, NULL),
(183, 'Wiltshire', 223, NULL),
(184, 'Worcestershire', 223, NULL),
(185, 'Yorkshire', 223, NULL),
(186, 'Yorkshire, East Riding', 223, NULL),
(187, 'Yorkshire, North Riding', 223, NULL),
(188, 'Yorkshire, West Riding', 223, NULL),
(189, 'Australian Capital Territory', 15, 'ACT'),
(190, 'Jervis Bay Territory', 15, 'BT'),
(191, 'New South Wales', 15, 'NSW'),
(192, 'Norfolk Island', 15, 'NF'),
(193, 'Northern Territory', 15, 'NT'),
(194, 'Queensland', 15, 'QLD'),
(195, 'South Australia', 15, 'SA'),
(196, 'Tasmania', 15, 'TAS'),
(197, 'Victoria (Australia)', 15, 'VIC'),
(198, 'Western Australia', 15, 'WA'),
(199, 'New Amercan Samoa', 6, NULL),
(200, 'Panjab', 163, NULL),
(201, 'Ca', 1, NULL),
(203, 'Abu Dhabi', 222, NULL),
(204, 'Ajman', 222, ''),
(205, 'Dubai', 222, NULL),
(206, 'Fujairah', 222, NULL),
(207, 'Ras al-Khaimah', 222, NULL),
(208, 'Sharjah', 222, NULL),
(209, 'Umm al-Quwain', 222, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `subscriberId` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `subscribeDate` date NOT NULL,
  `IP` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subscriberId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `system_constants`
--

CREATE TABLE IF NOT EXISTS `system_constants` (
  `constantId` int(11) NOT NULL AUTO_INCREMENT,
  `constantName` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `constantValue` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` varchar(240) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`constantId`),
  UNIQUE KEY `ConstantName` (`constantName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `tagId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`tagId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE IF NOT EXISTS `tax` (
  `taxId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `zeoZoneId` int(11) NOT NULL,
  `taxPercentage` float(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`taxId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temp_cart`
--

CREATE TABLE IF NOT EXISTS `temp_cart` (
  `tempCartId` bigint(20) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(255) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `purchaseLocation` varchar(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `discountId` int(11) NOT NULL,
  `priceAfterDiscount` float(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `discountAmount` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `weight` float(10,3) NOT NULL,
  `IP` varchar(15) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`tempCartId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL COMMENT 'base64_encode(passoword)+MD5(tidiit)',
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contactNo` varchar(25) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `mobile` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `IP` int(11) DEFAULT NULL,
  `userResources` enum('site','fb','gplus','twitter') NOT NULL DEFAULT 'site',
  `userType` varchar(30) NOT NULL DEFAULT 'buyer',
  `status` tinyint(1) NOT NULL COMMENT '1=>active,0=>Inactive,2=>delete',
  `aboutMe` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `password`, `firstName`, `lastName`, `email`, `contactNo`, `DOB`, `mobile`, `fax`, `IP`, `userResources`, `userType`, `status`, `aboutMe`) VALUES
(1, 'webadmin', 'YWRtaW4=', 'Judhi', 'sahoo', 'judhi@gmail.com', NULL, NULL, NULL, NULL, NULL, 'site', 'supper_admin', 1, 'no'),
(3, 'admin', 'YWRtaW4=~6d580b31cc8891ceb9cc0ca490d1de8a', 'admin1', 'admin1', 'admin@admin.com', '9861275404', NULL, NULL, NULL, NULL, 'site', 'buyer', 1, NULL),
(4, 'sellerUser@sellerUser.com', 'c2VsbGVyVXNlcg==~6d580b31cc8891ceb9cc0ca490d1de8a', 'sellerUser', 'sellerUser', 'sellerUser@sellerUser.com', '9861275404', NULL, NULL, NULL, NULL, 'site', 'seller', 1, NULL),
(5, 'judhi@judhi.com', 'MTIzNDU=~6d580b31cc8891ceb9cc0ca490d1de8a', 'jud', 'sates', 'testa@tet.com', '9861275404', NULL, '9861275404', '06762223509', 1270, 'site', 'seller', 1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE IF NOT EXISTS `user_points` (
  `userPointsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`userPointsId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_temp_cart_shipping`
--

CREATE TABLE IF NOT EXISTS `user_temp_cart_shipping` (
  `userTempCartShippingId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `sessionId` varchar(255) NOT NULL,
  `shippingId` int(11) NOT NULL,
  `shippingCharges` float(10,2) NOT NULL,
  `purchaseLocation` varchar(5) NOT NULL,
  `shippingAddresssID` int(11) NOT NULL,
  `shippToName` varchar(255) NOT NULL,
  `IP` varchar(15) NOT NULL,
  PRIMARY KEY (`userTempCartShippingId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `userTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`userTypeId`, `userType`, `description`) VALUES
(1, 'buyer', 'Buyer'),
(2, 'seller', 'Seller'),
(3, 'support', 'Support'),
(4, 'admin', 'Admin'),
(5, 'accounts', 'Accounts'),
(6, 'logistics', 'Logistics'),
(7, 'supper_admin', 'Supper Admin'),
(8, 'marketing', 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `zeo_zone`
--

CREATE TABLE IF NOT EXISTS `zeo_zone` (
  `zeoZoneId` int(11) NOT NULL AUTO_INCREMENT,
  `zeoZoneName` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zeoZoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zeo_zone_country`
--

CREATE TABLE IF NOT EXISTS `zeo_zone_country` (
  `zeoZoneCountryId` int(11) NOT NULL AUTO_INCREMENT,
  `zeoZoneId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`zeoZoneCountryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zeo_zone_state`
--

CREATE TABLE IF NOT EXISTS `zeo_zone_state` (
  `zeoZoneStateId` int(11) NOT NULL AUTO_INCREMENT,
  `zeoZoneId` int(11) NOT NULL,
  `stateId` int(11) NOT NULL,
  PRIMARY KEY (`zeoZoneStateId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
