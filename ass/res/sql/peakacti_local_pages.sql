-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 17, 2020 at 12:41 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peakacti_local_pages`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `add_line1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `add_line2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `add_line3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `add_town_id` int(11) NOT NULL,
  `add_county_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `add_region_id` int(11) NOT NULL,
  `add_country_id` int(11) NOT NULL,
  `add_pcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `add_area_id` int(11) DEFAULT NULL,
  `add_district_id` int(11) DEFAULT NULL,
  `add_added` datetime NOT NULL,
  `add_amended` datetime NOT NULL,
  `add_disabled` datetime DEFAULT NULL,
  `add_change_by` int(11) NOT NULL,
  PRIMARY KEY (`add_id`),
  KEY `add_disabled` (`add_disabled`),
  KEY `add_pcode` (`add_pcode`),
  KEY `add_change_by` (`add_change_by`),
  KEY `add_town_id` (`add_town_id`),
  KEY `add_county_id` (`add_county_id`),
  KEY `add_region_id` (`add_region_id`),
  KEY `add_area_id` (`add_area_id`),
  KEY `add_district_id` (`add_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `ann_id` int(11) NOT NULL AUTO_INCREMENT,
  `ann_pos_id` int(11) NOT NULL,
  `ann_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ann_type_id` int(11) NOT NULL,
  `ann_img_id` int(11) NOT NULL,
  `ann_gal_id` int(11) NOT NULL,
  `ann_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ann_show_from` datetime NOT NULL,
  `ann_show_to` datetime NOT NULL,
  PRIMARY KEY (`ann_id`),
  KEY `ann_pos_id` (`ann_pos_id`),
  KEY `ann_type_id` (`ann_type_id`),
  KEY `ann_img_id` (`ann_img_id`),
  KEY `ann_gal_id` (`ann_gal_id`),
  KEY `ann_show_index` (`ann_type_id`,`ann_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `area_dis_id` int(11) NOT NULL,
  PRIMARY KEY (`area_id`),
  KEY `area_dis_id` (`area_dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_thr_id` int(11) NOT NULL,
  `com_ind_id` int(11) NOT NULL,
  `com_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `com_added` datetime NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `com_thr_id` (`com_thr_id`),
  KEY `com_ind_id` (`com_ind_id`),
  KEY `com_thread_index` (`com_thr_id`,`com_added`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
CREATE TABLE IF NOT EXISTS `costs` (
  `cos_id` int(11) NOT NULL AUTO_INCREMENT,
  `cos_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cos_amount` decimal(10,2) DEFAULT NULL,
  `cos_added` datetime NOT NULL,
  `cos_amended` datetime NOT NULL,
  `cos_disabled` datetime NOT NULL,
  PRIMARY KEY (`cos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

DROP TABLE IF EXISTS `counties`;
CREATE TABLE IF NOT EXISTS `counties` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnt_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cnt_rgn_id` int(11) NOT NULL,
  PRIMARY KEY (`cnt_id`),
  KEY `cnt_region_id` (`cnt_rgn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5095 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`cnt_id`, `cnt_name`, `cnt_rgn_id`) VALUES
(5001, 'Aberdeenshire', 0),
(5002, 'Anglesey', 0),
(5003, 'Angus', 0),
(5004, 'Argyllshire', 0),
(5005, 'Ayrshire', 0),
(5006, 'Banffshire', 0),
(5007, 'Bedfordshire', 0),
(5008, 'Berkshire', 0),
(5009, 'Berwickshire', 0),
(5010, 'Monmouthshire', 0),
(5011, 'Cardiganshire', 0),
(5012, 'Brecknockshire', 0),
(5014, 'Buckinghamshire', 0),
(5015, 'Buteshire', 0),
(5016, 'Caernarfonshire', 0),
(5017, 'Caithness', 0),
(5018, 'Cambridgeshire', 0),
(5019, 'Carmarthenshire', 0),
(5020, 'Cheshire', 0),
(5021, 'Clackmannanshire', 0),
(5022, 'Cornwall', 0),
(5023, 'Ross-shire', 0),
(5024, 'County Antrim', 0),
(5025, 'Hampshire', 0),
(5026, 'County Armagh', 0),
(5027, 'County Down', 0),
(5028, 'County Durham', 0),
(5029, 'County Fermanagh', 0),
(5030, 'County Londonderry', 0),
(5031, 'Westmorland', 0),
(5032, 'County Tyrone', 0),
(5033, 'Cumbria', 0),
(5034, 'Denbighshire', 0),
(5035, 'Derbyshire', 0),
(5036, 'Dunbartonshire', 0),
(5037, 'Merioneth', 0),
(5038, 'Devon', 0),
(5039, 'Dorset', 0),
(5040, 'Dumfriesshire', 0),
(5041, 'Northumberland', 0),
(5042, 'Surrey', 0),
(5043, 'Lancashire', 0),
(5044, 'Warwickshire', 0),
(5045, 'East Lothian', 0),
(5046, 'Perthshire', 0),
(5047, 'Essex', 0),
(5048, 'Inverness-shire', 0),
(5049, 'Fife', 0),
(5050, 'Flintshire', 0),
(5051, 'Kent', 0),
(5052, 'Glamorgan', 0),
(5053, 'Gloucestershire', 0),
(5054, 'Herefordshire', 0),
(5055, 'Hertfordshire', 0),
(5056, 'Huntingdonshire', 0),
(5057, 'Oxfordshire', 0),
(5058, 'Somerset', 0),
(5059, 'Isle of Islay', 0),
(5060, 'Isle of Lewis', 0),
(5061, 'Lincolnshire', 0),
(5062, 'Isle of Man', 0),
(5063, 'Yorkshire', 0),
(5064, 'Isle of Skye', 0),
(5065, 'Sussex', 0),
(5066, 'Isle of Wight', 0),
(5067, 'Suffolk', 0),
(5068, 'Lanarkshire', 0),
(5069, 'Kincardineshire', 0),
(5070, 'Kirkcudbrightshire', 0),
(5071, 'Leicestershire', 0),
(5072, 'West Lothian', 0),
(5073, 'Middlesex', 0),
(5074, 'Midlothian', 0),
(5075, 'Montgomeryshire', 0),
(5076, 'Morayshire', 0),
(5077, 'Renfrewshire', 0),
(5078, 'Norfolk', 0),
(5079, 'Shropshire', 0),
(5080, 'Staffordshire', 0),
(5081, 'Worcestershire', 0),
(5082, 'Northamptonshire', 0),
(5083, 'Nottinghamshire', 0),
(5084, 'Wiltshire', 0),
(5085, 'Orkney', 0),
(5086, 'Pembrokeshire', 0),
(5087, 'Peeblesshire', 0),
(5088, 'Radnorshire', 0),
(5089, 'Stirlingshire', 0),
(5090, 'Sutherland', 0),
(5091, 'Roxburghshire', 0),
(5092, 'Rutland', 0),
(5093, 'Selkirkshire', 0),
(5094, 'Wigtownshire', 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cty_id` int(11) NOT NULL AUTO_INCREMENT,
  `cty_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`cty_id`),
  KEY `cty_name` (`cty_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dis_county_id` int(11) NOT NULL,
  PRIMARY KEY (`dis_id`),
  UNIQUE KEY `dis_county_index` (`dis_county_id`,`dis_name`),
  KEY `dis_name` (`dis_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employments`
--

DROP TABLE IF EXISTS `employments`;
CREATE TABLE IF NOT EXISTS `employments` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_pos_id` int(11) NOT NULL,
  `emp_typ_id` int(11) NOT NULL,
  `emp_wanted` tinyint(1) DEFAULT '0',
  `emp_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `emp_img_id` int(11) DEFAULT NULL,
  `emp_gal_id` int(11) DEFAULT NULL,
  `emp_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `emp_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `emp_show_from` date NOT NULL,
  `emp_show_to` date NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_pos_id` (`emp_pos_id`),
  KEY `emp_typ_id` (`emp_typ_id`),
  KEY `emp_img_id` (`emp_img_id`),
  KEY `emp_gal_id` (`emp_gal_id`),
  KEY `emp_wanted_index` (`emp_wanted`,`emp_show_from`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `evt_id` int(11) NOT NULL AUTO_INCREMENT,
  `evt_pos_id` int(11) NOT NULL,
  `evt_typ_id` int(11) NOT NULL,
  `evt_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `evt_add_id` int(11) DEFAULT NULL,
  `evt_img_id` int(11) DEFAULT NULL,
  `evt_gal_id` int(11) DEFAULT NULL,
  `evt_cost_id` int(11) DEFAULT NULL,
  `evt_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `evt_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `evt_show_from` datetime NOT NULL,
  `evt_show_to` datetime NOT NULL,
  `evt_meet_start` datetime NOT NULL,
  `evt_meet_end` datetime NOT NULL,
  `evt_meet_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`evt_id`),
  KEY `evt_pos_id` (`evt_pos_id`),
  KEY `evt_typ_id` (`evt_typ_id`),
  KEY `evt_add_id` (`evt_add_id`),
  KEY `evt_img_id` (`evt_img_id`),
  KEY `evt_gal_id` (`evt_gal_id`),
  KEY `evt_cost_id` (`evt_cost_id`),
  KEY `evt_meet_start` (`evt_meet_start`),
  KEY `evt_start_index` (`evt_typ_id`,`evt_meet_start`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `gal_id` int(11) NOT NULL AUTO_INCREMENT,
  `gal_ind_id` int(11) NOT NULL,
  `gal_typ_id` int(11) NOT NULL,
  `gal_gli_id` int(11) NOT NULL,
  `gal_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `gal_added` datetime NOT NULL,
  `gal_amended` datetime NOT NULL,
  `gal_disabled` datetime DEFAULT NULL,
  `gal_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`gal_id`),
  KEY `gal_ind_id` (`gal_ind_id`,`gal_typ_id`),
  KEY `gal_name` (`gal_name`),
  KEY `gal_typ_id` (`gal_typ_id`),
  KEY `gal_gli_id` (`gal_gli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallinks`
--

DROP TABLE IF EXISTS `gallinks`;
CREATE TABLE IF NOT EXISTS `gallinks` (
  `gli_id` int(11) NOT NULL AUTO_INCREMENT,
  `gli_img_id` int(11) NOT NULL,
  `gli_gal_id` int(11) NOT NULL,
  `gli_order` int(11) NOT NULL,
  PRIMARY KEY (`gli_id`),
  UNIQUE KEY `gli_gal_order` (`gli_gal_id`,`gli_order`) USING BTREE,
  KEY `gli_img_id` (`gli_img_id`),
  KEY `gli_gal_id` (`gli_gal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_ind_id` int(11) NOT NULL,
  `grp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `grp_total` int(11) NOT NULL,
  `grp_added` datetime NOT NULL,
  `grp_amended` datetime NOT NULL,
  `grp_disabled` datetime DEFAULT NULL,
  `grp_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`grp_id`),
  KEY `grp_ind_id` (`grp_ind_id`),
  KEY `grp_name` (`grp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_ind_id` int(11) NOT NULL,
  `img_typ_id` int(11) DEFAULT NULL,
  `img_filename` varchar(30) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `img_ext` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `img_caption` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `img_added` datetime NOT NULL,
  `img_amended` datetime NOT NULL,
  `img_disabled` datetime DEFAULT NULL,
  `img_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`img_id`),
  UNIQUE KEY `img_filename` (`img_filename`),
  KEY `img_ind_id` (`img_ind_id`),
  KEY `img_typ_id` (`img_typ_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `img_ind_id`, `img_typ_id`, `img_filename`, `img_ext`, `img_caption`, `img_added`, `img_amended`, `img_disabled`, `img_changed_by`) VALUES
(100002, 14, NULL, NULL, 'png', '', '2020-06-04 15:59:37', '2020-06-04 15:59:37', NULL, 14),
(100003, 14, NULL, NULL, 'png', '', '2020-06-04 16:00:40', '2020-06-04 16:00:40', NULL, 14),
(100004, 14, NULL, NULL, 'png', '', '2020-06-04 17:33:48', '2020-06-04 17:33:48', NULL, 14),
(100005, 14, NULL, NULL, 'png', '', '2020-06-04 19:31:52', '2020-06-04 19:31:52', NULL, 14),
(100006, 14, NULL, NULL, 'png', '', '2020-06-04 19:32:10', '2020-06-04 19:32:10', NULL, 14),
(100007, 15, NULL, NULL, 'png', '', '2020-06-04 20:38:03', '2020-06-04 20:38:03', NULL, 15),
(100008, 15, NULL, NULL, 'png', '', '2020-06-04 20:38:23', '2020-06-04 20:38:23', NULL, 15),
(100009, 15, NULL, NULL, 'png', '', '2020-06-04 20:38:38', '2020-06-04 20:38:38', NULL, 15),
(100010, 15, NULL, NULL, 'png', '', '2020-06-04 20:38:58', '2020-06-04 20:38:58', NULL, 15),
(100011, 16, NULL, NULL, 'png', '', '2020-06-04 21:03:04', '2020-06-04 21:03:04', NULL, 16),
(100012, 16, NULL, NULL, 'png', '', '2020-06-04 21:21:45', '2020-06-04 21:21:45', NULL, 16),
(100013, 17, NULL, NULL, 'png', '', '2020-06-04 23:08:15', '2020-06-04 23:08:15', NULL, 17),
(100014, 19, NULL, NULL, 'png', '', '2020-06-04 23:18:42', '2020-06-04 23:18:42', NULL, 19),
(100015, 20, NULL, NULL, 'png', '', '2020-06-04 23:28:19', '2020-06-04 23:28:19', NULL, 20),
(100016, 20, NULL, NULL, 'png', '', '2020-06-04 23:36:37', '2020-06-04 23:36:37', NULL, 20),
(100017, 20, NULL, NULL, 'png', '', '2020-06-04 23:44:37', '2020-06-04 23:44:37', NULL, 20),
(100018, 20, NULL, NULL, 'png', '', '2020-06-04 23:48:27', '2020-06-04 23:48:27', NULL, 20),
(100019, 20, NULL, NULL, 'png', '', '2020-06-04 23:51:19', '2020-06-04 23:51:19', NULL, 20),
(100020, 20, NULL, NULL, 'png', '', '2020-06-04 23:53:51', '2020-06-04 23:53:51', NULL, 20),
(100021, 20, NULL, NULL, 'png', '', '2020-06-04 23:54:57', '2020-06-04 23:54:57', NULL, 20),
(100022, 20, NULL, NULL, 'png', '', '2020-06-05 00:01:05', '2020-06-05 00:01:05', NULL, 20),
(100023, 20, NULL, NULL, 'png', '', '2020-06-05 00:01:32', '2020-06-05 00:01:32', NULL, 20),
(100024, 20, NULL, NULL, 'png', '', '2020-06-05 00:04:06', '2020-06-05 00:04:06', NULL, 20),
(100025, 21, NULL, NULL, 'png', '', '2020-06-06 00:40:37', '2020-06-06 00:40:37', NULL, 21),
(100026, 1, NULL, NULL, 'png', '', '2020-06-07 22:29:52', '2020-06-07 22:29:52', NULL, 1),
(100027, 1, NULL, NULL, 'png', '', '2020-06-08 22:31:58', '2020-06-08 22:31:58', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

DROP TABLE IF EXISTS `individuals`;
CREATE TABLE IF NOT EXISTS `individuals` (
  `ind_id` int(11) NOT NULL AUTO_INCREMENT,
  `ind_add_id` int(11) DEFAULT NULL,
  `ind_img_id` int(11) DEFAULT NULL,
  `ind_title_id` int(11) DEFAULT NULL,
  `ind_role_id` int(11) NOT NULL,
  `ind_firstname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ind_middles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_lastname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ind_screen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ind_pword` varbinary(255) NOT NULL,
  `ind_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_ip` varbinary(255) DEFAULT NULL,
  `ind_mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ind_facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_twitter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ind_added` datetime NOT NULL,
  `ind_amended` datetime NOT NULL,
  `ind_disabled` datetime DEFAULT NULL,
  `ind_changed_by` int(11) NOT NULL,
  `ind_last_on` datetime NOT NULL,
  PRIMARY KEY (`ind_id`),
  UNIQUE KEY `ind_email` (`ind_email`),
  UNIQUE KEY `ind_pword_index` (`ind_email`,`ind_pword`),
  UNIQUE KEY `ind_screen` (`ind_screen`),
  UNIQUE KEY `ind_instagram` (`ind_instagram`),
  UNIQUE KEY `ind_twitter` (`ind_twitter`),
  UNIQUE KEY `ind_facebook` (`ind_facebook`),
  UNIQUE KEY `ind_mobile` (`ind_mobile`),
  KEY `ind_add_id` (`ind_add_id`),
  KEY `ind_img_id` (`ind_img_id`),
  KEY `ind_title_id` (`ind_title_id`),
  KEY `ind_name_index` (`ind_lastname`,`ind_firstname`),
  KEY `ind_role_id` (`ind_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`ind_id`, `ind_add_id`, `ind_img_id`, `ind_title_id`, `ind_role_id`, `ind_firstname`, `ind_middles`, `ind_lastname`, `ind_screen`, `ind_pword`, `ind_phone`, `ind_ip`, `ind_mobile`, `ind_email`, `ind_facebook`, `ind_twitter`, `ind_instagram`, `ind_added`, `ind_amended`, `ind_disabled`, `ind_changed_by`, `ind_last_on`) VALUES
(1, NULL, 100027, 15, 0, 'Gordon', '', 'Conway', 'GordonC001', 0x243279243132246d6776464d6a726a44526574414f496f5278456b752e487548396b4868636f30622f593949546736307a4e2f4b534b6f715a767361, NULL, 0x24327924313224584556432f6171474854707955426d6347535464632e657955562f614576495835457630763549644e485446644831592f68665571, NULL, 'gconwayuk@gmail.com', NULL, NULL, NULL, '2020-06-07 22:25:42', '2020-06-08 22:31:58', NULL, 1, '2020-06-16 22:55:18'),
(2, NULL, NULL, NULL, 0, 'Cornelius', '', 'Fudge', 'fudgey', 0x24327924313224355367327130674d4130595175615244356d4c56572e637849497144596f4552377a50543071454e3157543958726e694955586875, NULL, 0x24327924313224496d452e6c316d754368724c4d39393738412f743465456d6146763379367141447761586d755a3859546e4f32634e4b2f4c4f346d, NULL, 'cfrudgeuk@gmail.com', NULL, NULL, NULL, '2020-06-13 21:42:54', '2020-06-13 21:42:54', NULL, 2, '0000-00-00 00:00:00'),
(3, NULL, NULL, NULL, 0, 'Ken', '', 'Wake', 'KenW001', 0x243279243132244d736d384c6a6234416f577079615378696c4a56322e2f6c4a732f6a7150524772414357744763754c65746d447567574f484c6d69, NULL, 0x243279243132247052536a56523458546f593445413435504a367157756c6c71645a575670785571454f77656e586c624748673139324c72372f524f, NULL, 'kenwake@nottinghamcollege.ac.uk', NULL, NULL, NULL, '2020-06-15 23:32:58', '2020-06-15 23:32:58', NULL, 3, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `indroles`
--

DROP TABLE IF EXISTS `indroles`;
CREATE TABLE IF NOT EXISTS `indroles` (
  `ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `ir_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`ir_id`),
  KEY `ir_name` (`ir_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `indroles`
--

INSERT INTO `indroles` (`ir_id`, `ir_name`) VALUES
(8, 'administrator'),
(6, 'contributor'),
(7, 'editor'),
(5, 'none');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_pos_id` int(11) NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `job_typ_id` int(11) NOT NULL,
  `job_add_id` int(11) DEFAULT NULL,
  `job_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `job_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `job_img_id` int(11) DEFAULT NULL,
  `job_gal_id` int(11) DEFAULT NULL,
  `job_start` datetime NOT NULL,
  `job_show_from` datetime NOT NULL,
  `job_show_to` datetime NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `job_pos_id` (`job_pos_id`),
  KEY `job_typ_id` (`job_typ_id`),
  KEY `job_add_id` (`job_add_id`),
  KEY `job_img_id` (`job_img_id`),
  KEY `job_gal_id` (`job_gal_id`),
  KEY `job_show_index` (`job_typ_id`,`job_show_from`),
  KEY `job_show_from` (`job_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `new_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_pos_id` int(11) NOT NULL,
  `new_typ_id` int(11) NOT NULL,
  `new_img_id` int(11) DEFAULT NULL,
  `new_gal_id` int(11) DEFAULT NULL,
  `new_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `new_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `new_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `new_show_from` datetime NOT NULL,
  `new_show_to` datetime NOT NULL,
  PRIMARY KEY (`new_id`),
  KEY `new_pos_id` (`new_pos_id`),
  KEY `new_typ_id` (`new_typ_id`),
  KEY `new_img_id` (`new_img_id`),
  KEY `new_gal_id` (`new_gal_id`),
  KEY `new_show_index` (`new_typ_id`,`new_show_from`),
  KEY `new_show_from` (`new_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `off_id` int(11) NOT NULL AUTO_INCREMENT,
  `off_pos_id` int(11) NOT NULL,
  `off_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `off_typ_id` int(11) NOT NULL,
  `off_add_id` int(11) DEFAULT NULL,
  `off_img_id` int(11) DEFAULT NULL,
  `off_gal_id` int(11) DEFAULT NULL,
  `off_cost_id` int(11) DEFAULT NULL,
  `off_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `off_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `off_show_from` datetime NOT NULL,
  `off_show_to` datetime NOT NULL,
  PRIMARY KEY (`off_id`),
  KEY `off_pos_id` (`off_pos_id`),
  KEY `off_typ_id` (`off_typ_id`),
  KEY `off_add_id` (`off_add_id`,`off_show_from`),
  KEY `off_img_id` (`off_img_id`),
  KEY `off_gal_id` (`off_gal_id`),
  KEY `off_cost_id` (`off_cost_id`),
  KEY `off_show_from` (`off_show_from`),
  KEY `off_show_index` (`off_typ_id`,`off_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_add_same` tinyint(1) NOT NULL DEFAULT '0',
  `org_add_id` int(11) NOT NULL,
  `org_ind_id` int(11) NOT NULL,
  `org_grp_id` int(11) DEFAULT NULL,
  `org_img_id` int(11) DEFAULT NULL,
  `org_gal_id` int(11) DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_strap` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `org_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `org_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `org_typ_id` int(11) NOT NULL,
  `org_sic_id` int(11) DEFAULT NULL,
  `org_conum` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_reg_id` tinyint(1) DEFAULT NULL,
  `org_vatnum` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_twitter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `org_added` datetime NOT NULL,
  `org_amended` datetime NOT NULL,
  `org_disabled` datetime DEFAULT NULL,
  `org_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`org_id`),
  KEY `org_add_id` (`org_add_id`),
  KEY `org_ind_id` (`org_ind_id`),
  KEY `org_grp_id` (`org_grp_id`),
  KEY `org_typ_id` (`org_typ_id`),
  KEY `org_sic_id` (`org_sic_id`),
  KEY `org_reg_id` (`org_reg_id`),
  KEY `org_img_id` (`org_img_id`),
  KEY `org_gal_id` (`org_gal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orgindlinks`
--

DROP TABLE IF EXISTS `orgindlinks`;
CREATE TABLE IF NOT EXISTS `orgindlinks` (
  `oil_id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_org_id` int(11) NOT NULL,
  `oil_ind_id` int(11) NOT NULL,
  `oil_owner` tinyint(1) NOT NULL DEFAULT '0',
  `oil_org_role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `oil_added` datetime NOT NULL,
  `oil_amended` datetime NOT NULL,
  `oil_disabled` datetime DEFAULT NULL,
  `oil_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`oil_id`),
  UNIQUE KEY `oil_org_index` (`oil_org_id`,`oil_ind_id`),
  UNIQUE KEY `oil_ind_index` (`oil_ind_id`,`oil_org_id`),
  KEY `oil_org_id` (`oil_org_id`),
  KEY `oil_ind_id` (`oil_ind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orgindroles`
--

DROP TABLE IF EXISTS `orgindroles`;
CREATE TABLE IF NOT EXISTS `orgindroles` (
  `oir_id` int(11) NOT NULL AUTO_INCREMENT,
  `oir_role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`oir_id`),
  KEY `oir_role` (`oir_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_type_id` int(11) NOT NULL,
  `pos_ind_id` int(11) NOT NULL,
  `pos_org_id` int(11) DEFAULT NULL,
  `pos_added` datetime NOT NULL,
  `pos_amended` datetime NOT NULL,
  `pos_disabled` datetime DEFAULT NULL,
  `pos_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `pos_type_id` (`pos_type_id`),
  KEY `pos_ind_id` (`pos_ind_id`),
  KEY `pos_added` (`pos_added`),
  KEY `pos_org_id` (`pos_org_id`),
  KEY `pos_changed_by` (`pos_changed_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `rgn_id` int(11) NOT NULL AUTO_INCREMENT,
  `rgn_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rgn_cty_id` int(11) NOT NULL,
  PRIMARY KEY (`rgn_id`),
  KEY `rgn_cty_id` (`rgn_cty_id`),
  KEY `rgn_name` (`rgn_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regplaces`
--

DROP TABLE IF EXISTS `regplaces`;
CREATE TABLE IF NOT EXISTS `regplaces` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `reg_place` (`reg_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
CREATE TABLE IF NOT EXISTS `routes` (
  `rte_id` int(11) NOT NULL AUTO_INCREMENT,
  `rte_pos_id` int(11) NOT NULL,
  `rte_typ_id` int(11) NOT NULL,
  `rte_places_id` int(11) NOT NULL,
  `rte_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rte_add_id` int(11) DEFAULT NULL,
  `rte_img_id` int(11) DEFAULT NULL,
  `rte_gal_id` int(11) DEFAULT NULL,
  `rte_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `rte_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `rte_map` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `rte_gpx` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `rte_meet_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`rte_id`),
  KEY `rte_pos_id` (`rte_pos_id`),
  KEY `rte_add_id` (`rte_add_id`),
  KEY `rte_img_id` (`rte_img_id`),
  KEY `rte_gal_id` (`rte_gal_id`),
  KEY `rte_typ_id` (`rte_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rteplaces`
--

DROP TABLE IF EXISTS `rteplaces`;
CREATE TABLE IF NOT EXISTS `rteplaces` (
  `rpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rpl_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `rpl_rgn_id` int(11) NOT NULL,
  PRIMARY KEY (`rpl_id`),
  KEY `rpl_name` (`rpl_name`),
  KEY `rpl_rgn_id` (`rpl_rgn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesandwants`
--

DROP TABLE IF EXISTS `salesandwants`;
CREATE TABLE IF NOT EXISTS `salesandwants` (
  `saw_id` int(11) NOT NULL AUTO_INCREMENT,
  `saw_pos_id` int(11) NOT NULL,
  `saw_typ_id` int(11) NOT NULL,
  `saw_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `saw_add_id` int(11) DEFAULT NULL,
  `saw_img_id` int(11) DEFAULT NULL,
  `saw_gal_id` int(11) DEFAULT NULL,
  `saw_cost_id` int(11) DEFAULT NULL,
  `saw_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `saw_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  `saw_show_from` datetime NOT NULL,
  `saw_show_to` datetime NOT NULL,
  PRIMARY KEY (`saw_id`),
  KEY `saw_typ_id` (`saw_typ_id`),
  KEY `saw_pos_id` (`saw_pos_id`),
  KEY `saw_add_id` (`saw_add_id`),
  KEY `saw_img_id` (`saw_img_id`),
  KEY `saw_gal_id` (`saw_gal_id`),
  KEY `saw_cost_id` (`saw_cost_id`),
  KEY `saw_show_from` (`saw_show_from`),
  KEY `saw_show_index` (`saw_typ_id`,`saw_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siccodes`
--

DROP TABLE IF EXISTS `siccodes`;
CREATE TABLE IF NOT EXISTS `siccodes` (
  `sic_id` int(11) NOT NULL AUTO_INCREMENT,
  `sic_code` int(11) NOT NULL,
  `sic_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`sic_id`),
  KEY `sic_code` (`sic_code`),
  KEY `sic_name` (`sic_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
CREATE TABLE IF NOT EXISTS `threads` (
  `thr_id` int(11) NOT NULL AUTO_INCREMENT,
  `thr_pos_id` int(11) NOT NULL,
  `thr_subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `thr_typ_id` int(11) NOT NULL,
  `thr_typ_id_id` int(11) DEFAULT NULL,
  `thr_img_id` int(11) DEFAULT NULL,
  `com_show_from` datetime NOT NULL,
  `com_show_to` datetime NOT NULL,
  PRIMARY KEY (`thr_id`),
  KEY `thr_pos_id` (`thr_pos_id`) USING BTREE,
  KEY `thr_typ_id` (`thr_typ_id`) USING BTREE,
  KEY `thr_img_id` (`thr_img_id`) USING BTREE,
  KEY `thr_typ_id_id` (`thr_typ_id_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `title_name` (`title_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `title_name`) VALUES
(20, 'Doctor'),
(13, 'Dr'),
(21, 'Father'),
(14, 'Miss'),
(15, 'Mr'),
(16, 'Mrs'),
(17, 'Ms'),
(18, 'Mx'),
(19, 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
CREATE TABLE IF NOT EXISTS `towns` (
  `town_id` int(11) NOT NULL AUTO_INCREMENT,
  `town_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `town_cnt_id` int(11) NOT NULL,
  PRIMARY KEY (`town_id`),
  KEY `town_name` (`town_name`),
  KEY `town_county_id` (`town_cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `typ_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`typ_id`),
  UNIQUE KEY `typ_type` (`typ_type`,`typ_name`),
  KEY `typ_name` (`typ_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `test` FOREIGN KEY (`ann_type_id`) REFERENCES `types` (`typ_id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
