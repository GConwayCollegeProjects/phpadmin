-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2020 at 01:17 PM
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
-- Database: `peakacti_test_pages`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `add_id` int(11) NOT NULL,
  `add_line1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_line2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_line3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_area` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `add_town_id` int(11) NOT NULL,
  `add_pcode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `add_district_id` int(11) NOT NULL,
  `add_added` datetime NOT NULL,
  `add_amended` datetime NOT NULL,
  `add_disabled` datetime NOT NULL,
  `add_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anntypes`
--

CREATE TABLE `anntypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comtypes`
--

CREATE TABLE `comtypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coregtypes`
--

CREATE TABLE `coregtypes` (
  `reg_id` int(11) NOT NULL,
  `reg_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costypes`
--

CREATE TABLE `costypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employments`
--

CREATE TABLE `employments` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emtypes`
--

CREATE TABLE `emtypes` (
  `etyp_id` int(11) NOT NULL,
  `etyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventypes`
--

CREATE TABLE `eventypes` (
  `etyp_id` int(11) NOT NULL,
  `etyp_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `gal_id` int(11) NOT NULL,
  `gal_type_id` int(11) NOT NULL,
  `gal_link_id` int(11) NOT NULL,
  `gal_added` int(11) NOT NULL,
  `gal_ind_id` int(11) NOT NULL,
  `gal_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galtypes`
--

CREATE TABLE `galtypes` (
  `gtyp_id` int(11) NOT NULL,
  `gtyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `grp_id` int(11) NOT NULL,
  `grp_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `grp_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(11) NOT NULL,
  `img_ind_id` int(11) NOT NULL,
  `img_gal_id` int(11) NOT NULL,
  `img_gal_order` int(11) NOT NULL,
  `img_ext` char(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `img_ind_id`, `img_gal_id`, `img_gal_order`, `img_ext`) VALUES
(100001, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `ind_id` int(11) NOT NULL,
  `ind_add_id` int(11) NOT NULL,
  `ind_title_id` int(11) NOT NULL,
  `ind_firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_middles` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ind_screen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_pword` varbinary(255) NOT NULL,
  `ind_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_mobile` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_facebook` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_twitter` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ind_img_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`ind_id`, `ind_add_id`, `ind_title_id`, `ind_firstname`, `ind_middles`, `ind_lastname`, `ind_screen`, `ind_pword`, `ind_phone`, `ind_mobile`, `ind_email`, `ind_facebook`, `ind_twitter`, `ind_instagram`, `ind_img_id`) VALUES
(3, 0, 0, 'Gordon', 'Edwin', 'Conway', 'gconwayuk', 0x2432792431322466674f6f4b45665434355356654651476c765858644f4b2e377439587567567441625778674a42622e512e6f5834302e7856764e75, '', '', 'gconwayuk@gmail.com', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobtypes`
--

CREATE TABLE `jobtypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loctypes`
--

CREATE TABLE `loctypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `new_id` int(11) NOT NULL,
  `new_pos_id` int(11) NOT NULL,
  `new_newstype_id` int(11) NOT NULL,
  `new_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `new_gal_id` int(11) NOT NULL,
  `new_text` text COLLATE utf8_unicode_ci NOT NULL,
  `new_blob` blob NOT NULL,
  `new_eff_date` date NOT NULL,
  `new_end_date` date NOT NULL,
  `new_amended` datetime NOT NULL,
  `new_ind_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newstypes`
--

CREATE TABLE `newstypes` (
  `ntyp_id` int(11) NOT NULL,
  `ntyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offtypes`
--

CREATE TABLE `offtypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oilinks`
--

CREATE TABLE `oilinks` (
  `oil_id` int(11) NOT NULL,
  `oil_org_id` int(11) NOT NULL,
  `oil_ind_id` int(11) NOT NULL,
  `oil_amended` datetime NOT NULL,
  `oil_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `org_id` int(11) NOT NULL,
  `org_add_id` int(11) NOT NULL,
  `org_ind_id` int(11) NOT NULL,
  `org_grp_id` int(11) NOT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_strap` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_desc` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `org_type_id` int(11) DEFAULT NULL,
  `org_sic_id` int(8) NOT NULL,
  `org_conum` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `org_reg_id` int(1) NOT NULL,
  `org_vatnum` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `org_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `org_mobile` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `org_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_facebook` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_twitter` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_instagram` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `org_added` datetime NOT NULL,
  `org_amended` datetime NOT NULL,
  `org_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`org_id`, `org_add_id`, `org_ind_id`, `org_grp_id`, `org_name`, `org_strap`, `org_desc`, `org_type_id`, `org_sic_id`, `org_conum`, `org_reg_id`, `org_vatnum`, `org_phone`, `org_mobile`, `org_email`, `org_web`, `org_facebook`, `org_twitter`, `org_instagram`, `org_added`, `org_amended`, `org_disabled`) VALUES
(1, 0, 0, 0, 'Eadson Associates', '', '', 163, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 0, 0, 'Ellison Ray', '', '', 164, 0, '', 0, '', '', '', 'paul@ellisonray.co.uk', 'http://ellisonray.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 0, 0, 'Justine Nettleton', '', '', 165, 0, '', 0, '', '', '', 'info@justinenettleton.com', 'https://www.justinenettleton.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 0, 0, 'Artistic Licence', '', '', 166, 0, '', 0, '', '', '', '', 'http://artistic-licence.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 0, 0, 'Definitive Audio', '', '', 167, 0, '', 0, '', '', '', 'shout@definitiveaudio.co.uk', 'http://www.definitiveaudio.co.uk/definitive-audio.html', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 0, 0, 'Bradley Brown Internet', '', '', 168, 0, '', 0, '', '', '', ' customerservices@dapperbaby.co.uk', 'http://www.bradleybrowninternet.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 0, 0, 0, 'Opulence Bridals', '', '', 169, 0, '', 0, '', '', '', ' opulencebridals@hotmail.com', 'http://www.opulencebridals.co.uk/contact_us', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 0, 0, 0, 'SPC Auto Repairs', '', '', 170, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 0, 0, 0, 'C & T Carpets', '', '', 171, 0, '', 0, '', '', '', '', 'http://www.candtcarpets.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 0, 0, 0, 'Studio Bisque', '', '', 172, 0, '', 0, '', '', '', 'studiobisque@hotmail.co.uk ', 'http://www.studiobisque.com/index.php', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 0, 0, 0, 'Modclothin.com', '', '', 173, 0, '', 0, '', '', '', 'ministryofmod@outlook.com ', 'http://www.modclothin.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 0, 0, 0, 'Allison Turner Designs', '', '', 174, 0, '', 0, '', '', '', 'allisonturner@hotmail.co.uk', 'http://www.allisonturnerdesigns.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 0, 0, 0, 'Questmark', '', '', 175, 0, '', 0, '', '', '', '', 'https://themeetingplatform.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 0, 0, 'Dance Doctors Studios', '', '', 176, 0, '', 0, '', '', '', '', 'http://www.dancedoctors.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 0, 0, 0, 'Bodies in Motion Dancewear', '', '', 177, 0, '', 0, '', '', '', '', 'https://www.bodies-in-motion.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 0, 0, 0, 'Oasis Centre', '', '', 178, 0, '', 0, '', '', '', 'office@oasischurch.co.uk', 'http://www.longeatonoasis.co.uk/about-us/contact-us/?view=mobile', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 0, 0, 0, 'Ceramic Arts', '', '', 179, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 0, 0, 0, 'MG4 Dental', '', '', 180, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 0, 0, 0, 'A J Moore Associates - Dentist', '', '', 181, 0, '', 0, '', '', '', '', 'http://ajmooredentalcare.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 0, 0, 0, 'Sunshine Dental', '', '', 181, 0, '', 0, '', '', '', 'info@sunshinedental.co.uk', 'http://www.sunshinedental.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 0, 0, 0, 'East Midlands Mobility Centre', '', '', 182, 0, '', 0, '', '', '', 'eastmidlandsmobility@gptadsl.co.uk', 'http://eastmidlands-mobility.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 0, 0, 0, 'Riverdene', '', '', 183, 0, '', 0, '', '', '', 'hello@riverdeneconsulting.com', 'http://www.riverdeneconsulting.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 0, 0, 0, 'C H Smith Engravers', '', '', 184, 0, '', 0, '', '', '', 'enquiries@chsmithengravers.co.uk', 'http://www.chsmithengravers.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 0, 0, 0, 'Right House', '', '', 185, 0, '', 0, '', '', '', 'longeaton@righthouseuk.com', 'http://www.righthouseuk.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 0, 0, 0, 'Sharpe', '', '', 185, 0, '', 0, '', '', '', 'info@sharpeproperties.co.uk', 'http://www.sharpeproperties.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 0, 0, 0, 'Haunted Happenings', '', '', 186, 0, '', 0, '', '', '', '', 'https://www.hauntedhappenings.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 0, 0, 0, 'Harrington Mill Studios', '', '', 187, 0, '', 0, '', '', '', 'info@harringtonmillstudios.co.uk', 'http://www.harringtonmillstudios.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 0, 0, 0, 'NTL Integral', '', '', 188, 0, '', 0, '', '', '', 'tech@fablace.co.uk', 'http://www.harrington-fabric-and-lace.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 0, 0, 0, 'Attenborough Trimming', '', '', 189, 0, '', 0, '', '', '', '', 'http://www.attenboroughfabrictrimmings.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 0, 0, 0, 'Blowfish', '', '', 190, 0, '', 0, '', '', '', 'info@blowfish-fs.co.uk', 'http://blowfish-fs.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 0, 0, 0, 'Ink Financial', '', '', 190, 0, '', 0, '', '', '', 'office@inkfinancial.co.uk ', 'inkfinancial.co.uk', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 0, 0, 0, 'Bridge Tackle', '', '', 191, 0, '', 0, '', '', '', '', 'https://www.prestoninnovations.com/Dealers/Shopinfo/100-BRIDGE-TACKLE', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 0, 0, 0, 'Donna May Flowers', '', '', 192, 0, '', 0, '', '', '', 'mail@donnamays.co.uk', 'https://www.donnamays.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 0, 0, 0, 'Long Eaton Chronicle', '', '', 193, 0, '', 0, '', '', '', '', 'http://www.longeatonchronicle.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 0, 0, 0, 'AMX Design', '', '', 194, 0, '', 0, '', '', '', 'info@amx-design.com', 'http://amx-design.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 0, 0, 0, 'Design Upholstery', '', '', 194, 0, '', 0, '', '', '', '', 'http://www.designupholstery.co.uk/home.html', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 0, 0, 0, 'Siren Furniture', '', '', 194, 0, '', 0, '', '', '', 'sales@sirenfurniture.com', 'http://www.sirenfurniture.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 0, 0, 0, 'Ian James Furniture', '', '', 194, 0, '', 0, '', '', '', 'sales@iainjamesfurniture.co.uk', 'http://www.iainjamesfurniture.co.uk/contact/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 0, 0, 0, 'Aries Hairdressing', '', '', 195, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 0, 0, 0, 'Harmony Care and Support', '', '', 196, 0, '', 0, '', '', '', 'gailflower@btinternet.com', 'http://www.harmonycareandsupport.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 0, 0, 0, 'Bosworth Homecare', '', '', 197, 0, '', 0, '', '', '', 'managementteam@givecare.co.uk', 'http://www.givecarehomecare.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 0, 0, 0, 'Harlequinn Boutique', '', '', 198, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 0, 0, 0, 'Oakes Insurance', '', '', 199, 0, '', 0, '', '', '', 'info@oakesinsurance.co.uk', 'http://www.oakesinsurance.co.uk/contact.asp', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 0, 0, 0, 'Stuart Bullock and Son Jewellers', '', '', 200, 0, '', 0, '', '', '', 'enquiries@sbjewels.com', 'http://www.sbjewels.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 0, 0, 0, 'Security Data Print', '', '', 201, 0, '', 0, '', '', '', ' sales@sdpuk.co.uk', 'http://www.sdpuk.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 0, 0, 0, 'Exposure Ninja', '', '', 202, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 0, 0, 0, 'Long Eaton Martial Arts', '', '', 203, 0, '', 0, '', '', '', '', 'http://www.longeatonmartialartscentre.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 0, 0, 0, 'Zingara Club', '', '', 204, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 0, 0, 0, 'Club Cruze', '', '', 205, 0, '', 0, '', '', '', 'enquiries@clubcruze-nottingham.co.uk', 'https://www.clubcruze-nottingham.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 0, 0, 0, 'Long Eaton Music Tuition', '', '', 206, 0, '', 0, '', '', '', 'adrianbeale@yahoo.com, jimmywillan@btinternet.com', 'http://www.longeatonmusictuition.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 0, 0, 0, 'Nails by Katie', '', '', 207, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 0, 0, 0, 'Nottingham Narrow Fabrics', '', '', 208, 0, '', 0, '', '', '', 'nottinghamnarrowfabrics@btconnect.com', 'http://www.nottinghamnarrowfabrics.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 0, 0, 0, 'Parklands Connexion ', '', '', 209, 0, '', 0, '', '', '', 'info@parklandsconnexion.com', 'http://www.parklandsconnexion.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 0, 0, 0, 'Terracotta Heaven', '', '', 210, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 0, 0, 0, 'Diva Dogs', '', '', 211, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 0, 0, 0, 'Bodyline Studio', '', '', 212, 0, '', 0, '', '', '', 'info@bodylinestudio.com', 'http://www.bodylinestudio.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 0, 0, 0, 'Trusted Photography', '', '', 213, 0, '', 0, '', '', '', '', 'http://www.trustedphotography.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 0, 0, 0, 'Impact Physiotherapy', '', '', 214, 0, '', 0, '', '', '', 'contact@impactphysio.co.uk', 'https://www.impactphysio.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 0, 0, 0, 'LE Foot, Neck and Back Clinic', '', '', 214, 0, '', 0, '', '', '', 'INFO@FOOTKNEEANDBACKCLINIC.COM', 'http://www.footkneeandbackclinic.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 0, 0, 0, 'Nottingham Pilates', '', '', 215, 0, '', 0, '', '', '', 'nottingham.pilates@hotmail.co.uk', 'http://www.nottmpilates.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 0, 0, 0, 'Long Eaton Plumbers Merchants', '', '', 216, 0, '', 0, '', '', '', '', 'http://www.lepm.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 0, 0, 0, 'Elson & Hall', '', '', 217, 0, '', 0, '', '', '', 'elsonandhall@btconnect.com', 'http://www.elsonandhall.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 0, 0, 0, 'Office Way', '', '', 217, 0, '', 0, '', '', '', 'info@theofficeway.com', 'http://www.theofficeway.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 0, 0, 0, 'The Office Way - Print Shop', '', '', 218, 0, '', 0, '', '', '', 'info@the officeway.com', 'http://www.theofficeway.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 0, 0, 0, 'Michael Lock Consultant Psychologists', '', '', 219, 0, '', 0, '', '', '', '', 'http://mlcp.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 0, 0, 0, 'Sportsman Pub', '', '', 220, 0, '', 0, '', '', '', 'amanda.jones110@outlook.com', 'http://www.thesportsman-pub.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 0, 0, 0, 'Etalon Research', '', '', 221, 0, '', 0, '', '', '', 'info@etalonresearch.com', 'http://www.etalonresearch.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 0, 0, 0, 'D & M Shopfitting', '', '', 222, 0, '', 0, '', '', '', 'enquiries@dandmshopfitting.co.uk ', 'http://www.dandmshopfitting.co.uk/index.html', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 0, 0, 0, 'AM Stairlifts', '', '', 223, 0, '', 0, '', '', '', '', 'http://www.amstairlifts.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 0, 0, 0, 'Skinvasion', '', '', 224, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 0, 0, 0, 'Southpaw', '', '', 225, 0, '', 0, '', '', '', 'sales@southpaw.co.uk', 'http://www.southpaw.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 0, 0, 0, 'Premier Textiles', '', '', 226, 0, '', 0, '', '', '', 'info@premiertextiles.com', 'http://premier-textiles.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 0, 0, 0, 'David Knight Collection', '', '', 227, 0, '', 0, '', '', '', 'thedavidknightcollection@btinternet.com', 'http://www.davidknightcollection.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 0, 0, 0, 'Kaya Uphostelry', '', '', 227, 0, '', 0, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 0, 0, 0, 'Artistic Upholstery', '', '', 227, 0, '', 0, '', '', '', 'sales@artisticupholstery.co.uk', 'http://www.artisticupholstery.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 0, 0, 0, 'MG Designs', '', '', 227, 0, '', 0, '', '', '', '', 'http://www.mgdesignsupholstery.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 0, 0, 0, 'Advanced Vending Services', '', '', 228, 0, '', 0, '', '', '', 'info@advancedvending.co.uk', 'http://advancedvending.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 0, 0, 0, 'Ashfield House Vets', '', '', 229, 0, '', 0, '', '', '', 'info@ashvet.co.uk ', 'http://ashvet.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 0, 0, 0, 'Local Exposure', '', '', 230, 0, '', 0, '', '', '', '', 'https://www.localexposure.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 0, 0, 0, 'Drapes UK', '', '', 231, 0, '', 0, '', '', '', '', 'https://www.drapes-uk.com/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 0, 0, 0, 'Rob Roy', '', '', 232, 0, '', 0, '', '', '', 'robroytoy@yahoo.co.uk', 'http://www.robroy-woodentoys.co.uk/', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orgtypes`
--

CREATE TABLE `orgtypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orgtypes`
--

INSERT INTO `orgtypes` (`otyp_id`, `otyp_name`) VALUES
(163, 'Accountants'),
(164, 'Alternative Lending'),
(165, 'Artist'),
(166, 'Artwork Studio'),
(167, 'Audio Equipment'),
(168, 'Baby Clothes'),
(169, 'Bridal Wear'),
(170, 'Car Repairs'),
(171, 'Carpet Shop'),
(172, 'Ceramics'),
(173, 'Clothing Supplier'),
(174, 'Community Craft Workshops'),
(175, 'Computer Technology'),
(176, 'Dance Studios'),
(177, 'Dancewear Shop'),
(178, 'Day Centre'),
(179, 'Dental Lab'),
(180, 'Dental Laboratory'),
(181, 'Dentist'),
(182, 'Disability Products'),
(183, 'E-Learning Solutions'),
(184, 'Engravers'),
(185, 'Estate Agents'),
(186, 'Events Company'),
(187, 'Exhibition Space'),
(188, 'Fabric and Lace'),
(189, 'Fabric Wholesaler'),
(190, 'Financial Consultants'),
(191, 'Fishing Tackle'),
(192, 'Florist'),
(193, 'Free Newspaper'),
(194, 'Furniture'),
(195, 'Hairdressers'),
(196, 'Home Care'),
(197, 'Home Helps'),
(198, 'Household Gifts'),
(199, 'Insurance Brokers'),
(200, 'Jewellers'),
(201, 'Mailing and Printing'),
(202, 'Marketing Agency'),
(203, 'Martial Arts'),
(204, 'Members Club & Bar'),
(205, 'Members Club/Bar'),
(206, 'Music Tuition'),
(207, 'Nails'),
(208, 'Narrow Fabrics'),
(209, 'Nursing, Day Care & Conference Centre'),
(210, 'Ornaments'),
(211, 'Pet Grooming'),
(212, 'Photographic Studio'),
(213, 'Photography'),
(214, 'Physiotherapy'),
(215, 'Pilates Studio'),
(216, 'Plumbing Supplies'),
(217, 'Printers'),
(218, 'Printing & Stationery'),
(219, 'Psychologist'),
(220, 'Public House'),
(221, 'Research Consultancy'),
(222, 'Shopfitting'),
(223, 'Stairlifts'),
(224, 'Tatooist'),
(225, 'Teaching/Play Equipment'),
(226, 'Textile Merchant'),
(227, 'Upholstery'),
(228, 'Vending'),
(229, 'Vetinary Surgeon'),
(230, 'Web Sites'),
(231, 'Window Fabrics and Blinds'),
(232, 'Wooden Toys');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pos_id` int(11) NOT NULL,
  `pos_type_id` int(11) NOT NULL,
  `pos_ind_id` int(11) NOT NULL,
  `pos_added` datetime NOT NULL,
  `pos_org_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postypes`
--

CREATE TABLE `postypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routypes`
--

CREATE TABLE `routypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesandwants`
--

CREATE TABLE `salesandwants` (
  `evt_id` int(11) NOT NULL,
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
  `evt_disabled` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sawtypes`
--

CREATE TABLE `sawtypes` (
  `otyp_id` int(11) NOT NULL,
  `otyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL,
  `title_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `town_id` int(11) NOT NULL,
  `town_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `town_county_id` int(11) NOT NULL,
  `town_country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xtprofiles`
--

CREATE TABLE `xtprofiles` (
  `pro_id` int(11) NOT NULL,
  `pro_xtyp_id` int(11) NOT NULL,
  `pro_text` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xtypes`
--

CREATE TABLE `xtypes` (
  `etyp_id` int(11) NOT NULL,
  `etyp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `anntypes`
--
ALTER TABLE `anntypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `comtypes`
--
ALTER TABLE `comtypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `coregtypes`
--
ALTER TABLE `coregtypes`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `costypes`
--
ALTER TABLE `costypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `employments`
--
ALTER TABLE `employments`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `emtypes`
--
ALTER TABLE `emtypes`
  ADD PRIMARY KEY (`etyp_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `eventypes`
--
ALTER TABLE `eventypes`
  ADD PRIMARY KEY (`etyp_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`gal_id`);

--
-- Indexes for table `galtypes`
--
ALTER TABLE `galtypes`
  ADD PRIMARY KEY (`gtyp_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`grp_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`ind_id`),
  ADD UNIQUE KEY `ind_email` (`ind_email`),
  ADD UNIQUE KEY `ind_facebook` (`ind_facebook`),
  ADD UNIQUE KEY `ind_twitter` (`ind_twitter`),
  ADD UNIQUE KEY `ind_instagram` (`ind_instagram`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `jobtypes`
--
ALTER TABLE `jobtypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `loctypes`
--
ALTER TABLE `loctypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`new_id`);

--
-- Indexes for table `newstypes`
--
ALTER TABLE `newstypes`
  ADD PRIMARY KEY (`ntyp_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `offtypes`
--
ALTER TABLE `offtypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `oilinks`
--
ALTER TABLE `oilinks`
  ADD PRIMARY KEY (`oil_id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `orgtypes`
--
ALTER TABLE `orgtypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pos_id`),
  ADD KEY `pos_type_id` (`pos_type_id`),
  ADD KEY `pos_ind_id` (`pos_ind_id`),
  ADD KEY `pos_added` (`pos_added`),
  ADD KEY `pos_org_id` (`pos_org_id`);

--
-- Indexes for table `postypes`
--
ALTER TABLE `postypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `routypes`
--
ALTER TABLE `routypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `salesandwants`
--
ALTER TABLE `salesandwants`
  ADD PRIMARY KEY (`evt_id`);

--
-- Indexes for table `sawtypes`
--
ALTER TABLE `sawtypes`
  ADD PRIMARY KEY (`otyp_id`),
  ADD UNIQUE KEY `typ_name` (`otyp_name`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`town_id`);

--
-- Indexes for table `xtprofiles`
--
ALTER TABLE `xtprofiles`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `xtypes`
--
ALTER TABLE `xtypes`
  ADD PRIMARY KEY (`etyp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anntypes`
--
ALTER TABLE `anntypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comtypes`
--
ALTER TABLE `comtypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coregtypes`
--
ALTER TABLE `coregtypes`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `costypes`
--
ALTER TABLE `costypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employments`
--
ALTER TABLE `employments`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emtypes`
--
ALTER TABLE `emtypes`
  MODIFY `etyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventypes`
--
ALTER TABLE `eventypes`
  MODIFY `etyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `gal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galtypes`
--
ALTER TABLE `galtypes`
  MODIFY `gtyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `grp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `individuals`
--
ALTER TABLE `individuals`
  MODIFY `ind_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobtypes`
--
ALTER TABLE `jobtypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loctypes`
--
ALTER TABLE `loctypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `new_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offtypes`
--
ALTER TABLE `offtypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oilinks`
--
ALTER TABLE `oilinks`
  MODIFY `oil_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `org_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orgtypes`
--
ALTER TABLE `orgtypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postypes`
--
ALTER TABLE `postypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routypes`
--
ALTER TABLE `routypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesandwants`
--
ALTER TABLE `salesandwants`
  MODIFY `evt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sawtypes`
--
ALTER TABLE `sawtypes`
  MODIFY `otyp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `town_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xtprofiles`
--
ALTER TABLE `xtprofiles`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xtypes`
--
ALTER TABLE `xtypes`
  MODIFY `etyp_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
