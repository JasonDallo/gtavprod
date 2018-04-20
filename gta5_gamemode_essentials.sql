-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.18-log - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour gta5_gamemode_essential
CREATE DATABASE IF NOT EXISTS `gta5_gamemode_essential` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gta5_gamemode_essential`;

-- Export de la structure de la table gta5_gamemode_essential. bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.bans : ~0 rows (environ)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. coordinates
CREATE TABLE IF NOT EXISTS `coordinates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.coordinates : ~9 rows (environ)
/*!40000 ALTER TABLE `coordinates` DISABLE KEYS */;
INSERT INTO `coordinates` (`id`, `x`, `y`, `z`) VALUES
	(1, 1905.14331054688, 4886.01220703125, 47.1335029602051),
	(2, 58.8187294006348, 3683.3603515625, 39.837329864502),
	(3, -106.086303710938, -2230.79516601563, 7.81167411804199),
	(4, 2945.14331054688, 2796.76635742188, 40.21630859375),
	(5, 1701.44848632813, -1500.59387207031, 112.968475341797),
	(6, 112.998138427734, -399.107391357422, 41.264030456543),
	(7, -1891.75646972656, 1956.87731933594, 148.821807861328),
	(8, -126.131416320801, 1923.0673828125, 197.292236328125),
	(9, -163.365112304688, -43.9505920410156, 52.9844131469727);
/*!40000 ALTER TABLE `coordinates` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `limitation` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.items : ~6 rows (environ)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `libelle`, `limitation`) VALUES
	(1, 'Cocaine Brut', 3),
	(2, 'Cocaine Traitée', 6),
	(3, 'Diamant Brut', 3),
	(4, 'Diamant Poli', 6),
	(5, 'Raisin', 20),
	(6, 'Bouteille de vin', 40);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.jobs : ~5 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
	(1, 'Chomeur', 500),
	(3, 'Pompier', 1200),
	(4, 'Mineur', 700),
	(5, 'Chauffeur de taxi', 1000),
	(6, 'Police', 1000);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. outfits
CREATE TABLE IF NOT EXISTS `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Export de données de la table gta5_gamemode_essential.outfits : 5 rows
/*!40000 ALTER TABLE `outfits` DISABLE KEYS */;
INSERT INTO `outfits` (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`) VALUES
	('steam:110000107075ae6', 'mp_m_freemode_01', 0, 0, 3, 2, 4, 2, 7, 3, 3, 1, 0, 4),
	('steam:110000107075ae6', 'mp_m_freemode_01', 0, 0, 3, 2, 4, 2, 7, 3, 3, 1, 0, 4),
	('steam:110000114e42c7f', 'mp_m_freemode_01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	('steam:110000107075ae6', 'mp_m_freemode_01', 0, 0, 3, 2, 4, 2, 7, 3, 3, 1, 0, 4),
	('steam:1100001050d9bde', 'mp_m_freemode_01', 5, 0, 0, 0, 4, 5, 0, 0, 5, 5, 5, 5);
/*!40000 ALTER TABLE `outfits` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. recolt
CREATE TABLE IF NOT EXISTS `recolt` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `raw_id` int(11) unsigned DEFAULT NULL,
  `treated_id` int(11) unsigned DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `treatment_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `raw_id` (`raw_id`),
  KEY `treated_id` (`treated_id`),
  KEY `job_id` (`job_id`),
  KEY `field_id` (`field_id`),
  KEY `treatment_id` (`treatment_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
  CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
  CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
  CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
  CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.recolt : ~3 rows (environ)
/*!40000 ALTER TABLE `recolt` DISABLE KEYS */;
INSERT INTO `recolt` (`ID`, `raw_id`, `treated_id`, `job_id`, `price`, `field_id`, `treatment_id`, `seller_id`) VALUES
	(1, 3, 4, 1, 50, 4, 5, 6),
	(2, 1, 2, 4, 50, 1, 2, 3),
	(3, 5, 6, 6, 50, 7, 8, 9);
/*!40000 ALTER TABLE `recolt` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `job` int(11) DEFAULT '1',
  `isFirstConnection` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.users : ~8 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `group`, `permission_level`, `money`, `bankbalance`, `job`, `isFirstConnection`) VALUES
	('steam:110000107075ae6', 'owner', 4, 703785, 858969, 6, 0),
	('steam:1100001050d9bde', 'owner', 4, 983579, 330000, 6, 0),
	('steam:110000105bbf1f6', 'owner', 4, 5862, 0, 1, 1),
	('steam:110000101579514', 'owner', 4, 4281, 0, 1, 1),
	('steam:11000010c7e1b45', 'user', 0, 500, 0, 1, 1),
	('steam:1100001187ac4aa', 'user', 0, 500, 0, 1, 1),
	('steam:110000100e4081f', 'user', 0, 500, 0, 1, 1),
	('steam:110000114e42c7f', 'user', 0, 500, 0, 1, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.user_inventory : ~6 rows (environ)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
	('steam:1100001050d9bde', 3, 0),
	('steam:1100001050d9bde', 5, 0),
	('steam:110000107075ae6', 3, 0),
	('steam:110000107075ae6', 4, 0),
	('steam:110000107075ae6', 5, 0),
	('steam:110000107075ae6', 6, 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. user_licence
CREATE TABLE IF NOT EXISTS `user_licence` (
  `licence_name` varchar(255) DEFAULT NULL,
  `licence_owned` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.user_licence : ~1 rows (environ)
/*!40000 ALTER TABLE `user_licence` DISABLE KEYS */;
INSERT INTO `user_licence` (`licence_name`, `licence_owned`, `identifier`) VALUES
	('Prostitué', '1', 'steam:110000107075ae6');
/*!40000 ALTER TABLE `user_licence` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. user_vehicle
CREATE TABLE IF NOT EXISTS `user_vehicle` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) NOT NULL,
  `vehicle_wheelcolor` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.user_vehicle : ~5 rows (environ)
/*!40000 ALTER TABLE `user_vehicle` DISABLE KEYS */;
INSERT INTO `user_vehicle` (`ID`, `identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES
	(61, 'steam:110000107075ae6', 'Blista', 'blista', 15000, '23TOH955', 'Rentré', '7', '0', '5', '156'),
	(63, 'steam:110000107075ae6', 'Blade', 'blade', 160000, '46RHL572', 'Rentré', '93', '95', '0', '156'),
	(64, 'steam:110000107075ae6', 'Brioso R/A', 'brioso', 155000, '26EVX491', 'Rentré', '111', '111', '111', '29'),
	(65, 'steam:110000107075ae6', 'Issi', 'issi2', 18000, '42PVD656', 'Rentré', '34', '0', '28', '156'),
	(68, 'steam:110000107075ae6', 'ETR1', 'sheava', 199500, '41NQM833', 'Rentré', '111', '111', '111', '111');
/*!40000 ALTER TABLE `user_vehicle` ENABLE KEYS */;

-- Export de la structure de la table gta5_gamemode_essential. user_weapons
CREATE TABLE IF NOT EXISTS `user_weapons` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Export de données de la table gta5_gamemode_essential.user_weapons : ~17 rows (environ)
/*!40000 ALTER TABLE `user_weapons` DISABLE KEYS */;
INSERT INTO `user_weapons` (`ID`, `identifier`, `weapon_model`, `withdraw_cost`) VALUES
	(20, 'steam:1100001050d9bde', 'WEAPON_CombatPistol', 10),
	(21, 'steam:110000101579514', 'WEAPON_Pistol', 5),
	(23, 'steam:1100001050d9bde', 'WEAPON_CombatPistol', 10),
	(24, 'steam:1100001050d9bde', 'WEAPON_Pistol', 5),
	(25, 'steam:1100001050d9bde', 'WEAPON_PISTOL50', 30),
	(26, 'steam:1100001050d9bde', 'WEAPON_PISTOL50', 30),
	(27, 'steam:1100001050d9bde', 'WEAPON_Revolver', 19),
	(28, 'steam:110000101579514', 'WEAPON_AssaultSMG', 180),
	(29, 'steam:110000101579514', 'WEAPON_Grenade', 15),
	(30, 'steam:110000101579514', 'WEAPON_BZGas', 18),
	(31, 'steam:110000101579514', 'WEAPON_Pistol', 5),
	(32, 'steam:110000101579514', 'WEAPON_HeavyPistol', 80),
	(33, 'steam:110000105bbf1f6', 'WEAPON_StunGun', 28),
	(34, 'steam:110000105bbf1f6', 'WEAPON_StunGun', 28),
	(35, 'steam:110000105bbf1f6', 'WEAPON_Revolver', 19),
	(36, 'steam:110000105bbf1f6', 'WEAPON_Revolver', 19),
	(37, 'steam:110000105bbf1f6', 'WEAPON_MicroSMG', 150);
/*!40000 ALTER TABLE `user_weapons` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
