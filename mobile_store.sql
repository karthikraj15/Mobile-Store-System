-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 07:13 AM.
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_store_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `count_orders` (IN `Mobile_ID` INT)  SELECT COUNT(Ord_ID) AS Total_Orders,SUM(Quantity) AS Total_Quantity FROM orders WHERE Mob_ID = Mobile_ID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Comp_ID` int(10) NOT NULL,
  `Comp_Name` varchar(40) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Estd` varchar(20) DEFAULT NULL,
  `Details` text DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Comp_ID`, `Comp_Name`, `Email`, `Location`, `Estd`, `Details`, `status`) VALUES
(1001, 'Samsung', 'samsung11@gmail.com', 'Noida India', '1988', 'The Samsung Group[3 (or simply Samsung) (Korean) is a South Korean multinational manufacturing conglomerate headquartered in Samsung Town, Seoul, South Korea It comprises numerous affiliated businesses, most of them united under the Samsung brand, and is the largest South Korean chaebol (business conglomerate). As of 2020, Samsung has the 8th highest global brand value.\r\n    Samsung was founded by Lee Byung-chul in 1938 as a trading company. Over the next three decades, the group diversified into areas including food processing, textiles, insurance, securities, and retail. Samsung entered the electronics industry in the late 1960s and the construction and shipbuilding industries in the mid-1970s; these areas would drive its subsequent growth. Following Lee\'s death in 1987, Samsung was separated into five business groups – Samsung Group, Shinsegae Group, CJ Group and Hansol Group, and Joongang Group.', 'active'),
(1002, 'Nokia', 'nokia10@gmail.com', 'Mumbai', '1981', 'Nokia Corporation (natively Nokia Oyj, referred to as Nokia; stylized as NOKIA) is a Finnish multinational telecommunications, information technology, and consumer electronics company, founded in 1865. Nokia\'s main headquarters are in Espoo, Finland, in the greater Helsinki metropolitan area,[4] but the company\'s actual roots are in the Tampere region of Pirkanmaa. In 2020, Nokia employed approximately 92,000 people across over 100 countries, did business in more than 130 countries, and reported annual revenues of around €23 billion. Nokia is a public limited company listed on the Helsinki Stock Exchange and New York Stock Exchange. It is the world\'s 415th-largest company measured by 2016 revenues according to the Fortune Global 500, having peaked at 85th place in 2009.[9] It is a component of the Euro Stoxx 50 stock market index.', 'active'),
(1003, 'Google', 'google@gmail.com', 'New York', '1985', 'Google announced the first generation Pixel smartphones, the Pixel and the Pixel XL, on October 4, 2016 during the #MadeByGoogle event.[1] Google emphasized the camera on the two phones, which ranked as the best smartphone camera on DxOMarkMobile with 90 points until HTC released the U11, which also scored 90 points.[2] This is largely due to software optimizations such as HDR+. The Pixel phones also include unlimited cloud storage for pictures on Google Photos[3] and, for devices purchased directly from Google, an unlockable bootloader.[4] Recently, a class action lawsuit[5] over faulty microphones in some devices enabled Pixel owners to claim up to $500 in compensation.', 'active'),
(1004, 'Xiaomi', 'xiaomi@gmail.com', 'Kwait', '1980', 'Xiaomi Corporation (/ˈʃaʊmiː/;[2] Chinese: 小米 ), registered in Asia as Xiaomi Inc., is a Chinese designer and manufacturer of consumer electronics and related software, home appliances, and household items. Behind Samsung, it is the second largest manufacturer of smartphones, most of which run the MIUI operating system, (software development). In 2020, the company sold 146.3 million smartphones and, as of August 2021, its MIUI operating system had over 450 million monthly active users.[3][4] It also is a major manufacturer of appliances including televisions, flashlights, unmanned aerial vehicles, and air purifiers using its Internet of Things and Xiaomi Smart Home product ecosystems. The name \"Xiaomi\" literally means millet and rice, and is based on the Buddhist concept of starting from the bottom before aiming for the top.[5]', 'active'),
(1005, 'Apple', 'apple@gmail.com', 'California', '1985', 'The iPhone is a line of smartphones designed and marketed by Apple Inc. that use Apple\'s iOS mobile operating system. The first-generation iPhone was announced by then-Apple CEO Steve Jobs on January 9, 2007. Since then, Apple has annually released new iPhone models and iOS updates. As of November 1, 2018, more than 2.2 billion iPhones had been sold.\r\n    \r\n    The iPhone has a user interface built around a multi-touch screen. It connects to cellular networks or Wi-Fi, and can make calls, browse the web, take pictures, play music and send and receive emails and text messages. Since the iPhone\'s launch further features have been added, including larger screen sizes, shooting video, waterproofing, the ability to install third-party mobile apps through an app store, and many accessibility features. Up to iPhone 8 and 8 Plus, iPhones used a layout with a single button on the front panel that returns the user to the home screen. Since iPhone X, iPhone models have switched to a nearly bezel-less front screen design with app switching activated by gesture recognition.', 'active'),
(1006, 'Vivo', 'vivo@gmail.com', 'Indonesia', '2001', 'Vivo Communication Technology Co. Ltd., styled vivo in its logo, is a Chinese technology company headquartered in Dongguan, Guangdong that designs and develops smartphones, smartphone accessories, software and online services. The company develops software for its phones, distributed through its V-Appstore, with iManager included in their proprietary, Android-based operating system, Funtouch OS in Global, Origin OS in Mainland China and India. Vivo is an independent company and develops its own products. It has 10,000 employees, with research and development centers in Shenzhen, Guangdong, and Nanjing, Jiangsu.[3]', 'active'),
(1007, 'Oppo', 'oppo@gmail.com', 'China', '1995', 'Guangdong Oppo Mobile Telecommunications Corp., Ltd, doing business as OPPO,[a] is a Chinese consumer electronics and mobile communications company headquartered in Dongguan, Guangdong. Its major product lines include smartphones, smart devices, audio devices, power banks, and other electronic products.\r\nThe brand name \"Oppo\" was registered in China in 2001 and launched in 2004.[1] Since then, the company has expanded to 50 countries.[1]\r\n\r\nIn June 2016, OPPO became the largest smartphone manufacturer in China,[2] selling its phones at more than 200,000 retail outlets.[3] OPPO was the top smartphone brand in China in 2019 and was ranked No. 5, in market share, worldwide.[4]', 'active'),
(1008, 'Oneplus', 'oneplus@gmail.com', 'Bangalore', '2001', 'OnePlus Technology (Shenzhen) Co., Ltd. (一加科技) is a Chinese consumer electronics manufacturer headquartered in Shenzhen, Guangdong province, in the Tairan Building (泰然大厦) at the Chegong Temple (车公庙) subdistrict of Futian District.[6] It was founded by Pete Lau and Carl Pei in December 2013, and is currently majority-owned by Oppo as its only shareholder, which is a subsidiary of BBK Electronics along with Vivo, Realme and iQOO. The company is best known for making smartphones, and officially serves 34 countries and regions around the world as of July 2018.[2]', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(10) NOT NULL,
  `Cust_Name` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Cust_Name`, `Email`, `Phone`, `Address`, `status`) VALUES
(101, 'Rahul S', 'rahul@gmail.com', '9685741256', 'No 555 5th main road vijayanagar bangalore', 'active'),
(102, 'Rohit S', 'rohit111@gamil.com', '8905555447', '48/21 , 18th cross food street navi mumbai', 'active'),
(103, 'Virat', 'virat@gmail.com', '91145459', 'Navy road Delhi', 'active'),
(104, 'MS Dhoni', 'dhoni@gmail.com', '8569741256', 'No 486 15th main road church street New Delhi ', 'active'),
(105, 'Karthik', 'karthikraj@gmail.com', '9113045458', 'No 280 3rd main Kalyan Nagar Nagarbhavi Bangalore - 560072', 'active'),
(106, 'Senthil', 'senthil@gmail.com', '7412563985', 'Pondicherry', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
  `Mob_ID` int(10) NOT NULL,
  `Mob_image` text DEFAULT NULL,
  `Mob_Name` varchar(20) NOT NULL,
  `Mfd_Date` varchar(20) DEFAULT NULL,
  `Price` int(10) DEFAULT NULL,
  `Comp_ID` int(10) DEFAULT NULL,
  `Stock` int(10) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`Mob_ID`, `Mob_image`, `Mob_Name`, `Mfd_Date`, `Price`, `Comp_ID`, `Stock`, `status`) VALUES
(1, 'https://media.wired.com/photos/5e8d09b9798a15000821feb0/1:1/w_1800,h_1800,c_limit/Gear-Feature-Samsung-Galaxy-A51-front-SOURCE-Samsung.jpg', 'Samsung Galaxy M32', '20-01-2019', 30000, 1001, 18, 'active'),
(2, 'https://m.media-amazon.com/images/I/61NoYt2pvpS._SX679_.jpg', 'Nokia 5', '23-08-2019', 15000, 1002, 17, 'active'),
(3, 'https://media.wired.com/photos/5f888e1e033aa21518af44c2/1:1/w_1800,h_1800,c_limit/Gear-Google-Pixel-5-SOURCE-Google.jpg', 'Google Pixel 6', '20-12-2020', 60000, 1003, 18, 'active'),
(4, 'https://img.tatacliq.com/images/i4/1348Wx2000H/MP000000006701299_1348Wx2000H_20200331221936.jpeg', 'Redmi K20 pro', '15-08-2019', 29000, 1004, 40, 'active'),
(5, 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone13_hero_09142021_inline.jpg.large.jpg', 'iphone 13 ', '20-12-2021', 79000, 1005, 10, 'active'),
(6, 'https://m.media-amazon.com/images/I/51Y5ESiD11L._SL1000_.jpg', 'Vivo V15', '10-02-2020', 14000, 1006, 22, 'active'),
(7, 'https://img.giznext.com/assets/model/9/309/oppo-f15-6580ab20b384ffe5b45922fd3cc1cc.jpg', 'Oppo F15', '24-08-2018', 20000, 1007, 40, 'active'),
(8, 'https://image3.mouthshut.com/images/imagesp/926049858s.jpg', 'One plus 8', '14-04-2021', 45000, 1008, 32, 'active'),
(9, 'https://i01.appmifile.com/webfile/globalimg/in/cms/D1301D76-E04D-EF09-6195-53229DE6D543.jpg', 'Mi 10', '15-10-2015', 20000, 1004, 20, 'active'),
(10, 'https://m.media-amazon.com/images/I/81-tqKsrTuL._SX466_.jpg', 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 18, 'active');

--
-- Triggers `mobile`
--
DELIMITER $$
CREATE TRIGGER `mobile_delete` BEFORE DELETE ON `mobile` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.Mob_ID,OLD.Mob_name,OLD.Mfd_Date,OLD.Price,OLD.Comp_ID,OLD.Stock,'DELETED',CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mobile_insert` AFTER INSERT ON `mobile` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.Mob_ID,NEW.Mob_name,NEW.Mfd_Date,NEW.Price,NEW.Comp_ID,NEW.Stock,'INSERTED',CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mobile_update` AFTER UPDATE ON `mobile` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.Mob_ID,NEW.Mob_name,NEW.Mfd_Date,NEW.Price,NEW.Comp_ID,NEW.Stock,'UPDATED',CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Ord_ID` int(10) NOT NULL,
  `Ord_Date` varchar(15) DEFAULT NULL,
  `Ord_Price` int(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Invoice` int(10) DEFAULT NULL,
  `Mob_ID` int(10) DEFAULT NULL,
  `Cust_ID` int(10) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Ord_ID`, `Ord_Date`, `Ord_Price`, `Quantity`, `Invoice`, `Mob_ID`, `Cust_ID`, `status`) VALUES
(5001, '20-11-2018', 65000, 1, 562413, 1, 101, 'active'),
(5002, '5-12-2019', 14500, 1, 896327, 2, 101, 'active'),
(5003, '8-8-2018', 14600, 1, 685236, 3, 102, 'active'),
(5015, '20-11-2021', 6000, 1, 321456, 1, 103, 'active'),
(5016, '20-11-2015', 14600, 2, 147852, 4, 104, 'active'),
(5019, '04-01-2022', 15000, 3, 478562, 5, 102, 'active'),
(5023, '06-01-2022', 30000, 3, 415263, 1, 106, 'active'),
(5024, '15-01-2022', 15000, 2, 120005, 2, 102, 'active');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `stock_update_2` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
IF((SELECT mobile.Stock from mobile WHERE mobile.Mob_ID=NEW.Mob_ID)<NEW.Quantity) THEN
 SIGNAL sqlstate '45001' set message_text = "Quantity is more than Stock !";
END if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_update_1` AFTER INSERT ON `orders` FOR EACH ROW UPDATE mobile SET Stock=Stock-NEW.Quantity WHERE mobile.Mob_ID=NEW.Mob_ID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `Mobile_ID` int(10) NOT NULL,
  `Processor` varchar(40) DEFAULT NULL,
  `Camera` varchar(15) DEFAULT NULL,
  `Display_Size` varchar(10) DEFAULT NULL,
  `Battery` varchar(15) DEFAULT NULL,
  `RAM` varchar(10) DEFAULT NULL,
  `Storage` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`Mobile_ID`, `Processor`, `Camera`, `Display_Size`, `Battery`, `RAM`, `Storage`) VALUES
(1, 'Exynos 990 ', '24MP', '6.3 inch', '4000 mah', '6GB', '128GB'),
(2, 'snapdragon 830', '20MP', '6.2 inch', '4000mah', '6GB', '64GB'),
(3, 'Qualcomm MSM89', '25MP', '6.1 inch', '3500mah', '6GB', '128GB'),
(4, 'Qualcomm®4 Snapdragon 855', '20MP', '6.2 inch', '4000 mah', '6GB', '128GB'),
(5, 'A14 Bionic Chip', '12MP', '6.0 inch', '3200 mah', '4GB', '64GB'),
(6, 'Mediatek 370', '12MP', '6.1 inch', '4200 mah', '4GB', '64GB'),
(7, 'Mediatek 550', '12MP', '6.1 inch', '4200 mah', '6GB', '128GB'),
(8, 'SnapDragon 888', '32MP', '6.2 inch', '4580 mah', '6 GB', '64 GB'),
(9, 'Qualcomm Snapdragon 835', '25MP', '6.3 inch', '4500 mah', '8GB', '64GB'),
(10, 'Exynos 990', '25MP', '6.5inch', '4000mah', '6GB', '128GB');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `Store_ID` int(10) NOT NULL,
  `Store_Name` varchar(20) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Comp_ID` int(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`Store_ID`, `Store_Name`, `Phone`, `Location`, `Comp_ID`, `Description`, `status`) VALUES
(1101, 'Samsung Store', '7845125236', 'Chennai', 1001, 'Samsung Galaxy Store (marketed as Galaxy Store; formerly known as Samsung Apps and Galaxy Apps) is an app store used for devices manufactured by Samsung Electronics that was launched in September 2009.\r\n\r\nThe service is primarily supplied pre-installed on Samsung Galaxy smartphones, Samsung Gear, and feature phones (such as the Samsung REX and Duos).\r\n\r\nThe store is available in 125 countries, and it offers apps for Android, Tizen, Windows Mobile, and Bada platforms. Apps from this store are updated by notifying the user via the Samsung Push Service, which has been installed in over one billion smartphones over the years', 'active'),
(1102, 'Nokia Store', '8974561254', 'Bangalore', 1002, 'In March 2007, The Essar Group, the promoters of The NokiaStore, entered into a co-branding Agreement with Richard Branson\'s Virgin Group.[2] According to the terms of the agreement The NokiaStore was allowed to display the \"Virgin\" brand while the Virgin Group provided technical and consultancy services for a fee.\r\n\r\nIn February 2009, The NokiaStore entered into a strategic tie-up with Kingston Technology. Kingston mobile memory products are sold in The NokiaStore stores.', 'active'),
(1103, 'Google Store', '9999557741', 'Mumbai', 1003, 'Google Pixel is a brand of consumer electronic devices developed by Google that run either Chrome OS or the Android operating system. The Pixel brand was introduced in February 2013 with the first-generation Chromebook Pixel. The Pixel line includes laptops, tablets, and smartphones, as well as several accessories.', 'active'),
(1104, 'MI Store', '8956234174', 'Bangalore', 1004, 'Redmi is a subsidiary company owned by the Chinese electronics company Xiaomi. It was first announced in July 2013 as a budget smartphone line,[1] and became a separate sub-brand of Xiaomi in 2019 with entry-level and mid-range devices, while Xiaomi itself produces upper-range and flagship Mi phones. Redmi phones use the Xiaomi\'s MIUI user interface on top of Android. Models are divided into the entry-level Redmi, the mid-range Redmi Note, and the high-end Redmi K. In addition, the unrelated Mi A Android One series is also positioned in the similar market segment with Redmi devices, despite being part of the upper-range Xiaomi Mi lineup. The most significant difference from other Xiaomi smartphones is that they use less-expensive components and thus have lower prices while retaining higher specifications. In August 2014, The Wall Street Journal reported that in the second quarter of the 2014 fiscal year, Xiaomi had a market share of 4% of smartphone shipment rankings in China.[2] Redmi sales were attributed as a contributing factor toward this gain in shipment rankings.[2]', 'active'),
(1105, 'Apple Store', '8888889900', 'New York', 1005, 'The first Apple Stores were originally opened as two locations in May 2001 by then-CEO Steve Jobs, after years of attempting but failing store-within-a-store concepts. Seeing a need for improved retail presentation of the company\'s products, he began an effort in 1997 to revamp the retail program to get an improved relationship with consumers and hired Ron Johnson in 2000. Jobs relaunched Apple\'s online store in 1997 and opened the first two physical stores in 2001. The media initially speculated that Apple would fail, but its stores were highly successful, by passing the sales numbers of competing for nearby stores and within three years reached US$1 billion in annual sales, becoming the fastest retailer in history to do so', 'active'),
(1106, 'Vivo Store', '7411256385', 'Chennai', 1006, 'Today Vivo operates an UMTS, 3G networks and bands 1, 7, 3, 28 4G LTE in most Brazilian cities. Initially, the network was based on analog AMPS (IS-95) and parts (resulting from acquisition of other companies), using TDMA (IS-136). These were all converted to GSM beginning in 2006, when, after years being the only CDMA network. For some years, GSM and CDMA networks coexisted.[4] In the second half of the 2000s, the CDMA network was gradually converted to CDMA2000 in the major cities. The CDMA network was discontinued in November 2012.[5]', 'active'),
(1107, 'Oppo Store ', '7536985214', 'Kolkata', 1007, 'OPPO hires celebrity endorsers in Vietnam. Sơn Tùng M-TP endorsed three smartphone units: Neo 5, Neo 7, and F1s. Oppo made a sponsorship to one of Vietnam\'s top-rated reality shows, The Face Vietnam.[10][11][12][13]\r\n\r\nIn 2017, OPPO won the bid to sponsor the India national cricket team, which allows their logo to be used on the team\'s kits from 2017 to 2019.[14]\r\n\r\nIn 2019, OPPO became a sponsoring partner of the French Open tennis tournament held in Roland-Garros, Paris. The same year, they also became a sponsoring partner of Wimbledon for 5 years as the first official smartphone partner.[15][2]\r\n\r\nStarting with the 2019 World Championship, OPPO is the exclusive global smartphone partner for League of Legends esports through 2024, Oppo will have year-round activations centered around the sport’s three annual global tournaments: the Mid-Season Invitational, the All-Star Event, and the World Championship.[16]', 'active'),
(1108, 'Oneplus Store', '777755522', 'Bangalore', 1008, 'OnePlus was founded on 16 December 2013 by former Oppo vice-president Pete Lau and Carl Pei.[7] According to Chinese public records, OnePlus\' only institutional shareholder is Oppo Electronics.[4] Lau denied that OnePlus was a wholly owned subsidiary of Oppo and stated that Oppo Electronics and not Oppo Mobile (the phone manufacturer) is a major investor of OnePlus and that they are \"in talks with other investors\",[8] although OnePlus has confirmed it uses Oppo\'s manufacturing line and shares part of the supply chain resources with Oppo.[9] The company\'s main goal was to design a smartphone that would balance high-end quality with a lower price than other phones in its class, believing that users would \"Never Settle\" for the lower-quality devices produced by other companies. Lau explained that \"we will never be different just for the sake of being different. Everything done has to improve the actual user experience in day-to-day use.\"[10][11] He also showed aspirations of being the \"Muji of the tech industry\"', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `trig_id` int(11) NOT NULL,
  `Mob_ID` int(10) DEFAULT NULL,
  `Mob_name` varchar(20) DEFAULT NULL,
  `Mfd_Date` varchar(20) DEFAULT NULL,
  `Price` int(10) DEFAULT NULL,
  `Comp_ID` int(10) DEFAULT NULL,
  `Stock` int(10) DEFAULT NULL,
  `Query` varchar(20) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `Time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`trig_id`, `Mob_ID`, `Mob_name`, `Mfd_Date`, `Price`, `Comp_ID`, `Stock`, `Query`, `Date`, `Time`) VALUES
(4, 2, 'Nokia 5', '23-08-2019', 15000, 1002, 20, 'UPDATED', '2022-01-13', '20:15:25'),
(5, 5, 'iphone 13 ', '20-12-2021', 79000, 1005, 10, 'UPDATED', '2022-01-13', '20:26:48'),
(8, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 15, 'INSERTED', '2022-01-13', '21:08:16'),
(9, 2, 'Nokia 5', '23-08-2019', 15000, 1002, 18, 'UPDATED', '2022-01-15', '20:16:59'),
(10, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-01-31', '21:50:19'),
(11, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 16, 'UPDATED', '2022-01-31', '22:06:46'),
(12, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-01-31', '22:29:41'),
(13, 1, 'Samsung Galaxy M32', '20-01-2019', 30000, 1001, 21, 'UPDATED', '2022-02-01', '10:41:27'),
(14, 1, 'Samsung Galaxy M32', '20-01-2019', 30000, 1001, 20, 'UPDATED', '2022-02-01', '10:42:23'),
(15, 1, 'Samsung Galaxy M32', '20-01-2019', 30000, 1001, 19, 'UPDATED', '2022-02-01', '10:43:30'),
(16, 2, 'Nokia 5', '23-08-2019', 15000, 1002, 17, 'UPDATED', '2022-02-01', '10:44:25'),
(17, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-02-01', '10:47:31'),
(18, 1, 'Samsung Galaxy M32', '20-01-2019', 30000, 1001, 18, 'UPDATED', '2022-02-01', '10:49:15'),
(19, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-02-01', '10:50:28'),
(20, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-02-01', '10:56:18'),
(21, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-02-01', '10:56:33'),
(22, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-02-01', '10:59:40'),
(23, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-02-01', '11:02:15'),
(24, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-02-01', '11:02:25'),
(25, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-02-01', '11:03:29'),
(26, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, -1, 'UPDATED', '2022-02-01', '11:03:48'),
(27, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 20, 'UPDATED', '2022-02-01', '11:11:26'),
(28, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 19, 'UPDATED', '2022-02-01', '11:14:09'),
(29, 10, 'Samsung Galaxy M52 5', '14-10-2020', 40000, 1001, 18, 'UPDATED', '2022-02-01', '11:27:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Comp_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD PRIMARY KEY (`Mob_ID`),
  ADD KEY `Comp_ID` (`Comp_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Ord_ID`),
  ADD KEY `Mob_index` (`Mob_ID`),
  ADD KEY `cust_id_index` (`Cust_ID`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`Mobile_ID`),
  ADD KEY `Mobile_ID` (`Mobile_ID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`Store_ID`),
  ADD KEY `Comp_ID` (`Comp_ID`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`trig_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Ord_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5054;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `trig_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
  ADD CONSTRAINT `mobile_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `company` (`Comp_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Mob_ID`) REFERENCES `mobile` (`Mob_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `specs`
--
ALTER TABLE `specs`
  ADD CONSTRAINT `specs_ibfk_1` FOREIGN KEY (`Mobile_ID`) REFERENCES `mobile` (`Mob_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`Comp_ID`) REFERENCES `company` (`Comp_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
