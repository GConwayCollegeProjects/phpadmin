-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2020 at 02:50 PM
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
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_line1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `add_line2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_line3` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_town_id` int(11) NOT NULL,
  `add_pcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `add_area_id` int(11) DEFAULT NULL,
  `add_district_id` int(11) DEFAULT NULL,
  `add_added` datetime NOT NULL,
  `add_amended` datetime NOT NULL,
  `add_disabled` datetime DEFAULT NULL,
  `add_by_id` int(11) NOT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `ann_id` int(11) NOT NULL AUTO_INCREMENT,
  `ann_pos_id` int(11) NOT NULL,
  `ann_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_ind_id` int(11) NOT NULL,
  `ann_annation_id` int(11) NOT NULL,
  `ann_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_gal_id` int(11) NOT NULL,
  `ann_cost_id` int(11) NOT NULL,
  `ann_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_show_from` datetime NOT NULL,
  `ann_show_to` datetime NOT NULL,
  `ann_meet_start` datetime NOT NULL,
  `ann_meet_end` datetime NOT NULL,
  `ann_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_added` datetime NOT NULL,
  `ann_amended` datetime NOT NULL,
  `ann_disabled` datetime NOT NULL,
  PRIMARY KEY (`ann_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_pos_id` int(11) NOT NULL,
  `com_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `com_ind_id` int(11) NOT NULL,
  `com_location_id` int(11) NOT NULL,
  `com_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `com_gal_id` int(11) NOT NULL,
  `com_cost_id` int(11) NOT NULL,
  `com_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `com_show_from` datetime NOT NULL,
  `com_show_to` datetime NOT NULL,
  `com_meet_start` datetime NOT NULL,
  `com_meet_end` datetime NOT NULL,
  `com_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `com_added` datetime NOT NULL,
  `com_amended` datetime NOT NULL,
  `com_disabled` datetime NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
CREATE TABLE IF NOT EXISTS `costs` (
  `cos_id` int(11) NOT NULL AUTO_INCREMENT,
  `cos_pos_id` int(11) NOT NULL,
  `cos_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cos_ind_id` int(11) NOT NULL,
  `cos_location_id` int(11) NOT NULL,
  `cos_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cos_gal_id` int(11) NOT NULL,
  `cos_cost_id` int(11) NOT NULL,
  `cos_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cos_show_from` datetime NOT NULL,
  `cos_show_to` datetime NOT NULL,
  `cos_meet_start` datetime NOT NULL,
  `cos_meet_end` datetime NOT NULL,
  `cos_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cos_added` datetime NOT NULL,
  `cos_amended` datetime NOT NULL,
  `cos_disabled` datetime NOT NULL,
  PRIMARY KEY (`cos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employments`
--

DROP TABLE IF EXISTS `employments`;
CREATE TABLE IF NOT EXISTS `employments` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_pos_id` int(11) NOT NULL,
  `emp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_ind_id` int(11) NOT NULL,
  `emp_location_id` int(11) NOT NULL,
  `emp_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_gal_id` int(11) NOT NULL,
  `emp_cost_id` int(11) NOT NULL,
  `emp_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_show_from` datetime NOT NULL,
  `emp_show_to` datetime NOT NULL,
  `emp_meet_start` datetime NOT NULL,
  `emp_meet_end` datetime NOT NULL,
  `emp_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_added` datetime NOT NULL,
  `emp_amended` datetime NOT NULL,
  `emp_disabled` datetime NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `evt_id` int(11) NOT NULL AUTO_INCREMENT,
  `evt_pos_id` int(11) NOT NULL,
  `evt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evt_ind_id` int(11) NOT NULL,
  `evt_location_id` int(11) NOT NULL,
  `evt_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evt_gal_id` int(11) NOT NULL,
  `evt_cost_id` int(11) NOT NULL,
  `evt_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evt_show_from` datetime NOT NULL,
  `evt_show_to` datetime NOT NULL,
  `evt_meet_start` datetime NOT NULL,
  `evt_meet_end` datetime NOT NULL,
  `evt_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evt_added` datetime NOT NULL,
  `evt_amended` datetime NOT NULL,
  `evt_disabled` datetime NOT NULL,
  PRIMARY KEY (`evt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `gal_id` int(11) NOT NULL AUTO_INCREMENT,
  `gal_type_id` int(11) NOT NULL,
  `gal_link_id` int(11) NOT NULL,
  `gal_added` int(11) NOT NULL,
  `gal_ind_id` int(11) NOT NULL,
  `gal_disabled` datetime NOT NULL,
  PRIMARY KEY (`gal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `grp_total` int(11) NOT NULL,
  PRIMARY KEY (`grp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_ind_id` int(11) NOT NULL,
  `img_gal_id` int(11) NOT NULL,
  `img_gal_order` int(11) NOT NULL,
  `img_ext` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--


-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

DROP TABLE IF EXISTS `individuals`;
CREATE TABLE IF NOT EXISTS `individuals` (
  `ind_id` int(11) NOT NULL AUTO_INCREMENT,
  `ind_add_id` int(11) NOT NULL,
  `ind_title_id` int(11) NOT NULL,
  `ind_firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_middles` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_screen` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_pword` varbinary(255) NOT NULL,
  `ind_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_twitter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_instagram` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_img_id` int(11) NOT NULL,
  PRIMARY KEY (`ind_id`),
  UNIQUE KEY `ind_email` (`ind_email`),
  UNIQUE KEY `ind_facebook` (`ind_facebook`),
  UNIQUE KEY `ind_twitter` (`ind_twitter`),
  UNIQUE KEY `ind_instagram` (`ind_instagram`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `individuals`
--



-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_pos_id` int(11) NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_ind_id` int(11) NOT NULL,
  `job_location_id` int(11) NOT NULL,
  `job_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_gal_id` int(11) NOT NULL,
  `job_cost_id` int(11) NOT NULL,
  `job_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_show_from` datetime NOT NULL,
  `job_show_to` datetime NOT NULL,
  `job_meet_start` datetime NOT NULL,
  `job_meet_end` datetime NOT NULL,
  `job_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_added` datetime NOT NULL,
  `job_amended` datetime NOT NULL,
  `job_disabled` datetime NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_pos_id` int(11) NOT NULL,
  `loc_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loc_ind_id` int(11) NOT NULL,
  `loc_location_id` int(11) NOT NULL,
  `loc_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loc_gal_id` int(11) NOT NULL,
  `loc_cost_id` int(11) NOT NULL,
  `loc_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loc_show_from` datetime NOT NULL,
  `loc_show_to` datetime NOT NULL,
  `loc_meet_start` datetime NOT NULL,
  `loc_meet_end` datetime NOT NULL,
  `loc_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `loc_added` datetime NOT NULL,
  `loc_amended` datetime NOT NULL,
  `loc_disabled` datetime NOT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `new_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_pos_id` int(11) NOT NULL,
  `new_newstype_id` int(11) NOT NULL,
  `new_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `new_gal_id` int(11) NOT NULL,
  `new_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `new_blob` blob NOT NULL,
  `new_eff_date` date NOT NULL,
  `new_end_date` date NOT NULL,
  `new_amended` datetime NOT NULL,
  `new_ind_id` int(11) NOT NULL,
  PRIMARY KEY (`new_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `off_id` int(11) NOT NULL AUTO_INCREMENT,
  `off_pos_id` int(11) NOT NULL,
  `off_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `off_ind_id` int(11) NOT NULL,
  `off_location_id` int(11) NOT NULL,
  `off_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `off_gal_id` int(11) NOT NULL,
  `off_cost_id` int(11) NOT NULL,
  `off_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `off_show_from` datetime NOT NULL,
  `off_show_to` datetime NOT NULL,
  `off_meet_start` datetime NOT NULL,
  `off_meet_end` datetime NOT NULL,
  `off_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `off_added` datetime NOT NULL,
  `off_amended` datetime NOT NULL,
  `off_disabled` datetime NOT NULL,
  PRIMARY KEY (`off_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oilinks`
--

DROP TABLE IF EXISTS `oilinks`;
CREATE TABLE IF NOT EXISTS `oilinks` (
  `oil_id` int(11) NOT NULL AUTO_INCREMENT,
  `oil_org_id` int(11) NOT NULL,
  `oil_ind_id` int(11) NOT NULL,
  `oil_amended` datetime NOT NULL,
  `oil_by` int(11) NOT NULL,
  PRIMARY KEY (`oil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
CREATE TABLE IF NOT EXISTS `organisations` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_add_id` int(11) NOT NULL,
  `org_ind_id` int(11) NOT NULL,
  `org_grp_id` int(11) NOT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_strap` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_type_id` int(11) DEFAULT NULL,
  `org_sic_id` int(8) NOT NULL,
  `org_conum` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_reg_id` int(1) NOT NULL,
  `org_vatnum` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_twitter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_instagram` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_added` datetime NOT NULL,
  `org_amended` datetime NOT NULL,
  `org_disabled` datetime NOT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_type_id` int(11) NOT NULL,
  `pos_ind_id` int(11) NOT NULL,
  `pos_added` datetime NOT NULL,
  `pos_org_id` int(11) NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `pos_type_id` (`pos_type_id`),
  KEY `pos_ind_id` (`pos_ind_id`),
  KEY `pos_added` (`pos_added`),
  KEY `pos_org_id` (`pos_org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
CREATE TABLE IF NOT EXISTS `routes` (
  `rte_id` int(11) NOT NULL AUTO_INCREMENT,
  `rte_pos_id` int(11) NOT NULL,
  `rte_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rte_ind_id` int(11) NOT NULL,
  `rte_location_id` int(11) NOT NULL,
  `rte_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rte_gal_id` int(11) NOT NULL,
  `rte_cost_id` int(11) NOT NULL,
  `rte_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rte_show_from` datetime NOT NULL,
  `rte_show_to` datetime NOT NULL,
  `rte_meet_start` datetime NOT NULL,
  `rte_meet_end` datetime NOT NULL,
  `rte_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rte_added` datetime NOT NULL,
  `rte_amended` datetime NOT NULL,
  `rte_disabled` datetime NOT NULL,
  PRIMARY KEY (`rte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesandwants`
--

DROP TABLE IF EXISTS `salesandwants`;
CREATE TABLE IF NOT EXISTS `salesandwants` (
  `saw_id` int(11) NOT NULL AUTO_INCREMENT,
  `saw_pos_id` int(11) NOT NULL,
  `saw_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `saw_ind_id` int(11) NOT NULL,
  `saw_location_id` int(11) NOT NULL,
  `saw_img_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `saw_gal_id` int(11) NOT NULL,
  `saw_cost_id` int(11) NOT NULL,
  `saw_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `saw_show_from` datetime NOT NULL,
  `saw_show_to` datetime NOT NULL,
  `saw_meet_start` datetime NOT NULL,
  `saw_meet_end` datetime NOT NULL,
  `saw_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `saw_added` datetime NOT NULL,
  `saw_amended` datetime NOT NULL,
  `saw_disabled` datetime NOT NULL,
  PRIMARY KEY (`saw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
CREATE TABLE IF NOT EXISTS `towns` (
  `town_id` int(11) NOT NULL AUTO_INCREMENT,
  `town_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `town_county_id` int(11) NOT NULL,
  `town_country_id` int(11) NOT NULL,
  PRIMARY KEY (`town_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_type` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `typ_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typ_id`),
  KEY `typ_name` (`typ_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xtprofiles`
--

DROP TABLE IF EXISTS `xtprofiles`;
CREATE TABLE IF NOT EXISTS `xtprofiles` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_xtyp_id` int(11) NOT NULL,
  `pro_text` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
