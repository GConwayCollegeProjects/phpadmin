-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 27, 2020 at 02:39 PM
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
  `add_desc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_line1` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `add_line2` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_line3` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_town_id` int(11) NOT NULL,
  `add_county_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `add_region_id` int(11) NOT NULL,
  `add_country_id` int(11) NOT NULL,
  `add_pcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `ann_id` int(11) NOT NULL AUTO_INCREMENT,
  `ann_pos_id` int(11) NOT NULL,
  `ann_subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_type_id` int(11) NOT NULL,
  `ann_img_id` int(11) NOT NULL,
  `ann_gal_id` int(11) NOT NULL,
  `ann_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ann_show_from` datetime NOT NULL,
  `ann_show_to` datetime NOT NULL,
  PRIMARY KEY (`ann_id`),
  KEY `ann_pos_id` (`ann_pos_id`),
  KEY `ann_type_id` (`ann_type_id`),
  KEY `ann_img_id` (`ann_img_id`),
  KEY `ann_gal_id` (`ann_gal_id`),
  KEY `ann_show_index` (`ann_type_id`,`ann_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `area_dis_id` int(11) NOT NULL,
  PRIMARY KEY (`area_id`),
  KEY `area_dis_id` (`area_dis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_thr_id` int(11) NOT NULL,
  `com_ind_id` int(11) NOT NULL,
  `com_text` text COLLATE utf8_unicode_ci NOT NULL,
  `com_added` datetime NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `com_thr_id` (`com_thr_id`),
  KEY `com_ind_id` (`com_ind_id`),
  KEY `com_thread_index` (`com_thr_id`,`com_added`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

DROP TABLE IF EXISTS `costs`;
CREATE TABLE IF NOT EXISTS `costs` (
  `cos_id` int(11) NOT NULL AUTO_INCREMENT,
  `cos_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cos_amount` decimal(10,2) DEFAULT NULL,
  `cos_added` datetime NOT NULL,
  `cos_amended` datetime NOT NULL,
  `cos_disabled` datetime NOT NULL,
  PRIMARY KEY (`cos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

DROP TABLE IF EXISTS `counties`;
CREATE TABLE IF NOT EXISTS `counties` (
  `cnt_id` int(11) NOT NULL AUTO_INCREMENT,
  `cnt_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cnt_rgn_id` int(11) NOT NULL,
  PRIMARY KEY (`cnt_id`),
  KEY `cnt_region_id` (`cnt_rgn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cty_id` int(11) NOT NULL AUTO_INCREMENT,
  `cty_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cty_id`),
  KEY `cty_name` (`cty_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
CREATE TABLE IF NOT EXISTS `districts` (
  `dis_id` int(11) NOT NULL AUTO_INCREMENT,
  `dis_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dis_county_id` int(11) NOT NULL,
  PRIMARY KEY (`dis_id`),
  UNIQUE KEY `dis_county_index` (`dis_county_id`,`dis_name`),
  KEY `dis_name` (`dis_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `emp_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `emp_img_id` int(11) DEFAULT NULL,
  `emp_gal_id` int(11) DEFAULT NULL,
  `emp_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `emp_html` text COLLATE utf8_unicode_ci,
  `emp_show_from` date NOT NULL,
  `emp_show_to` date NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_pos_id` (`emp_pos_id`),
  KEY `emp_typ_id` (`emp_typ_id`),
  KEY `emp_img_id` (`emp_img_id`),
  KEY `emp_gal_id` (`emp_gal_id`),
  KEY `emp_wanted_index` (`emp_wanted`,`emp_show_from`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `evt_id` int(11) NOT NULL AUTO_INCREMENT,
  `evt_pos_id` int(11) NOT NULL,
  `evt_typ_id` int(11) NOT NULL,
  `evt_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `evt_add_id` int(11) DEFAULT NULL,
  `evt_img_id` int(11) DEFAULT NULL,
  `evt_gal_id` int(11) DEFAULT NULL,
  `evt_cost_id` int(11) DEFAULT NULL,
  `evt_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `evt_html` text COLLATE utf8_unicode_ci,
  `evt_show_from` datetime NOT NULL,
  `evt_show_to` datetime NOT NULL,
  `evt_meet_start` datetime NOT NULL,
  `evt_meet_end` datetime NOT NULL,
  `evt_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`evt_id`),
  KEY `evt_pos_id` (`evt_pos_id`),
  KEY `evt_typ_id` (`evt_typ_id`),
  KEY `evt_add_id` (`evt_add_id`),
  KEY `evt_img_id` (`evt_img_id`),
  KEY `evt_gal_id` (`evt_gal_id`),
  KEY `evt_cost_id` (`evt_cost_id`),
  KEY `evt_meet_start` (`evt_meet_start`),
  KEY `evt_start_index` (`evt_typ_id`,`evt_meet_start`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `gal_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gal_added` datetime NOT NULL,
  `gal_amended` datetime NOT NULL,
  `gal_disabled` datetime DEFAULT NULL,
  `gal_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`gal_id`),
  KEY `gal_ind_id` (`gal_ind_id`,`gal_typ_id`),
  KEY `gal_name` (`gal_name`),
  KEY `gal_typ_id` (`gal_typ_id`),
  KEY `gal_gli_id` (`gal_gli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_ind_id` int(11) NOT NULL,
  `grp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `grp_total` int(11) NOT NULL,
  `grp_added` datetime NOT NULL,
  `grp_amended` datetime NOT NULL,
  `grp_disabled` datetime DEFAULT NULL,
  `grp_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`grp_id`),
  KEY `grp_ind_id` (`grp_ind_id`),
  KEY `grp_name` (`grp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_ind_id` int(11) NOT NULL,
  `img_ext` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img_added` datetime NOT NULL,
  `img_amended` datetime NOT NULL,
  `img_disabled` datetime DEFAULT NULL,
  `img_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `img_ind_id` (`img_ind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `ind_firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_middles` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_screen` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_pword` varbinary(255) NOT NULL,
  `ind_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_twitter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_instagram` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ind_added` datetime NOT NULL,
  `ind_amended` datetime NOT NULL,
  `ind_disabled` datetime DEFAULT NULL,
  `ind_changed_by` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indroles`
--

DROP TABLE IF EXISTS `indroles`;
CREATE TABLE IF NOT EXISTS `indroles` (
  `ir_id` int(11) NOT NULL AUTO_INCREMENT,
  `ir_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ir_id`),
  KEY `ir_name` (`ir_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_pos_id` int(11) NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `job_typ_id` int(11) NOT NULL,
  `job_add_id` int(11) DEFAULT NULL,
  `job_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `job_html` text COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `new_subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `new_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `new_html` text COLLATE utf8_unicode_ci,
  `new_show_from` datetime NOT NULL,
  `new_show_to` datetime NOT NULL,
  PRIMARY KEY (`new_id`),
  KEY `new_pos_id` (`new_pos_id`),
  KEY `new_typ_id` (`new_typ_id`),
  KEY `new_img_id` (`new_img_id`),
  KEY `new_gal_id` (`new_gal_id`),
  KEY `new_show_index` (`new_typ_id`,`new_show_from`),
  KEY `new_show_from` (`new_show_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `off_id` int(11) NOT NULL AUTO_INCREMENT,
  `off_pos_id` int(11) NOT NULL,
  `off_subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `off_typ_id` int(11) NOT NULL,
  `off_add_id` int(11) DEFAULT NULL,
  `off_img_id` int(11) DEFAULT NULL,
  `off_gal_id` int(11) DEFAULT NULL,
  `off_cost_id` int(11) DEFAULT NULL,
  `off_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `off_html` text COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_strap` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `org_html` text COLLATE utf8_unicode_ci,
  `org_typ_id` int(11) NOT NULL,
  `org_sic_id` int(11) DEFAULT NULL,
  `org_conum` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_reg_id` tinyint(1) DEFAULT NULL,
  `org_vatnum` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_phone` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_mobile` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_facebook` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_twitter` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_instagram` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `oil_org_role` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `oil_added` int(11) NOT NULL,
  `oil_amended` datetime NOT NULL,
  `oil_disabled` int(11) DEFAULT NULL,
  `oil_changed_by` int(11) NOT NULL,
  PRIMARY KEY (`oil_id`),
  UNIQUE KEY `oil_org_index` (`oil_org_id`,`oil_ind_id`),
  UNIQUE KEY `oil_ind_index` (`oil_ind_id`,`oil_org_id`),
  KEY `oil_org_id` (`oil_org_id`),
  KEY `oil_ind_id` (`oil_ind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orgindroles`
--

DROP TABLE IF EXISTS `orgindroles`;
CREATE TABLE IF NOT EXISTS `orgindroles` (
  `oir_id` int(11) NOT NULL AUTO_INCREMENT,
  `oir_role` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`oir_id`),
  KEY `oir_role` (`oir_role`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `rgn_id` int(11) NOT NULL AUTO_INCREMENT,
  `rgn_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rgn_cty_id` int(11) NOT NULL,
  PRIMARY KEY (`rgn_id`),
  KEY `rgn_cty_id` (`rgn_cty_id`),
  KEY `rgn_name` (`rgn_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regplaces`
--

DROP TABLE IF EXISTS `regplaces`;
CREATE TABLE IF NOT EXISTS `regplaces` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_place` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `reg_place` (`reg_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `rte_subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rte_add_id` int(11) DEFAULT NULL,
  `rte_img_id` int(11) DEFAULT NULL,
  `rte_gal_id` int(11) DEFAULT NULL,
  `rte_text` text COLLATE utf8_unicode_ci,
  `rte_html` text COLLATE utf8_unicode_ci,
  `rte_map` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_gpx` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_meet_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`rte_id`),
  KEY `rte_pos_id` (`rte_pos_id`),
  KEY `rte_add_id` (`rte_add_id`),
  KEY `rte_img_id` (`rte_img_id`),
  KEY `rte_gal_id` (`rte_gal_id`),
  KEY `rte_typ_id` (`rte_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rteplaces`
--

DROP TABLE IF EXISTS `rteplaces`;
CREATE TABLE IF NOT EXISTS `rteplaces` (
  `rpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rpl_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rpl_rgn_id` int(11) NOT NULL,
  PRIMARY KEY (`rpl_id`),
  KEY `rpl_name` (`rpl_name`),
  KEY `rpl_rgn_id` (`rpl_rgn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesandwants`
--

DROP TABLE IF EXISTS `salesandwants`;
CREATE TABLE IF NOT EXISTS `salesandwants` (
  `saw_id` int(11) NOT NULL AUTO_INCREMENT,
  `saw_pos_id` int(11) NOT NULL,
  `saw_typ_id` int(11) NOT NULL,
  `saw_subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `saw_add_id` int(11) DEFAULT NULL,
  `saw_img_id` int(11) DEFAULT NULL,
  `saw_gal_id` int(11) DEFAULT NULL,
  `saw_cost_id` int(11) DEFAULT NULL,
  `saw_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `saw_html` text COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siccodes`
--

DROP TABLE IF EXISTS `siccodes`;
CREATE TABLE IF NOT EXISTS `siccodes` (
  `sic_id` int(11) NOT NULL AUTO_INCREMENT,
  `sic_code` int(11) NOT NULL,
  `sic_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sic_id`),
  KEY `sic_code` (`sic_code`),
  KEY `sic_name` (`sic_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
CREATE TABLE IF NOT EXISTS `threads` (
  `thr_id` int(11) NOT NULL AUTO_INCREMENT,
  `thr_pos_id` int(11) NOT NULL,
  `thr_subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE IF NOT EXISTS `titles` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`title_id`),
  KEY `title_name` (`title_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
CREATE TABLE IF NOT EXISTS `towns` (
  `town_id` int(11) NOT NULL AUTO_INCREMENT,
  `town_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `town_cnt_id` int(11) NOT NULL,
  PRIMARY KEY (`town_id`),
  KEY `town_name` (`town_name`),
  KEY `town_county_id` (`town_cnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_type` char(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `typ_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`typ_id`),
  UNIQUE KEY `typ_type` (`typ_type`,`typ_name`),
  KEY `typ_name` (`typ_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_add_evt` FOREIGN KEY (`add_id`) REFERENCES `events` (`evt_add_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_add_ind` FOREIGN KEY (`add_id`) REFERENCES `individuals` (`ind_add_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_add_job` FOREIGN KEY (`add_id`) REFERENCES `jobs` (`job_add_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_add_org` FOREIGN KEY (`add_id`) REFERENCES `organisations` (`org_add_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_add_rte` FOREIGN KEY (`add_id`) REFERENCES `routes` (`rte_add_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_add_saw` FOREIGN KEY (`add_id`) REFERENCES `salesandwants` (`saw_add_id`) ON DELETE RESTRICT;

--
-- Constraints for table `costs`
--
ALTER TABLE `costs`
  ADD CONSTRAINT `FK_cos_` FOREIGN KEY (`cos_id`) REFERENCES `salesandwants` (`saw_cost_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_cos_evt` FOREIGN KEY (`cos_id`) REFERENCES `events` (`evt_cost_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_cos_saw` FOREIGN KEY (`cos_id`) REFERENCES `salesandwants` (`saw_cost_id`) ON DELETE RESTRICT;

--
-- Constraints for table `counties`
--
ALTER TABLE `counties`
  ADD CONSTRAINT `FK_cnt` FOREIGN KEY (`cnt_id`) REFERENCES `towns` (`town_cnt_id`) ON DELETE RESTRICT;

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `FK_cty` FOREIGN KEY (`cty_id`) REFERENCES `regions` (`rgn_cty_id`) ON DELETE RESTRICT;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `FK_dis_add` FOREIGN KEY (`dis_id`) REFERENCES `addresses` (`add_district_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_dis_area` FOREIGN KEY (`dis_id`) REFERENCES `areas` (`area_dis_id`) ON DELETE RESTRICT;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `FK_gal_emp` FOREIGN KEY (`gal_id`) REFERENCES `announcements` (`ann_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_evt` FOREIGN KEY (`gal_id`) REFERENCES `events` (`evt_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_gli` FOREIGN KEY (`gal_id`) REFERENCES `galleries` (`gal_gli_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_job` FOREIGN KEY (`gal_id`) REFERENCES `jobs` (`job_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_new` FOREIGN KEY (`gal_id`) REFERENCES `news` (`new_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_off` FOREIGN KEY (`gal_id`) REFERENCES `offers` (`off_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_org` FOREIGN KEY (`gal_id`) REFERENCES `organisations` (`org_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_rte` FOREIGN KEY (`gal_id`) REFERENCES `routes` (`rte_gal_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_gal_saw` FOREIGN KEY (`gal_id`) REFERENCES `routes` (`rte_gal_id`) ON DELETE RESTRICT;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `FK_grp_org` FOREIGN KEY (`grp_id`) REFERENCES `organisations` (`org_grp_id`) ON DELETE RESTRICT;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_img_ann` FOREIGN KEY (`img_id`) REFERENCES `announcements` (`ann_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_emp` FOREIGN KEY (`img_id`) REFERENCES `employments` (`emp_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_evt` FOREIGN KEY (`img_id`) REFERENCES `events` (`evt_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_gli` FOREIGN KEY (`img_id`) REFERENCES `gallinks` (`gli_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_ind` FOREIGN KEY (`img_id`) REFERENCES `individuals` (`ind_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_job` FOREIGN KEY (`img_id`) REFERENCES `jobs` (`job_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_new` FOREIGN KEY (`img_id`) REFERENCES `news` (`new_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_off` FOREIGN KEY (`img_id`) REFERENCES `offers` (`off_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_org` FOREIGN KEY (`img_id`) REFERENCES `organisations` (`org_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_rte` FOREIGN KEY (`img_id`) REFERENCES `routes` (`rte_img_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_img_saw` FOREIGN KEY (`img_id`) REFERENCES `salesandwants` (`saw_img_id`) ON DELETE RESTRICT;

--
-- Constraints for table `individuals`
--
ALTER TABLE `individuals`
  ADD CONSTRAINT `FK_ind_oil` FOREIGN KEY (`ind_id`) REFERENCES `orgindlinks` (`oil_ind_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_ind_org` FOREIGN KEY (`ind_id`) REFERENCES `organisations` (`org_ind_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_ind_pos` FOREIGN KEY (`ind_id`) REFERENCES `posts` (`pos_ind_id`) ON DELETE RESTRICT;

--
-- Constraints for table `indroles`
--
ALTER TABLE `indroles`
  ADD CONSTRAINT `FK_irl_ind` FOREIGN KEY (`ir_id`) REFERENCES `individuals` (`ind_role_id`) ON DELETE RESTRICT;

--
-- Constraints for table `organisations`
--
ALTER TABLE `organisations`
  ADD CONSTRAINT `FK_org_oil` FOREIGN KEY (`org_id`) REFERENCES `orgindlinks` (`oil_org_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_org_pos` FOREIGN KEY (`org_id`) REFERENCES `posts` (`pos_org_id`) ON DELETE RESTRICT;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_pos_ann` FOREIGN KEY (`pos_id`) REFERENCES `announcements` (`ann_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_com` FOREIGN KEY (`pos_id`) REFERENCES `threads` (`thr_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_emp` FOREIGN KEY (`pos_id`) REFERENCES `employments` (`emp_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_evt` FOREIGN KEY (`pos_id`) REFERENCES `events` (`evt_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_job` FOREIGN KEY (`pos_id`) REFERENCES `jobs` (`job_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_new` FOREIGN KEY (`pos_id`) REFERENCES `news` (`new_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_off` FOREIGN KEY (`pos_id`) REFERENCES `offers` (`off_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_rte` FOREIGN KEY (`pos_id`) REFERENCES `routes` (`rte_pos_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_pos_saw` FOREIGN KEY (`pos_id`) REFERENCES `salesandwants` (`saw_pos_id`) ON DELETE CASCADE;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `FK_rgn` FOREIGN KEY (`rgn_id`) REFERENCES `counties` (`cnt_rgn_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_rgn_rteplaces` FOREIGN KEY (`rgn_id`) REFERENCES `rteplaces` (`rpl_rgn_id`) ON DELETE RESTRICT;

--
-- Constraints for table `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `FK_com` FOREIGN KEY (`thr_id`) REFERENCES `comments` (`com_thr_id`) ON DELETE RESTRICT;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `FK_title` FOREIGN KEY (`title_id`) REFERENCES `individuals` (`ind_title_id`) ON DELETE RESTRICT;

--
-- Constraints for table `towns`
--
ALTER TABLE `towns`
  ADD CONSTRAINT `FK_town_add` FOREIGN KEY (`town_id`) REFERENCES `addresses` (`add_town_id`) ON DELETE RESTRICT;

--
-- Constraints for table `types`
--
ALTER TABLE `types`
  ADD CONSTRAINT `FK_typ_ann` FOREIGN KEY (`typ_id`) REFERENCES `announcements` (`ann_type_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_com` FOREIGN KEY (`typ_id`) REFERENCES `threads` (`thr_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_emp` FOREIGN KEY (`typ_id`) REFERENCES `employments` (`emp_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_evt` FOREIGN KEY (`typ_id`) REFERENCES `events` (`evt_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_gal` FOREIGN KEY (`typ_id`) REFERENCES `galleries` (`gal_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_job` FOREIGN KEY (`typ_id`) REFERENCES `jobs` (`job_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_new` FOREIGN KEY (`typ_id`) REFERENCES `news` (`new_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_off` FOREIGN KEY (`typ_id`) REFERENCES `offers` (`off_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_org` FOREIGN KEY (`typ_id`) REFERENCES `organisations` (`org_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_pos` FOREIGN KEY (`typ_id`) REFERENCES `posts` (`pos_type_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_rte` FOREIGN KEY (`typ_id`) REFERENCES `routes` (`rte_typ_id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `FK_typ_saw` FOREIGN KEY (`typ_id`) REFERENCES `salesandwants` (`saw_typ_id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
