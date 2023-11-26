-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 26, 2023 at 03:44 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `id` int NOT NULL,
  `azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó azonosítója (kulcs)',
  `jelszo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Hashelt jelszó',
  `utolso_belepes_idopontja` timestamp NULL DEFAULT NULL COMMENT 'Utolsó belépés időpontja (automatikus update',
  `be_van-e_jelentkezve` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ha 1: be van jelentkezve, ha 0: nincs bejelentkezve',
  `szerepkor` int UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Ha az érték 1: hivatali dolgozó, ha 2: tulajdonos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók bejelentkezési és authorizációs adatai';

--
-- Dumping data for table `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `azonosito`, `jelszo`, `utolso_belepes_idopontja`, `be_van-e_jelentkezve`, `szerepkor`) VALUES
(1, 'aaaaaa', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(2, 'asd111', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(3, 'asd11111', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(4, 'dolgozo', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', '2023-11-26 15:34:17', 1, 1),
(6, 'jkljkl', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(7, 'user1', '$2y$10$yh0hUP0zOag2l0RGCE/W8OgKt2Ju0AbVTLIcpS6j8UfFRFlPRcSl.', '2023-11-26 15:23:38', 0, 2),
(8, 'user10', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(9, 'user11', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(10, 'user12', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(11, 'user13', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(12, 'user14', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(13, 'user15', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(14, 'user16', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(15, 'user17', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(16, 'user18', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(17, 'user19', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(18, 'user2', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(19, 'user20', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(20, 'user21', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(21, 'user22', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(22, 'user23', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(23, 'user24', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(24, 'user25', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(25, 'user26', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(26, 'user27', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(27, 'user28', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(28, 'user29', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(29, 'user3', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(30, 'user30', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(31, 'user31', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(32, 'user32', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(33, 'user33', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(34, 'user34', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(35, 'user35', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(36, 'user36', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(37, 'user37', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(38, 'user38', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(39, 'user39', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(40, 'user4', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(41, 'user40', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(42, 'user41', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(43, 'user42', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(44, 'user43', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(45, 'user44', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(46, 'user45', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(47, 'user46', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(48, 'user47', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(49, 'user48', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(50, 'user49', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(51, 'user5', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(52, 'user50', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(53, 'user6', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(54, 'user7', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(55, 'user8', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2),
(56, 'user9', '$2y$10$HD8ULbmF.dCXi30TOwiwJeamckMnAYDgGXV3BeGjyuX35HQoaNaya', NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_adoszam`
--

CREATE TABLE `felhasznalo_adoszam` (
  `id` int NOT NULL,
  `adoszam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó adószáma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók adószáma';

--
-- Dumping data for table `felhasznalo_adoszam`
--

INSERT INTO `felhasznalo_adoszam` (`id`, `adoszam`) VALUES
(1, '112312ASD2'),
(2, '112312ASD3'),
(3, '112312ASD4'),
(4, '112312ASD2'),
(6, '112312ASD5'),
(7, '12345678901'),
(8, '10234567890'),
(9, '21098765432'),
(10, '32109876543'),
(11, '43210987654'),
(12, '54321098765'),
(13, '65432109876'),
(14, '76543210987'),
(15, '87654321098'),
(16, '98765432109'),
(17, '10987654320'),
(18, '23456789012'),
(19, '98765432101'),
(20, '87654321021'),
(21, '76543210932'),
(22, '65432109843'),
(23, '54321098754'),
(24, '43210987665'),
(25, '32109876576'),
(26, '21098765487'),
(27, '10987654398'),
(28, '21098765409'),
(29, '34567890123'),
(30, '10987654310'),
(31, '21098765421'),
(32, '10987654332'),
(33, '21098765443'),
(34, '10987654354'),
(35, '21098765465'),
(36, '10987654376'),
(37, '21098765487'),
(38, '10987654398'),
(39, '21098765409'),
(40, '45678901234'),
(41, '10987654310'),
(42, '21098765421'),
(43, '10987654332'),
(44, '21098765443'),
(45, '10987654354'),
(46, '21098765465'),
(47, '10987654376'),
(48, '21098765487'),
(49, '10987654398'),
(50, '21098765409'),
(51, '56789012345'),
(52, '10987654310'),
(53, '67890123456'),
(54, '78901234567'),
(55, '89012345678'),
(56, '90123456789');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_anyja_neve`
--

CREATE TABLE `felhasznalo_anyja_neve` (
  `id` int NOT NULL,
  `vezeteknev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó anyjának vezetékneve',
  `keresztnev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó anyjának keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók anyjának teljes neve';

--
-- Dumping data for table `felhasznalo_anyja_neve`
--

INSERT INTO `felhasznalo_anyja_neve` (`id`, `vezeteknev`, `keresztnev`) VALUES
(1, 'BBBB', 'AAAA'),
(2, 'BBBB', 'AAAA'),
(3, 'BBBB', 'AAAA'),
(4, 'BBBB', 'AAAA'),
(6, 'BBBB', 'AAAA'),
(7, 'Johnson', 'Emma'),
(8, 'Hernandez', 'Grace'),
(9, 'Lopez', 'Lily'),
(10, 'Gonzalez', 'Chloe'),
(11, 'Wilson', 'Scarlett'),
(12, 'Anderson', 'Aria'),
(13, 'Thomas', 'Nora'),
(14, 'Taylor', 'Layla'),
(15, 'Moore', 'Hazel'),
(16, 'Clark', 'Penelope'),
(17, 'Lewis', 'Eleanor'),
(18, 'Williams', 'Olivia'),
(19, 'Young', 'Aurora'),
(20, 'Johnson', 'Emma'),
(21, 'Williams', 'Olivia'),
(22, 'Jones', 'Ava'),
(23, 'Brown', 'Sophia'),
(24, 'Miller', 'Isabella'),
(25, 'Davis', 'Mia'),
(26, 'Garcia', 'Charlotte'),
(27, 'Rodriguez', 'Abigail'),
(28, 'Martinez', 'Ella'),
(29, 'Jones', 'Ava'),
(30, 'Hernandez', 'Grace'),
(31, 'Lopez', 'Lily'),
(32, 'Gonzalez', 'Chloe'),
(33, 'Wilson', 'Scarlett'),
(34, 'Anderson', 'Aria'),
(35, 'Thomas', 'Nora'),
(36, 'Taylor', 'Layla'),
(37, 'Moore', 'Hazel'),
(38, 'Clark', 'Penelope'),
(39, 'Lewis', 'Eleanor'),
(40, 'Brown', 'Sophia'),
(41, 'Young', 'Aurora'),
(42, 'Scott', 'Violet'),
(43, 'Hall', 'Zoe'),
(44, 'Turner', 'Stella'),
(45, 'Adams', 'Lillian'),
(46, 'Ward', 'Claire'),
(47, 'Cook', 'Lucy'),
(48, 'Bell', 'Anna'),
(49, 'Cooper', 'Sofia'),
(50, 'Diaz', 'Grace'),
(51, 'Miller', 'Isabella'),
(52, 'Reyes', 'Aubrey'),
(53, 'Davis', 'Mia'),
(54, 'Garcia', 'Charlotte'),
(55, 'Rodriguez', 'Abigail'),
(56, 'Martinez', 'Ella');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_infok`
--

CREATE TABLE `felhasznalo_infok` (
  `id` int NOT NULL,
  `telefonszam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telefonszám',
  `szuletesi_datum` date NOT NULL COMMENT 'Felhasználó születési dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók privát adatai';

--
-- Dumping data for table `felhasznalo_infok`
--

INSERT INTO `felhasznalo_infok` (`id`, `telefonszam`, `szuletesi_datum`) VALUES
(1, '+36307777777', '2023-11-01'),
(2, '+36307777777', '2000-01-05'),
(3, '+36307777777', '2000-01-05'),
(4, '+36307777777', '2023-11-01'),
(6, '+36307777777', '2023-11-02'),
(7, '+1234567890', '1990-05-15'),
(8, '+1023456789', '1996-07-31'),
(9, '+2109876543', '1989-10-26'),
(10, '+3210987654', '1991-01-12'),
(11, '+4321098765', '1997-04-19'),
(12, '+5432109876', '1986-08-07'),
(13, '+6543210987', '1994-11-23'),
(14, '+7654321098', '1983-01-30'),
(15, '+8765432109', '1999-05-07'),
(16, '+9876543210', '1982-09-13'),
(17, '+1098765432', '1990-12-28'),
(18, '+2345678901', '1985-08-22'),
(19, '+9876543211', '1981-03-05'),
(20, '+8765432102', '1990-06-15'),
(21, '+7654321093', '1985-09-22'),
(22, '+6543210984', '1992-04-10'),
(23, '+5432109875', '1988-12-28'),
(24, '+4321098766', '1995-07-03'),
(25, '+3210987657', '1998-10-17'),
(26, '+2109876548', '1987-05-05'),
(27, '+1098765439', '1993-01-20'),
(28, '+2109876540', '1984-03-14'),
(29, '+3456789012', '1992-03-10'),
(30, '+1098765431', '1996-08-31'),
(31, '+2109876542', '1989-11-26'),
(32, '+1098765433', '1991-02-12'),
(33, '+2109876544', '1997-05-19'),
(34, '+1098765435', '1986-09-07'),
(35, '+2109876546', '1994-12-23'),
(36, '+1098765437', '1983-02-01'),
(37, '+2109876548', '1999-06-07'),
(38, '+1098765439', '1982-10-13'),
(39, '+2109876540', '1990-01-28'),
(40, '+4567890123', '1988-11-28'),
(41, '+1098765431', '1981-04-05'),
(42, '+2109876542', '1989-07-31'),
(43, '+1098765433', '1991-10-26'),
(44, '+2109876544', '1997-01-12'),
(45, '+1098765435', '1986-04-19'),
(46, '+2109876546', '1994-08-07'),
(47, '+1098765437', '1983-11-23'),
(48, '+2109876548', '1999-01-30'),
(49, '+1098765439', '1982-05-07'),
(50, '+2109876540', '1990-09-13'),
(51, '+5678901234', '1995-06-03'),
(52, '+1098765431', '1981-12-28'),
(53, '+6789012345', '1998-09-17'),
(54, '+7890123456', '1987-04-05'),
(55, '+8901234567', '1993-12-20'),
(56, '+9012345678', '1984-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_lakcim`
--

CREATE TABLE `felhasznalo_lakcim` (
  `id` int NOT NULL,
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószám (foreign key)',
  `utca` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Utca neve',
  `hazszam` int NOT NULL COMMENT 'Házszám'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók lakcíme';

--
-- Dumping data for table `felhasznalo_lakcim`
--

INSERT INTO `felhasznalo_lakcim` (`id`, `iranyitoszam`, `utca`, `hazszam`) VALUES
(1, 6000, 'asd utca', 1),
(2, 6000, 'asd utca', 1),
(3, 6000, 'asd utca', 1),
(4, 6000, 'asd utca', 10),
(6, 6000, 'asd utca', 1),
(7, 1011, 'Fő', 1),
(8, 9700, 'Szabadság tér', 11),
(9, 5000, 'Ady Endre utca', 2),
(10, 2030, 'Bartók Béla út', 6),
(11, 2800, 'Hunyadi tér', 14),
(12, 9400, 'Fő tér', 3),
(13, 7400, 'Kossuth utca', 17),
(14, 8200, 'Széchenyi tér', 8),
(15, 5600, 'Kisfaludy utca', 5),
(16, 8900, 'Arany János utca', 12),
(17, 3300, 'Szent István tér', 6),
(18, 4024, 'Kossuth utca', 5),
(19, 8800, 'Fő tér', 7),
(20, 2120, 'György utca', 10),
(21, 6800, 'Arany János utca', 21),
(22, 7100, 'Szabadság tér', 9),
(23, 7100, 'Petőfi Sándor utca', 15),
(24, 2600, 'Kossuth tér', 4),
(25, 3100, 'Dózsa György út', 6),
(26, 2700, 'Vörösmarty tér', 8),
(27, 5900, 'Bajnai út', 5),
(28, 8400, 'Kossuth Lajos utca', 11),
(29, 6720, 'Rákóczi út', 12),
(30, 6600, 'Petőfi tér', 7),
(31, 2310, 'Szent István tér', 12),
(32, 6800, 'Arany János utca', 14),
(33, 3000, 'Kossuth tér', 8),
(34, 6500, 'Petőfi Sándor utca', 21),
(35, 2400, 'Dózsa György út', 15),
(36, 3200, 'Vörösmarty tér', 9),
(37, 4220, 'Bajnai út', 6),
(38, 9600, 'Kossuth Lajos utca', 3),
(39, 8360, 'Petőfi tér', 11),
(40, 3529, 'Petőfi tér', 7),
(41, 9200, 'Arany János utca', 5),
(42, 2360, 'Kossuth tér', 10),
(43, 6100, 'Petőfi Sándor utca', 8),
(44, 2500, 'Dózsa György út', 4),
(45, 8500, 'Vörösmarty tér', 6),
(46, 4200, 'Bajnai út', 5),
(47, 8100, 'Kossuth Lajos utca', 17),
(48, 2100, 'Petőfi tér', 12),
(49, 5500, 'Arany János utca', 14),
(50, 2890, 'Kossuth tér', 8),
(51, 7621, 'Szent István tér', 3),
(52, 8600, 'Petőfi Sándor utca', 21),
(53, 9021, 'Bajnai út', 9),
(54, 4400, 'Kossuth Lajos utca', 16),
(55, 8000, 'Kossuth tér', 8),
(56, 6000, 'Deák tér', 4);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_neve`
--

CREATE TABLE `felhasznalo_neve` (
  `id` int NOT NULL,
  `vezeteknev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó vezetékneve',
  `keresztnev` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Felhasználó keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók teljes neve';

--
-- Dumping data for table `felhasznalo_neve`
--

INSERT INTO `felhasznalo_neve` (`id`, `vezeteknev`, `keresztnev`) VALUES
(1, 'dsadsa', 'asda'),
(2, 'DSA', 'ASD'),
(3, 'DSA', 'ASD'),
(4, 'dsadsa', 'asdasd'),
(6, 'DSA', 'ASD'),
(7, 'Nagy', 'Gábor'),
(8, 'Kiss', 'Éva'),
(9, 'Németh', 'Fanni'),
(10, 'Király', 'Gergő'),
(11, 'Jakab', 'Lilla'),
(12, 'Sándor', 'Márton'),
(13, 'Gáspár', 'Eszter'),
(14, 'Balogh', 'Levente'),
(15, 'Kocsis', 'Viktória'),
(16, 'Orbán', 'Ádám'),
(17, 'Mészáros', 'Bianka'),
(18, 'Kovács', 'Anna'),
(19, 'Takács', 'Dominik'),
(20, 'Török', 'Réka'),
(21, 'Simon', 'Tamás'),
(22, 'Kovács', 'Boglárka'),
(23, 'Nagy', 'Attila'),
(24, 'Bakos', 'Dóra'),
(25, 'Szekeres', 'Sándor'),
(26, 'Molnár', 'Lili'),
(27, 'Varga', 'Márk'),
(28, 'Kiss', 'Bianka'),
(29, 'Tóth', 'Péter'),
(30, 'Kovács', 'Norbert'),
(31, 'Szabó', 'Jázmin'),
(32, 'Takács', 'Gábor'),
(33, 'Németh', 'Emma'),
(34, 'Király', 'Máté'),
(35, 'Sándor', 'Virág'),
(36, 'Gáspár', 'Dániel'),
(37, 'Balogh', 'Laura'),
(38, 'Kocsis', 'Márton'),
(39, 'Orbán', 'Réka'),
(40, 'Varga', 'Zsuzsanna'),
(41, 'Mészáros', 'Ádám'),
(42, 'Török', 'Noémi'),
(43, 'Simon', 'Gergő'),
(44, 'Kovács', 'Bianka'),
(45, 'Nagy', 'Áron'),
(46, 'Bakos', 'Lilla'),
(47, 'Szekeres', 'Gábor'),
(48, 'Molnár', 'Márk'),
(49, 'Varga', 'Nóra'),
(50, 'Kiss', 'Péter'),
(51, 'Farkas', 'Bence'),
(52, 'Kovács', 'Eszter'),
(53, 'Papp', 'Dóra'),
(54, 'Molnár', 'István'),
(55, 'Horváth', 'Katalin'),
(56, 'Szabó', 'Máté');

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan`
--

CREATE TABLE `ingatlan` (
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosítója',
  `jelleg` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan jellege',
  `epites_eve` year NOT NULL COMMENT 'Építés éve',
  `becsult_ertek` bigint NOT NULL COMMENT 'Becsült értéke',
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma, ahol az ingatlan található'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok információi';

--
-- Dumping data for table `ingatlan`
--

INSERT INTO `ingatlan` (`ingatlan_azonosito`, `jelleg`, `epites_eve`, `becsult_ertek`, `helyrajzi_szam`) VALUES
('112301', 'Lakás', '1980', 10000000, '101/4'),
('112302', 'Lakás', '1980', 15000000, '101/4'),
('112308', 'Lakás', '1980', 20000000, '101/4'),
('112321', 'Lakás', '1980', 20000000, '1010/13'),
('112322', 'Lakás', '1980', 277777000, '1010/13');

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan_cim`
--

CREATE TABLE `ingatlan_cim` (
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosítója (kulcs)',
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószáma (foreign key)',
  `kozterulet` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Közterület',
  `hazszam` int NOT NULL COMMENT 'Házszám'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Ingatlanok címe';

--
-- Dumping data for table `ingatlan_cim`
--

INSERT INTO `ingatlan_cim` (`ingatlan_azonosito`, `iranyitoszam`, `kozterulet`, `hazszam`) VALUES
('112301', 6000, 'Bécsi út', 2),
('112302', 6000, 'Bécsi út', 1),
('112308', 6000, 'Asd utca', 10),
('112321', 6120, 'Bécsi út', 12),
('112322', 6120, 'Bécsi út', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iranyitoszam_telepules`
--

CREATE TABLE `iranyitoszam_telepules` (
  `iranyitoszam` int NOT NULL COMMENT 'Település irányítószáma',
  `telepules` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Település neve'
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

CREATE TABLE `telek` (
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma (kulcs)',
  `meret` int NOT NULL COMMENT 'Telek mérete',
  `jelleg` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek jellege',
  `becsult_ertek` bigint NOT NULL COMMENT 'Telek becsült értéke'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Telkek információi';

--
-- Dumping data for table `telek`
--

INSERT INTO `telek` (`helyrajzi_szam`, `meret`, `jelleg`, `becsult_ertek`) VALUES
('101/4', 1200, 'Mezőgazdasági telek', 1500000),
('1010/13', 1200, 'Beépítetlen telek', 900000),
('1111/14', 1000, 'Üdülőterület', 1100000),
('1212/15', 800, 'Lakótelek', 1600000),
('123/1', 500, 'Lakótelek', 1000000),
('1313/16', 600, 'Kereskedelmi telek', 2300000),
('1414/17', 900, 'Ipari telek', 3100000),
('1515/18', 1100, 'Mezőgazdasági telek', 1700000),
('1616/19', 750, 'Zöldterület', 550000),
('1717/20', 950, 'Beépítetlen telek', 850000),
('1818/21', 850, 'Üdülőterület', 1300000),
('1919/22', 700, 'Lakótelek', 2000000),
('202/5', 800, 'Zöldterület', 500000),
('2020/23', 1200, 'Kereskedelmi telek', 2800000),
('2121/24', 1000, 'Ipari telek', 3500000),
('2222/25', 800, 'Mezőgazdasági telek', 1900000),
('2323/26', 600, 'Zöldterület', 700000),
('2424/27', 900, 'Beépítetlen telek', 1100000),
('2525/28', 1100, 'Üdülőterület', 1600000),
('2626/29', 750, 'Lakótelek', 2400000),
('2727/30', 950, 'Kereskedelmi telek', 3100000),
('2828/31', 850, 'Ipari telek', 3700000),
('2929/32', 700, 'Mezőgazdasági telek', 2000000),
('2981/10', 900, 'Ipari hely', 9000000),
('303/6', 600, 'Beépítetlen telek', 800000),
('3030/33', 1200, 'Zöldterület', 900000),
('3131/34', 1000, 'Beépítetlen telek', 1200000),
('3232/35', 800, 'Üdülőterület', 1800000),
('3333/36', 600, 'Lakótelek', 700000),
('3434/37', 900, 'Kereskedelmi telek', 1100000),
('3535/38', 1100, 'Ipari telek', 1600000),
('3636/39', 750, 'Mezőgazdasági telek', 2300000),
('3737/40', 950, 'Zöldterület', 2900000),
('3838/41', 850, 'Beépítetlen telek', 3400000),
('3939/42', 700, 'Üdülőterület', 1800000),
('404/7', 900, 'Üdülőterület', 1200000),
('4040/43', 1200, 'Lakótelek', 2500000),
('4141/44', 1000, 'Kereskedelmi telek', 3100000),
('4242/45', 800, 'Ipari telek', 3800000),
('4343/46', 600, 'Mezőgazdasági telek', 2000000),
('4444/47', 900, 'Zöldterület', 1300000),
('4545/48', 1100, 'Beépítetlen telek', 1600000),
('456/2', 700, 'Kereskedelmi telek', 2000000),
('4646/49', 750, 'Üdülőterület', 2200000),
('4747/50', 950, 'Lakótelek', 2900000),
('4848/51', 850, 'Kereskedelmi telek', 3400000),
('4949/52', 700, 'Ipari telek', 4100000),
('505/8', 1100, 'Lakótelek', 1800000),
('5050/53', 1200, 'Mezőgazdasági telek', 2300000),
('5151/54', 1000, 'Zöldterület', 1600000),
('5252/55', 800, 'Beépítetlen telek', 2000000),
('5353/56', 600, 'Üdülőterület', 2500000),
('5454/57', 900, 'Lakótelek', 3100000),
('5555/58', 1100, 'Kereskedelmi telek', 3800000),
('5656/59', 750, 'Ipari telek', 4100000),
('5757/60', 950, 'Mezőgazdasági telek', 2900000),
('606/9', 750, 'Kereskedelmi telek', 2500000),
('707/10', 950, 'Ipari telek', 3200000),
('789/3', 1000, 'Ipari telek', 3000000),
('808/11', 850, 'Mezőgazdasági telek', 1400000),
('909/12', 700, 'Zöldterület', 600000);

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_ingatlan_birtoklas`
--

CREATE TABLE `tulajdonos_ingatlan_birtoklas` (
  `tib_id` int NOT NULL,
  `f_id` int NOT NULL,
  `ingatlan_azonosito` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Ingatlan azonosító (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int NOT NULL COMMENT 'Tulajdonhányad százalékban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és ingatlanok kapcsolata';

--
-- Dumping data for table `tulajdonos_ingatlan_birtoklas`
--

INSERT INTO `tulajdonos_ingatlan_birtoklas` (`tib_id`, `f_id`, `ingatlan_azonosito`, `tulajdonba_kerules`, `tulajdonhanyad`) VALUES
(2, 7, '112302', '2023-11-26 13:50:42', 50),
(3, 18, '112301', '2023-11-26 13:50:42', 1),
(4, 18, '112302', '2023-11-26 13:50:42', 50),
(5, 7, '112301', '2023-11-26 14:38:41', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tulajdonos_telek_birtoklas`
--

CREATE TABLE `tulajdonos_telek_birtoklas` (
  `ttb_id` int NOT NULL,
  `f_id` int NOT NULL,
  `helyrajzi_szam` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Telek helyrajzi száma (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int NOT NULL COMMENT 'Tulajdonhányad százalékban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és telkek kapcsolata';

--
-- Dumping data for table `tulajdonos_telek_birtoklas`
--

INSERT INTO `tulajdonos_telek_birtoklas` (`ttb_id`, `f_id`, `helyrajzi_szam`, `tulajdonba_kerules`, `tulajdonhanyad`) VALUES
(1, 7, '101/4', '2023-11-26 14:12:36', 10),
(2, 18, '101/4', '2023-11-26 13:49:59', 100),
(3, 29, '101/4', '2023-11-26 13:49:59', 100),
(5, 7, '1010/13', '2023-11-26 14:39:17', 100),
(6, 51, '1010/13', '2023-11-26 14:50:33', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `azonosito` (`azonosito`);

--
-- Indexes for table `felhasznalo_adoszam`
--
ALTER TABLE `felhasznalo_adoszam`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`adoszam`) USING BTREE;

--
-- Indexes for table `felhasznalo_anyja_neve`
--
ALTER TABLE `felhasznalo_anyja_neve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `felhasznalo_infok`
--
ALTER TABLE `felhasznalo_infok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `felhasznalo_lakcim`
--
ALTER TABLE `felhasznalo_lakcim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iranyitoszam` (`iranyitoszam`);

--
-- Indexes for table `felhasznalo_neve`
--
ALTER TABLE `felhasznalo_neve`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`iranyitoszam`,`telepules`);

--
-- Indexes for table `telek`
--
ALTER TABLE `telek`
  ADD PRIMARY KEY (`helyrajzi_szam`);

--
-- Indexes for table `tulajdonos_ingatlan_birtoklas`
--
ALTER TABLE `tulajdonos_ingatlan_birtoklas`
  ADD PRIMARY KEY (`tib_id`),
  ADD UNIQUE KEY `f_id` (`f_id`,`ingatlan_azonosito`),
  ADD KEY `ingatlan_azonosito` (`ingatlan_azonosito`);

--
-- Indexes for table `tulajdonos_telek_birtoklas`
--
ALTER TABLE `tulajdonos_telek_birtoklas`
  ADD PRIMARY KEY (`ttb_id`),
  ADD UNIQUE KEY `f_id` (`f_id`,`helyrajzi_szam`),
  ADD KEY `helyrajzi_szam` (`helyrajzi_szam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `felhasznalo_adoszam`
--
ALTER TABLE `felhasznalo_adoszam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `felhasznalo_anyja_neve`
--
ALTER TABLE `felhasznalo_anyja_neve`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `felhasznalo_infok`
--
ALTER TABLE `felhasznalo_infok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `felhasznalo_lakcim`
--
ALTER TABLE `felhasznalo_lakcim`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `felhasznalo_neve`
--
ALTER TABLE `felhasznalo_neve`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tulajdonos_ingatlan_birtoklas`
--
ALTER TABLE `tulajdonos_ingatlan_birtoklas`
  MODIFY `tib_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tulajdonos_telek_birtoklas`
--
ALTER TABLE `tulajdonos_telek_birtoklas`
  MODIFY `ttb_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `felhasznalo_adoszam`
--
ALTER TABLE `felhasznalo_adoszam`
  ADD CONSTRAINT `felhasznalo_adoszam_ibfk_1` FOREIGN KEY (`id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `felhasznalo_anyja_neve`
--
ALTER TABLE `felhasznalo_anyja_neve`
  ADD CONSTRAINT `felhasznalo_anyja_neve_ibfk_1` FOREIGN KEY (`id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `felhasznalo_infok`
--
ALTER TABLE `felhasznalo_infok`
  ADD CONSTRAINT `felhasznalo_infok_ibfk_1` FOREIGN KEY (`id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `felhasznalo_lakcim`
--
ALTER TABLE `felhasznalo_lakcim`
  ADD CONSTRAINT `felhasznalo_lakcim_ibfk_1` FOREIGN KEY (`id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `felhasznalo_lakcim_ibfk_2` FOREIGN KEY (`iranyitoszam`) REFERENCES `iranyitoszam_telepules` (`iranyitoszam`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `felhasznalo_neve`
--
ALTER TABLE `felhasznalo_neve`
  ADD CONSTRAINT `felhasznalo_neve_ibfk_1` FOREIGN KEY (`id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
  ADD CONSTRAINT `tulajdonos_ingatlan_birtoklas_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tulajdonos_ingatlan_birtoklas_ibfk_2` FOREIGN KEY (`ingatlan_azonosito`) REFERENCES `ingatlan` (`ingatlan_azonosito`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tulajdonos_telek_birtoklas`
--
ALTER TABLE `tulajdonos_telek_birtoklas`
  ADD CONSTRAINT `tulajdonos_telek_birtoklas_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `felhasznalo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tulajdonos_telek_birtoklas_ibfk_2` FOREIGN KEY (`helyrajzi_szam`) REFERENCES `telek` (`helyrajzi_szam`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;