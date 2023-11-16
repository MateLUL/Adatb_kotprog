-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 16, 2023 at 04:06 PM
-- Server version: 8.1.0
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ingatlan`
--
CREATE DATABASE IF NOT EXISTS `ingatlan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ingatlan`;

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosítója (kulcs)',
  `jelszo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Hashelt jelszó',
  `utolso_belepes_idopontja` timestamp NULL DEFAULT NULL COMMENT 'Utolsó belépés időpontja (automatikus update',
  `be_van-e_jelentkezve` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ha 1: be van jelentkezve, ha 0: nincs bejelentkezve',
  `szerepkor` int UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Ha az érték 1: hivatali dolgozó, ha 2: tulajdonos',
  PRIMARY KEY (`azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók bejelentkezési és authorizációs adatai';

--
-- Dumping data for table `felhasznalo`
--

INSERT INTO `felhasznalo` (`azonosito`, `jelszo`, `utolso_belepes_idopontja`, `be_van-e_jelentkezve`, `szerepkor`) VALUES
('aaaaaa', '$2y$10$6nUqpyj/44cWJXtuD8jEg.R1ID5gKaf4XCRmdFoRQIF.IAN00FVSy', NULL, 0, 2),
('asd111', '$2y$10$Tdp0xIDaEBaYTUpWhSce3uwknCnyNquiuP7NontDYyT1KiwliXMzy', NULL, 0, 2),
('asd11111', '$2y$10$9d.lnlw7y5WlWS5g9HZYwuXldKSujO3MeX8X7F31wSOTFjM.0SoDi', NULL, 0, 2),
('jelszo1', '$2y$10$fQknfIK7ohBaFhQEe.fRWuGR97s1f18JAKNEpdi6pngYkyTbJXRrW', NULL, 0, 2),
('jkljkl', '$2y$10$NZi0/9QgoS3RK80JjchmG.iEyEL6NK0kWa9KV7Xdgtgqfjk.8YibG', NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_adoszam`
--

CREATE TABLE IF NOT EXISTS `felhasznalo_adoszam` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `adoszam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó adószáma',
  PRIMARY KEY (`azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók adószáma';

--
-- Dumping data for table `felhasznalo_adoszam`
--

INSERT INTO `felhasznalo_adoszam` (`azonosito`, `adoszam`) VALUES
('aaaaaa', '112312ASD2'),
('asd111', '112312ASD2'),
('asd11111', '112312ASD2'),
('jelszo1', 'jkqhwdjh'),
('jkljkl', '112312ASD2');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_anyja_neve`
--

CREATE TABLE IF NOT EXISTS `felhasznalo_anyja_neve` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `vezeteknev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó anyjának vezetékneve',
  `keresztnev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó anyjának keresztneve',
  PRIMARY KEY (`azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók anyjának teljes neve';

--
-- Dumping data for table `felhasznalo_anyja_neve`
--

INSERT INTO `felhasznalo_anyja_neve` (`azonosito`, `vezeteknev`, `keresztnev`) VALUES
('aaaaaa', 'BBBB', 'AAAA'),
('asd111', 'BBBB', 'AAAA'),
('asd11111', 'BBBB', 'AAAA'),
('jelszo1', 'BBBB', 'AAAA'),
('jkljkl', 'BBBB', 'AAAA');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_infok`
--

CREATE TABLE IF NOT EXISTS `felhasznalo_infok` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosítója (foreign kulcs a felhasznalo táblából)',
  `telefonszam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telefonszám',
  `szuletesi_datum` date NOT NULL COMMENT 'Felhasználó születési dátuma',
  PRIMARY KEY (`azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók privát adatai';

--
-- Dumping data for table `felhasznalo_infok`
--

INSERT INTO `felhasznalo_infok` (`azonosito`, `telefonszam`, `szuletesi_datum`) VALUES
('aaaaaa', '+36307777777', '2023-11-01'),
('asd111', '+36307777777', '2000-01-05'),
('asd11111', '+36307777777', '2000-01-05'),
('jelszo1', '+36307777777', '2023-11-18'),
('jkljkl', '+36307777777', '2023-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_lakcim`
--

CREATE TABLE IF NOT EXISTS `felhasznalo_lakcim` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószám (foreign key)',
  `utca` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Utca neve',
  `hazszam` int NOT NULL COMMENT 'Házszám',
  PRIMARY KEY (`azonosito`,`iranyitoszam`),
  KEY `iranyitoszam` (`iranyitoszam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók lakcíme';

--
-- Dumping data for table `felhasznalo_lakcim`
--

INSERT INTO `felhasznalo_lakcim` (`azonosito`, `iranyitoszam`, `utca`, `hazszam`) VALUES
('aaaaaa', 6000, 'asd utca', 1),
('asd111', 6000, 'asd utca', 1),
('asd11111', 6000, 'asd utca', 1),
('jelszo1', 6000, 'asd utca', 1),
('jkljkl', 6000, 'asd utca', 1);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_neve`
--

CREATE TABLE IF NOT EXISTS `felhasznalo_neve` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosítója (foreign key)',
  `vezeteknev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó vezetékneve',
  `keresztnev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó keresztneve',
  PRIMARY KEY (`azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók teljes neve';

--
-- Dumping data for table `felhasznalo_neve`
--

INSERT INTO `felhasznalo_neve` (`azonosito`, `vezeteknev`, `keresztnev`) VALUES
('aaaaaa', 'dsadsa', 'asda'),
('asd111', 'DSA', 'ASD'),
('asd11111', 'DSA', 'ASD'),
('jelszo1', 'awhjdkjaw', 'asdawd'),
('jkljkl', 'DSA', 'ASD');

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan`
--

CREATE TABLE IF NOT EXISTS `ingatlan` (
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosítója',
  `jelleg` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan jellege',
  `epites_eve` year NOT NULL COMMENT 'Építés éve',
  `becsult_ertek` int NOT NULL COMMENT 'Becsült értéke',
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma, ahol az ingatlan található',
  PRIMARY KEY (`ingatlan_azonosito`,`helyrajzi_szam`),
  KEY `helyrajzi_szam` (`helyrajzi_szam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok információi';

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan_cim`
--

CREATE TABLE IF NOT EXISTS `ingatlan_cim` (
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosítója (kulcs)',
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószáma (foreign key)',
  `kozterulet` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Közterület',
  `hazszam` int NOT NULL COMMENT 'Házszám',
  PRIMARY KEY (`iranyitoszam`,`ingatlan_azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok címe';

-- --------------------------------------------------------

--
-- Table structure for table `iranyitoszam_telepules`
--

CREATE TABLE IF NOT EXISTS `iranyitoszam_telepules` (
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószáma',
  `telepules` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Település neve',
  PRIMARY KEY (`iranyitoszam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Települések irányítószáma és neve';

--
-- Dumping data for table `iranyitoszam_telepules`
--

INSERT INTO `iranyitoszam_telepules` (`iranyitoszam`, `telepules`) VALUES
(1011, 'Budapest'),
(2030, 'Érd'),
(2100, 'Gödöllő'),
(2120, 'Dunakeszi'),
(2310, 'Szigetszentmiklós'),
(2360, 'Gyál'),
(2400, 'Dunaujváros'),
(2500, 'Esztergom'),
(2600, 'Vác'),
(2700, 'Cegléd'),
(2800, 'Tatabánya'),
(2890, 'Tata'),
(3000, 'Hatvan'),
(3100, 'Salgótarján'),
(3200, 'Gyöngyös'),
(3300, 'Eger'),
(3529, 'Miskolc'),
(4024, 'Debrecen'),
(4200, 'Hajdúszoboszló'),
(4220, 'Hajdúböszörmény'),
(4400, 'Nyíregyháza'),
(5000, 'Szolnok'),
(5500, 'Gyomaendrőd'),
(5600, 'Békéscsaba'),
(5900, 'Orosháza'),
(6000, 'Kecskemét'),
(6100, 'Kiskunfélegyháza'),
(6120, 'Kiskunmajsa'),
(6500, 'Baja'),
(6600, 'Szentes'),
(6720, 'Szeged'),
(6800, 'Hódmezővásárhely'),
(7100, 'Szekszárd'),
(7400, 'Kaposvár'),
(7621, 'Pécs'),
(8000, 'Székesfehérvár'),
(8100, 'Várpalota'),
(8200, 'Veszprém'),
(8330, 'Sümeg'),
(8360, 'Keszthely'),
(8400, 'Ajka'),
(8500, 'Pápa'),
(8600, 'Siófok'),
(8800, 'Nagykanizsa'),
(8900, 'Zalaegerszeg'),
(9021, 'Győr'),
(9200, 'Mosonmagyaróvár'),
(9400, 'Sopron'),
(9600, 'Sárvár'),
(9700, 'Szombathely');

-- --------------------------------------------------------

--
-- Table structure for table `telek`
--

CREATE TABLE IF NOT EXISTS `telek` (
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma (kulcs)',
  `meret` int NOT NULL COMMENT 'Telek mérete',
  `jelleg` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek jellege',
  `becsult_ertek` int NOT NULL COMMENT 'Telek becsült értéke',
  PRIMARY KEY (`helyrajzi_szam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Telkek információi';

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_ingatlan_birtoklas`
--

CREATE TABLE IF NOT EXISTS `tulajdonos_ingatlan_birtoklas` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosító (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int NOT NULL COMMENT 'Tulajdonhányad százalékban',
  PRIMARY KEY (`azonosito`,`ingatlan_azonosito`),
  KEY `ingatlan_azonosito` (`ingatlan_azonosito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és ingatlanok kapcsolata';

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_telek_birtoklas`
--

CREATE TABLE IF NOT EXISTS `tulajdonos_telek_birtoklas` (
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosító (kulcs)',
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int NOT NULL COMMENT 'Tulajdonhányad százalékban',
  PRIMARY KEY (`azonosito`,`helyrajzi_szam`),
  KEY `helyrajzi_szam` (`helyrajzi_szam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és telkek kapcsolata';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felhasznalo_adoszam`
--
ALTER TABLE `felhasznalo_adoszam`
  ADD CONSTRAINT `felhasznalo_adoszam_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`);

--
-- Constraints for table `felhasznalo_anyja_neve`
--
ALTER TABLE `felhasznalo_anyja_neve`
  ADD CONSTRAINT `felhasznalo_anyja_neve_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`);

--
-- Constraints for table `felhasznalo_infok`
--
ALTER TABLE `felhasznalo_infok`
  ADD CONSTRAINT `felhasznalo_infok_fk` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`);

--
-- Constraints for table `felhasznalo_lakcim`
--
ALTER TABLE `felhasznalo_lakcim`
  ADD CONSTRAINT `felhasznalo_lakcim_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`),
  ADD CONSTRAINT `felhasznalo_lakcim_ibfk_2` FOREIGN KEY (`iranyitoszam`) REFERENCES `iranyitoszam_telepules` (`iranyitoszam`);

--
-- Constraints for table `felhasznalo_neve`
--
ALTER TABLE `felhasznalo_neve`
  ADD CONSTRAINT `felhasznalo_neve_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`);

--
-- Constraints for table `ingatlan`
--
ALTER TABLE `ingatlan`
  ADD CONSTRAINT `ingatlan_ibfk_1` FOREIGN KEY (`helyrajzi_szam`) REFERENCES `telek` (`helyrajzi_szam`);

--
-- Constraints for table `ingatlan_cim`
--
ALTER TABLE `ingatlan_cim`
  ADD CONSTRAINT `ingatlan_cim_ibfk_1` FOREIGN KEY (`iranyitoszam`) REFERENCES `iranyitoszam_telepules` (`iranyitoszam`);

--
-- Constraints for table `tulajdonos_ingatlan_birtoklas`
--
ALTER TABLE `tulajdonos_ingatlan_birtoklas`
  ADD CONSTRAINT `tulajdonos_ingatlan_birtoklas_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`),
  ADD CONSTRAINT `tulajdonos_ingatlan_birtoklas_ibfk_2` FOREIGN KEY (`ingatlan_azonosito`) REFERENCES `ingatlan` (`ingatlan_azonosito`);

--
-- Constraints for table `tulajdonos_telek_birtoklas`
--
ALTER TABLE `tulajdonos_telek_birtoklas`
  ADD CONSTRAINT `tulajdonos_telek_birtoklas_ibfk_1` FOREIGN KEY (`azonosito`) REFERENCES `felhasznalo` (`azonosito`),
  ADD CONSTRAINT `tulajdonos_telek_birtoklas_ibfk_2` FOREIGN KEY (`helyrajzi_szam`) REFERENCES `telek` (`helyrajzi_szam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;