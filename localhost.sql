-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2019 at 07:48 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `work_db`
--
CREATE DATABASE IF NOT EXISTS `work_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `work_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `borrowreturn`
--

CREATE TABLE `borrowreturn` (
  `borrowID` int(11) NOT NULL,
  `durableID` int(11) NOT NULL COMMENT 'รหัสครุภัณฑ์ ',
  `borrowerName` varchar(100) NOT NULL COMMENT 'ผู้ยืม',
  `objective` varchar(250) NOT NULL COMMENT 'จุดประสงค์การยืม',
  `borrowDate` date NOT NULL COMMENT 'วันที่ยืม',
  `returnedDate` date NOT NULL COMMENT 'วันที่คืน',
  `status` varchar(50) NOT NULL COMMENT 'สถานะ',
  `templeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `borrowreturn`
--

INSERT INTO `borrowreturn` (`borrowID`, `durableID`, `borrowerName`, `objective`, `borrowDate`, `returnedDate`, `status`, `templeID`) VALUES
(1, 5, 'วัยวุฒิ ', 'จำเป็นที่จะใช้พัดลมในงาน', '2019-08-30', '2019-09-25', 'อยู่ระหว่างยืม', 1),
(2, 1, 'สมชาย', 'จำเป็นต้องใช้คอมพิวเตอร์สำหรับงานวัด', '2019-08-30', '2019-09-26', 'คืนเรียบร้อยแล้ว', 1),
(3, 11, 'สมพร', 'จำเป็นต้องใช้คอมพิวเตอร์สำหรับงานวัด', '2019-08-24', '2019-08-30', 'อยู่ระหว่างยืม', 2),
(4, 11, 'ปิยะธิดา ', 'จำเป็น', '2019-08-23', '2019-08-31', 'คืนเรียบร้อยแล้ว', 2),
(5, 14, 'วัยวุฒิ ', 'จำเป็นต้องใช้คอมพิวเตอร์สำหรับงานวัด', '2019-08-14', '2019-10-24', 'อยู่ระหว่างยืม', 3),
(6, 15, 'สมหมาย', 'ต้องการใช้กระดาษ', '2019-08-24', '2019-08-31', 'คืนเรียบร้อยแล้ว', 4),
(7, 13, 'วัยวุฒิ ', 'ต้องการยืม', '2019-08-17', '2019-08-29', 'อยู่ระหว่างยืม', 2);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `districtID` int(2) NOT NULL,
  `districtName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`districtID`, `districtName`) VALUES
(1, 'เมืองลพบุรี'),
(2, 'โคกเจริญ'),
(3, 'โคกสำโรง'),
(4, 'ชัยบาดาล'),
(5, 'ท่าวุ้ง'),
(6, 'ท่าหลวง'),
(7, 'บ้านหมี่'),
(8, 'พัฒนานิคม'),
(9, 'ลำสนธิ'),
(10, 'สระโบสถ์'),
(11, 'หนองม่วง');

-- --------------------------------------------------------

--
-- Table structure for table `durablearticle`
--

CREATE TABLE `durablearticle` (
  `durableID` int(11) NOT NULL,
  `durableName` varchar(100) NOT NULL COMMENT 'รายการครุภัณฑ์',
  `detail` varchar(250) NOT NULL,
  `durableNumber` varchar(50) NOT NULL COMMENT 'หมายเลขครุภัณฑ์',
  `durable_date` date NOT NULL COMMENT 'ปีที่รับครุภัณฑ์',
  `durable_type` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `templeID` int(11) NOT NULL COMMENT 'รหัสวัด (FK)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `durablearticle`
--

INSERT INTO `durablearticle` (`durableID`, `durableName`, `detail`, `durableNumber`, `durable_date`, `durable_type`, `count`, `unit`, `templeID`) VALUES
(1, 'คอมพิวเตอร์', 'คอมพิวเตอร์จอแบน สีขาวดำ ตั้งโต๊ะ ', '1432667875', '2019-08-29', 'อุปกรณ์', 10, 'กล่อง', 1),
(2, 'กระดาษ', 'กระดาษทำงานขนาด a4 ไว้สำหรับปริ้นเอกสาร', '1032257811', '2019-08-29', 'วัสดุสำนักงาน', 50, 'ชิ้น', 1),
(3, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์', '1432667875', '2019-08-28', 'วัสดุสำนักงาน', 100, 'อั้น', 2),
(5, 'พัดลม', 'กระดาษทำงานขนาด a4 ไว้สำหรับปริ้นเอกสาร123', '1111111111', '2019-08-30', 'เครื่องใช้อื่นๆ', 20, 'อั้น', 1),
(6, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์', '1432667875', '2019-08-28', 'วัสดุสำนักงาน', 100, 'อั้น', 2),
(7, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์คอมพิวเตอร์', '222222222', '2019-08-24', 'วัสดุสำนักงาน', 200, 'ชิ้น', 3),
(9, 'คอมพิวเตอร์', 'คอมพิวเตอร์จอแบน สีขาวดำ ตั้งโต๊ะ ', '1432667875', '2019-08-29', 'อุปกรณ์', 10, 'กล่อง', 1),
(10, 'กระดาษ', 'กระดาษทำงานขนาด a4 ไว้สำหรับปริ้นเอกสาร', '1032257811', '2019-08-29', 'วัสดุสำนักงาน', 50, 'ชิ้น', 1),
(11, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์', '1432667875', '2019-08-28', 'วัสดุสำนักงาน', 100, 'อั้น', 2),
(12, 'พัดลม', 'กระดาษทำงานขนาด a4 ไว้สำหรับปริ้นเอกสาร123', '1111111111', '2019-08-30', 'เครื่องใช้อื่นๆ', 20, 'อั้น', 1),
(13, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์', '1432667875', '2019-08-28', 'วัสดุสำนักงาน', 100, 'อั้น', 2),
(14, 'คอมพิวเตอร์', 'คอมพิวเตอร์คอมพิวเตอร์คอมพิวเตอร์', '222222222', '2019-08-24', 'วัสดุสำนักงาน', 200, 'ชิ้น', 3),
(15, 'กระดาษ', 'กระดาษกระดาษกระดาษกระดาษกระดาษ', '4040404040', '2019-09-26', 'วัสดุสำนักงาน', 45, 'ชิ้น', 4);

-- --------------------------------------------------------

--
-- Table structure for table `monk`
--

CREATE TABLE `monk` (
  `monkID` int(11) NOT NULL,
  `prefix` varchar(20) NOT NULL COMMENT 'คำนำหน้า',
  `name` varchar(100) NOT NULL COMMENT 'ชื่อ',
  `ordinationName` varchar(100) NOT NULL COMMENT 'ฉายา',
  `dateBirth` date NOT NULL COMMENT 'วันเกิด',
  `monk_address` varchar(250) NOT NULL COMMENT 'ที่อยู่',
  `templeID` int(11) NOT NULL COMMENT 'สังกัดวัด ',
  `sect` varchar(100) NOT NULL COMMENT 'นิกาย',
  `ordinateDate` date NOT NULL COMMENT 'วันที่อุปสมบท',
  `imgMonk` varchar(250) NOT NULL COMMENT 'รูปภาพ',
  `priestOfRank` varchar(100) NOT NULL COMMENT 'สมณศักดิ์'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monk`
--

INSERT INTO `monk` (`monkID`, `prefix`, `name`, `ordinationName`, `dateBirth`, `monk_address`, `templeID`, `sect`, `ordinateDate`, `imgMonk`, `priestOfRank`) VALUES
(1, 'พระมหา', 'ราชสังวรญาณ', 'อภิปุญฺโญ', '2019-08-20', 'วัดสำโรงเหนือ อำเภอพระประแดง จังหวัดสมุทรปราการ', 1, 'มหานิกาย', '2019-08-26', '99616124120190821_013537.jpeg', 'สมเด็จพระสังฆราชเจ้า '),
(2, 'พระอธิการ', 'ราชปัญญาโมลี ', 'คนฺธาโร ป.ธ.๖', '2019-08-14', ' วัดหลวงท้ายตลาด อำเภอเมืองลพบุรี จังหวัดลพบุรี', 3, 'มหานิกาย', '2019-08-29', '22811551420190821_013821.jpg', 'พระเปรียญธรรม ๙ ประโยค '),
(3, 'พระ', 'ราชวิสุทธิประชานาถ ', 'ติกฺขปญฺโญ ', '2019-08-22', 'อำเภอโพธาราม จังหวัดราชบุรี', 6, 'มหานิกาย', '2019-08-29', '152812002420190821_014139.jpeg', 'พระราชาคณะ เจ้าคณะจังหวัด '),
(4, 'พระ', 'อุดมศีลคุณ', 'อภิปุญฺโญ', '2019-08-27', 'วัดสำโรงเหนือ อำเภอพระประแดง จังหวัดสมุทรปราการ ', 4, 'มหานิกาย', '2019-08-28', '27427786920190821_014447.jpeg', 'พระราชาคณะ เจ้าคณะรอง ชั้นสัญญาบัตร '),
(5, 'พระอธิการ', 'สมพร', 'อาภาธโร', '2019-08-30', 'กรุงเทพ', 2, 'มหานิกาย', '2019-08-30', '214600966920190828_223418.jpeg', 'พระราชาคณะชั้นเทพ 66 รูป');

-- --------------------------------------------------------

--
-- Table structure for table `projectactivity`
--

CREATE TABLE `projectactivity` (
  `projectID` int(11) NOT NULL,
  `projectType` varchar(100) NOT NULL COMMENT 'ประเภท',
  `projectName` varchar(100) NOT NULL COMMENT 'ชื่อโครงการ/กิจกรรม',
  `projectDetail` varchar(250) NOT NULL COMMENT 'รายละเอียด',
  `startDate` date NOT NULL COMMENT 'วันที่เริ่มโครงการ',
  `endDate` date NOT NULL COMMENT 'วันสิ้นสุดโครงการ',
  `status` varchar(50) NOT NULL COMMENT 'สถานะ',
  `templeID` int(11) NOT NULL COMMENT 'รหัสวัด (FK)',
  `point` int(2) NOT NULL DEFAULT '1' COMMENT 'คะแนน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectactivity`
--

INSERT INTO `projectactivity` (`projectID`, `projectType`, `projectName`, `projectDetail`, `startDate`, `endDate`, `status`, `templeID`, `point`) VALUES
(1, 'กิจกรรม', 'สร้างวัดพระแก้ว', 'โครงกำรสร้ำงวัดและศูนย์วปิัสสนำกรรมฐำนนวมินทรรำชูทศิ\r\n ', '2019-08-28', '2019-08-30', 'ยังไม่เริ่มดำเนินการ', 1, 1),
(3, 'โครงการ', 'สร้างวัด', 'โครงกำรสร้ำงวัดและศูนย์วปิัสสนำกรรมฐำนนวมินทรรำชูทศิ\r\n ', '2019-08-30', '2019-08-31', 'กำลังดำเนินการ', 1, 1),
(4, 'กิจกรรม', 'สร้างวัด', 'โครงกำรสร้ำงวัดและศูนย์วปิัสสนำกรรม\r\n ', '2019-08-30', '2019-08-31', 'ดำเนินการเสร็จสิ้น', 1, 1),
(5, 'โครงการ', 'สร้างวัด', 'โครงกำรสร้ำงวัดและศูนย์วปิัสสนำกรรม', '2019-08-30', '2019-08-31', 'ดำเนินการเสร็จสิ้น', 1, 1),
(6, 'กิจกรรม', 'ทำโรงทาน', 'ทำอาหารแจกจ่ายประชาชนที่มาร่วมงานวัด', '2019-08-27', '2019-08-31', 'ยังไม่เริ่มดำเนินการ', 2, 1),
(7, 'กิจกรรม', 'สร้างวัดพระแก้ว', 'สร้างวัดพระแก้วสร้างวัดพระแก้วสร้างวัดพระแก้ว', '2019-09-14', '2019-09-28', 'กำลังดำเนินการ', 2, 1),
(8, 'กิจกรรม', 'งานประเพณี', 'งานประเพณีประจำงานวัด', '2019-09-28', '2019-09-30', 'ดำเนินการเสร็จสิ้น', 2, 1),
(9, 'กิจกรรม', 'งานประเพณี', 'งานประเพณีประจำงานวัด', '2019-09-28', '2019-09-30', 'ดำเนินการเสร็จสิ้น', 2, 1),
(10, 'กิจกรรม', 'สร้างวัดพระแก้ว', 'สร้างวัดพระแก้วสร้างวัดพระแก้วสร้างวัดพระแก้ว', '2019-09-14', '2019-09-28', 'ดำเนินการเสร็จสิ้น', 2, 1),
(11, 'กิจกรรม', 'สร้างวัดพระแก้ว', 'สร้างวัดพระแก้วสร้างวัดพระแก้วสร้างวัดพระแก้ว', '2019-09-14', '2019-09-28', 'กำลังดำเนินการ', 2, 1),
(12, 'กิจกรรม', 'งานประเพณี', 'งานประเพณีประจำงานวัด', '2019-09-28', '2019-09-30', 'ดำเนินการเสร็จสิ้น', 2, 1),
(13, 'กิจกรรม', 'งานประเพณี', 'งานประเพณีประจำงานวัด', '2019-09-28', '2019-09-30', 'ดำเนินการเสร็จสิ้น', 2, 1),
(14, 'โครงการ', 'สร้างวัด', 'สร้างวัดสร้างวัดสร้างวัด', '2019-09-13', '2019-10-09', 'ดำเนินการเสร็จสิ้น', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectactivity_evaluation`
--

CREATE TABLE `projectactivity_evaluation` (
  `evaluationID` int(11) NOT NULL,
  `templeID` int(11) NOT NULL COMMENT 'รหัสวัด (FK)',
  `evaluationDate` date NOT NULL COMMENT 'วันที่ประเมิน',
  `totalPoint` int(11) NOT NULL COMMENT 'คะแนนรวม',
  `result` varchar(100) NOT NULL COMMENT 'ผลประเมิน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `propertyID` int(11) NOT NULL,
  `propertyName` varchar(100) NOT NULL COMMENT 'รายการศาสนสมบัติ',
  `propertyDetail` varchar(250) NOT NULL,
  `type` varchar(100) NOT NULL,
  `templeID` int(11) NOT NULL COMMENT 'รหัสวัด (FK)',
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'วันที่ลงทะเบียน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyID`, `propertyName`, `propertyDetail`, `type`, `templeID`, `registerDate`) VALUES
(1, 'ที่ดิน 100 ไร่', 'ผลที่เกิดขึ้นจากที่ดินและอาคารนั้น ๆ รวมทั้งที่ดินวัดร้างทั่วประเทศที่ทางการได้ประกาศยุบเลิกวัดแล้ว.', 'ศาสนสมบัติกลาง', 2, '2019-08-20 19:23:14'),
(2, 'พระปฐมเจดีย์', 'เป็นศาสนสมบัติของวัดพระปฐมเจดีย์', 'ศาสนสมบัติของวัด', 5, '2019-08-20 19:34:34'),
(3, 'พระธาตุพนม', 'เป็นศาสนสมบัติของวัดธาตุพนม', 'ศาสนสมบัติของวัด', 4, '2019-08-20 19:35:16'),
(4, 'พระธาตุพนม11', 'เป็นศาสนสมบัติของวัดธาตุพนม', 'ศาสนสมบัติของวัด', 1, '2019-08-21 14:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `subdistrict`
--

CREATE TABLE `subdistrict` (
  `subDistrictID` int(2) NOT NULL,
  `subDistrictName` varchar(25) NOT NULL,
  `districtID` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subdistrict`
--

INSERT INTO `subdistrict` (`subDistrictID`, `subDistrictName`, `districtID`) VALUES
(1, 'กกโก', 1),
(2, 'โก่งธนู', 1),
(3, 'เขาพระงาม', 1),
(4, 'เขาสามยอด', 1),
(5, 'โคกกะเทียม', 1),
(6, 'โคกตูม', 1),
(7, 'โคกลำพาน', 1),
(8, 'งิ้วราย', 1),
(9, 'ดอนโพธิ์', 1),
(10, 'ตะลุง', 1),
(11, 'ถนนใหญ่', 1),
(12, 'ทะเลชุบศร', 1),
(13, 'ท่าแค', 1),
(14, 'ท้ายตลาด', 1),
(15, 'ท่าศาลา', 1),
(16, 'ท่าหิน', 1),
(17, 'นิคมสร้างตนเอง', 1),
(18, 'บางขันหมาก', 1),
(19, 'บ้านข่อย', 1),
(20, 'ป่าตาล', 1),
(21, 'พรหมมาสตร์', 1),
(22, 'โพธิ์เก้าต้น', 1),
(23, 'โพธิ์ตรุ', 1),
(24, 'สี่คลอง', 1),
(25, 'โคกเจริญ', 2),
(26, 'โคกแสมสาร', 2),
(27, 'ยางราก', 2),
(28, 'วังทอง', 2),
(29, 'หนองมะค่า', 2),
(30, 'โคกสำโรง', 3),
(31, 'เกาะแก้ว', 3),
(32, 'คลองเกตุ', 3),
(33, 'ดงมะรุม', 3),
(34, 'ถลุงเหล็ก', 3),
(35, 'เพนียด', 3),
(36, 'วังขอนขว้าง', 3),
(37, 'วังจั่น', 3),
(38, 'วังเพลิง', 3),
(39, 'สะแกราบ', 3),
(40, 'หนองแขม', 3),
(41, 'หลุมข้าว', 3),
(42, 'ห้วยโป่ง', 3),
(43, 'ชัยบาดาล', 4),
(44, 'เกาะรัง', 4),
(45, 'เขาแหลม', 4),
(46, 'ชัยนารายณ์', 4),
(47, 'ซับตะเคียน', 4),
(48, 'ท่าดินดำ', 4),
(49, 'ท่ามะนาว', 4),
(50, 'นาโสม', 4),
(51, 'นิคมลำนารายณ์', 4),
(52, 'บัวชุม', 4),
(53, 'บ้านใหม่สามัคคี', 4),
(54, 'ม่วงค่อม', 4),
(55, 'มะกอกหวาน', 4),
(56, 'ลำนารายณ์', 4),
(57, 'ศิลาทิพย์', 4),
(58, 'หนองยายโต๊ะ', 4),
(59, 'ห้วยหิน', 4),
(60, 'ท่าวุ้ง', 5),
(61, 'เขาสมอคอน', 5),
(62, 'โคกสลุด', 5),
(63, 'บางคู้', 5),
(64, 'บางงา', 5),
(65, 'บางลี่', 5),
(66, 'บ้านเบิก', 5),
(67, 'โพตลาดแก้ว', 5),
(68, 'มุจลินท์', 5),
(69, 'ลาดสาลี่', 5),
(70, 'หัวสำโรง', 5),
(71, 'ท่าหลวง', 6),
(72, 'แก่งผักกูด', 6),
(73, 'ซับจำปา', 6),
(74, 'ทะเลวังวัด', 6),
(75, 'หนองผักแว่น', 6),
(76, 'หัวลำ', 6),
(77, 'บ้านหมี่', 7),
(78, 'ชอนม่วง', 7),
(79, 'เชียงงา', 7),
(80, 'ดงพลับ', 7),
(81, 'ดอนดึง', 7),
(82, 'บางกะพี้', 7),
(83, 'บางขาม', 7),
(84, 'บางพึ่ง', 7),
(85, 'บ้านกล้วย', 7),
(86, 'บ้านชี', 7),
(87, 'บ้านทราย', 7),
(88, 'ไผ่ใหญ่', 7),
(89, 'พุคา', 7),
(90, 'โพนทอง', 7),
(91, 'มหาสอน', 7),
(92, 'สนามแจง', 7),
(93, 'สายห้วยแก้ว', 7),
(94, 'หนองกระเบียน', 7),
(95, 'หนองเต่า', 7),
(96, 'หนองทรายขาว', 7),
(97, 'หนองเมือง', 7),
(98, 'หินปัก', 7),
(99, 'พัฒนานิคม', 8),
(100, 'โคกสลุง', 8),
(101, 'ช่องสาริกา', 8),
(102, 'ชอนน้อย', 8),
(103, 'ดีลัง', 8),
(104, 'น้ำสุด', 8),
(105, 'มะนาวหวาน', 8),
(106, 'หนองบัว', 8),
(107, 'ห้วยขุนราม', 8),
(108, 'ลำสนธิ', 9),
(109, 'กุดตาเพชร', 9),
(110, 'เขาน้อย', 9),
(111, 'เขารวก', 9),
(112, 'ซับสมบูรณ์', 9),
(113, 'หนองรี', 9),
(114, 'สระโบสถ์', 10),
(115, 'ทุ่งท่าช้าง', 10),
(116, 'นิยมชัย', 10),
(117, 'มหาโพธิ', 10),
(118, 'ห้วยใหญ่', 10),
(119, 'หนองม่วง', 11),
(120, 'ชอนสมบูรณ์', 11),
(121, 'ชอนสารเดช', 11),
(122, 'ดงดินแดง', 11),
(123, 'บ่อทอง', 11),
(124, 'ยางโทน', 11);

-- --------------------------------------------------------

--
-- Table structure for table `temple`
--

CREATE TABLE `temple` (
  `templeID` int(11) NOT NULL,
  `templeName` varchar(100) NOT NULL,
  `temple_address` varchar(250) NOT NULL,
  `villageNo` int(11) NOT NULL COMMENT 'หมู่',
  `subDistrictID` int(11) NOT NULL COMMENT 'ตำบล(FK)',
  `districtID` int(11) NOT NULL COMMENT 'อำเภอ(FK)',
  `postCode` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temple`
--

INSERT INTO `temple` (`templeID`, `templeName`, `temple_address`, `villageNo`, `subDistrictID`, `districtID`, `postCode`, `username`, `password`) VALUES
(1, 'วัดราษฏร์มหานิกาย', '410/10', 10, 8, 1, 10140, '111', '111'),
(2, 'วัดพรหมรังษี', '127/12', 12, 104, 8, 14110, '222', '222'),
(3, 'วัดปากน้ำ ', '12/33', 3, 65, 5, 33118, '333', '333'),
(4, 'วัดกวิศรารามราชวรวิหาร', '4/5', 6, 3, 1, 11233, '444', '444'),
(5, 'วัดศิริบรรพต ', '321/1', 11, 46, 4, 43310, '555', '555'),
(6, 'วัดสามัคคีพัฒนาราม', '32/12', 9, 117, 10, 13210, '666', '666');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `borrowreturn`
--
ALTER TABLE `borrowreturn`
  ADD PRIMARY KEY (`borrowID`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`districtID`);

--
-- Indexes for table `durablearticle`
--
ALTER TABLE `durablearticle`
  ADD PRIMARY KEY (`durableID`);

--
-- Indexes for table `monk`
--
ALTER TABLE `monk`
  ADD PRIMARY KEY (`monkID`);

--
-- Indexes for table `projectactivity`
--
ALTER TABLE `projectactivity`
  ADD PRIMARY KEY (`projectID`);

--
-- Indexes for table `projectactivity_evaluation`
--
ALTER TABLE `projectactivity_evaluation`
  ADD PRIMARY KEY (`evaluationID`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`propertyID`);

--
-- Indexes for table `subdistrict`
--
ALTER TABLE `subdistrict`
  ADD PRIMARY KEY (`subDistrictID`);

--
-- Indexes for table `temple`
--
ALTER TABLE `temple`
  ADD PRIMARY KEY (`templeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `borrowreturn`
--
ALTER TABLE `borrowreturn`
  MODIFY `borrowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `districtID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `durablearticle`
--
ALTER TABLE `durablearticle`
  MODIFY `durableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `monk`
--
ALTER TABLE `monk`
  MODIFY `monkID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectactivity`
--
ALTER TABLE `projectactivity`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `projectactivity_evaluation`
--
ALTER TABLE `projectactivity_evaluation`
  MODIFY `evaluationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `propertyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subdistrict`
--
ALTER TABLE `subdistrict`
  MODIFY `subDistrictID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `temple`
--
ALTER TABLE `temple`
  MODIFY `templeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
