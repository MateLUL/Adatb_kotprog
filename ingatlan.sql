-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2023 at 03:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
CREATE DATABASE IF NOT EXISTS `ingatlan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ingatlan`;

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (kulcs)',
  `jelszo` varchar(255) NOT NULL COMMENT 'Hashelt jelszó',
  `utolso_belepes_idopontja` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Utolsó belépés időpontja (automatikus update',
  `be_van-e_jelentkezve` tinyint(1) NOT NULL COMMENT 'Ha 1: be van jelentkezve, ha 0: nincs bejelentkezve',
  `szerepkor` int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Ha az érték 1: hivatali dolgozó, ha 2: tulajdonos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók bejelentkezési és authorizációs adatai';

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_adoszam`
--

CREATE TABLE `felhasznalo_adoszam` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `adoszam` varchar(255) NOT NULL COMMENT 'Felhasználó adószáma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók adószáma';

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_anyja_neve`
--

CREATE TABLE `felhasznalo_anyja_neve` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `vezeteknev` varchar(255) NOT NULL COMMENT 'Felhasználó anyjának vezetékneve',
  `keresztnev` varchar(255) NOT NULL COMMENT 'Felhasználó anyjának keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók anyjának teljes neve';

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_infok`
--

CREATE TABLE `felhasznalo_infok` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (foreign key)',
  `telefonszam` varchar(255) NOT NULL COMMENT 'Telefonszám',
  `szuletesi_datum` date NOT NULL COMMENT 'Felhasználó születési dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók privát adatai';

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_lakcim`
--

CREATE TABLE `felhasznalo_lakcim` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `iranyitoszam` int(11) NOT NULL COMMENT 'Település irányítószám (foreign key)',
  `utca` varchar(255) NOT NULL COMMENT 'Utca neve',
  `hazszam` int(11) NOT NULL COMMENT 'Házszám'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók lakcíme';

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_neve`
--

CREATE TABLE `felhasznalo_neve` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (foreign key)',
  `vezeteknev` varchar(255) NOT NULL COMMENT 'Felhasználó vezetékneve',
  `keresztnev` varchar(255) NOT NULL COMMENT 'Felhasználó keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók teljes neve';

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan`
--

CREATE TABLE `ingatlan` (
  `ingatlan_azonosito` varchar(255) NOT NULL COMMENT 'Ingatlan azonosítója (kulcs)',
  `jelleg` varchar(255) NOT NULL COMMENT 'Ingatlan jellege',
  `epites_eve` year(4) NOT NULL COMMENT 'Építés éve',
  `becsult_ertek` int(11) NOT NULL COMMENT 'Becsült értéke',
  `helyrajzi_szam` varchar(255) NOT NULL COMMENT 'Telek helyrajzi száma, ahol az ingatlan található'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok információi';

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan_cim`
--

CREATE TABLE `ingatlan_cim` (
  `ingatlan_azonosito` varchar(255) NOT NULL COMMENT 'Ingatlan azonosítója (kulcs)',
  `iranyitoszam` int(11) NOT NULL COMMENT 'Település irányítószáma (foreign key)',
  `kozterulet` varchar(255) NOT NULL COMMENT 'Közterület',
  `hazszam` int(11) NOT NULL COMMENT 'Házszám'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok címe';

-- --------------------------------------------------------

--
-- Table structure for table `iranyitoszam_telepules`
--

CREATE TABLE `iranyitoszam_telepules` (
  `iranyitoszam` int(11) NOT NULL COMMENT 'Település irányítószáma',
  `telepules` varchar(255) NOT NULL COMMENT 'Település neve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Települések irányítószáma és neve';

-- --------------------------------------------------------

--
-- Table structure for table `telek`
--

CREATE TABLE `telek` (
  `helyrajzi_szam` varchar(255) NOT NULL COMMENT 'Telek helyrajzi száma (kulcs)',
  `meret` int(11) NOT NULL COMMENT 'Telek mérete',
  `jelleg` varchar(255) NOT NULL COMMENT 'Telek jellege',
  `becsult_ertek` int(11) NOT NULL COMMENT 'Telek becsült értéke'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Telkek információi';

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_ingatlan_birtoklas`
--

CREATE TABLE `tulajdonos_ingatlan_birtoklas` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `ingatlan_azonosito` varchar(255) NOT NULL COMMENT 'Ingatlan azonosító (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int(11) NOT NULL COMMENT 'Tulajdonhányad százalékban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és ingatlanok kapcsolata';

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_telek_birtoklas`
--

CREATE TABLE `tulajdonos_telek_birtoklas` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `helyrajzi_szam` varchar(255) NOT NULL COMMENT 'Telek helyrajzi száma (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int(11) NOT NULL COMMENT 'Tulajdonhányad százalékban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és telkek kapcsolata';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`azonosito`);

--
-- Indexes for table `felhasznalo_adoszam`
--
ALTER TABLE `felhasznalo_adoszam`
  ADD PRIMARY KEY (`azonosito`);

--
-- Indexes for table `felhasznalo_anyja_neve`
--
ALTER TABLE `felhasznalo_anyja_neve`
  ADD PRIMARY KEY (`azonosito`);

--
-- Indexes for table `felhasznalo_infok`
--
ALTER TABLE `felhasznalo_infok`
  ADD PRIMARY KEY (`azonosito`);

--
-- Indexes for table `felhasznalo_lakcim`
--
ALTER TABLE `felhasznalo_lakcim`
  ADD PRIMARY KEY (`azonosito`,`iranyitoszam`),
  ADD KEY `iranyitoszam` (`iranyitoszam`);

--
-- Indexes for table `felhasznalo_neve`
--
ALTER TABLE `felhasznalo_neve`
  ADD PRIMARY KEY (`azonosito`);

--
-- Indexes for table `ingatlan`
--
ALTER TABLE `ingatlan`
  ADD PRIMARY KEY (`ingatlan_azonosito`,`helyrajzi_szam`),
  ADD KEY `helyrajzi_szam` (`helyrajzi_szam`);

--
-- Indexes for table `ingatlan_cim`
--
ALTER TABLE `ingatlan_cim`
  ADD PRIMARY KEY (`iranyitoszam`,`ingatlan_azonosito`);

--
-- Indexes for table `iranyitoszam_telepules`
--
ALTER TABLE `iranyitoszam_telepules`
  ADD PRIMARY KEY (`iranyitoszam`);

--
-- Indexes for table `telek`
--
ALTER TABLE `telek`
  ADD PRIMARY KEY (`helyrajzi_szam`);

--
-- Indexes for table `tulajdonos_ingatlan_birtoklas`
--
ALTER TABLE `tulajdonos_ingatlan_birtoklas`
  ADD PRIMARY KEY (`azonosito`,`ingatlan_azonosito`),
  ADD KEY `ingatlan_azonosito` (`ingatlan_azonosito`);

--
-- Indexes for table `tulajdonos_telek_birtoklas`
--
ALTER TABLE `tulajdonos_telek_birtoklas`
  ADD PRIMARY KEY (`azonosito`,`helyrajzi_szam`),
  ADD KEY `helyrajzi_szam` (`helyrajzi_szam`);

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
