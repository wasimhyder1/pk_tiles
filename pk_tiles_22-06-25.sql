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
  `created_at` timestamp NOT NULL,
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

-- Dumping data for table pk_tiles_db.users: 2 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
	(2, 'Miesam', 'miesam@gmail.com', '$2b$10$PlVJCk5wdombtlDFndIZc.CNpVvPoLsJX2w8bG3cFehSS3exFUBcW', '2025-05-27 03:50:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
