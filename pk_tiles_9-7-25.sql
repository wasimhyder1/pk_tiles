-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.3.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table pk_tiles_db.glazeline
CREATE TABLE IF NOT EXISTS `glazeline` (
  `glazeline_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `supervisor_name` varchar(50) COLLATE armscii8_bin NOT NULL,
  `shift` varchar(50) COLLATE armscii8_bin NOT NULL,
  `date` varchar(50) COLLATE armscii8_bin NOT NULL,
  `day` varchar(50) COLLATE armscii8_bin NOT NULL,
  `glaze_pickup_1` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `engobe_pickup_1` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `density_1` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `viscosity_1` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `glaze_pickup_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `engobe_pickup_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `density_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `viscosity_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `checking_time` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`glazeline_id`)
) ENGINE=MyISAM DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table pk_tiles_db.glazeline: 0 rows
/*!40000 ALTER TABLE `glazeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `glazeline` ENABLE KEYS */;

-- Dumping structure for table pk_tiles_db.gpd
CREATE TABLE IF NOT EXISTS `gpd` (
  `gpd_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `supervisor_name` varchar(50) COLLATE armscii8_bin NOT NULL,
  `shift` varchar(50) COLLATE armscii8_bin NOT NULL,
  `date` varchar(50) COLLATE armscii8_bin NOT NULL,
  `day` varchar(50) COLLATE armscii8_bin NOT NULL,
  `write_verified_data` varchar(50) COLLATE armscii8_bin NOT NULL,
  `ball_mill_4` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_3` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_1` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `emptied_ball_mills` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `loaded_ball_mills` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `ute_stock` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `glaze_stock` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `engobe_stock` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `tank_1` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `material_1` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `stock_1` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `tank_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `material_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `stock_2` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`gpd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table pk_tiles_db.gpd: 0 rows
/*!40000 ALTER TABLE `gpd` DISABLE KEYS */;
INSERT INTO `gpd` (`gpd_id`, `user_id`, `supervisor_name`, `shift`, `date`, `day`, `write_verified_data`, `ball_mill_4`, `ball_mill_3`, `ball_mill_2`, `ball_mill_1`, `emptied_ball_mills`, `loaded_ball_mills`, `ute_stock`, `glaze_stock`, `engobe_stock`, `tank_1`, `material_1`, `stock_1`, `tank_2`, `material_2`, `stock_2`, `created_at`) VALUES
	(1, 2, 'Ali Akbar ', 'A', '09-07-2025 ', 'Wednesday ', '', '', '', '2', '1', '', '', '1200 kg', '12 ton', '13 ton', '', '', '', '', '', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `gpd` ENABLE KEYS */;

-- Dumping structure for table pk_tiles_db.press
CREATE TABLE IF NOT EXISTS `press` (
  `press_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `supervisor_name` varchar(50) COLLATE armscii8_bin NOT NULL,
  `shift` varchar(50) COLLATE armscii8_bin NOT NULL,
  `date` varchar(50) COLLATE armscii8_bin NOT NULL,
  `day` varchar(50) COLLATE armscii8_bin NOT NULL,
  `thickness` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `cycle` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `size` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `pressure_kn_1` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `pressure_kn_2` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `pressure_kn_3` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `pressure_kn_4` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `checking_time` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`press_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table pk_tiles_db.press: 1 rows
/*!40000 ALTER TABLE `press` DISABLE KEYS */;
INSERT INTO `press` (`press_id`, `user_id`, `supervisor_name`, `shift`, `date`, `day`, `thickness`, `cycle`, `size`, `pressure_kn_1`, `pressure_kn_2`, `pressure_kn_3`, `pressure_kn_4`, `checking_time`, `created_at`) VALUES
	(1, 2, 'Wasim', 'G', '09-07-2025', 'Wednesday', '45', '86', '22', '76', '56', '23', '09', '12', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `press` ENABLE KEYS */;

-- Dumping structure for table pk_tiles_db.slip_house
CREATE TABLE IF NOT EXISTS `slip_house` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `supervisor_name` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `shift` varchar(255) COLLATE armscii8_bin NOT NULL,
  `date` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin NOT NULL,
  `day` char(50) COLLATE armscii8_bin NOT NULL,
  `checktime_1` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `checktime_2` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `checktime_3` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `standard` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `sieve` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `p_s_parameter` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_1` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_2` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_3` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `ball_mill_4` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `write_verified_data1` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `write_verified_data2` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `moisture_1` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `p_check_time1` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `moisture_2` char(50) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  `p_check_time2` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `checked_by` char(50) COLLATE armscii8_bin DEFAULT NULL,
  `created_at` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table pk_tiles_db.slip_house: 0 rows
/*!40000 ALTER TABLE `slip_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `slip_house` ENABLE KEYS */;

-- Dumping structure for table pk_tiles_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE armscii8_bin NOT NULL,
  `email` varchar(255) COLLATE armscii8_bin NOT NULL,
  `password` varchar(255) COLLATE armscii8_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table pk_tiles_db.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
	(2, 'Miesam', 'miesam@gmail.com', '$2b$10$PlVJCk5wdombtlDFndIZc.CNpVvPoLsJX2w8bG3cFehSS3exFUBcW', '2025-05-27 03:50:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
