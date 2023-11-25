-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 01:02 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (kulcs)',
  `jelszo` varchar(255) NOT NULL COMMENT 'Hashelt jelszó',
  `utolso_belepes_idopontja` timestamp NULL DEFAULT NULL COMMENT 'Utolsó belépés időpontja (automatikus update',
  `be_van-e_jelentkezve` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Ha 1: be van jelentkezve, ha 0: nincs bejelentkezve',
  `szerepkor` int(10) UNSIGNED NOT NULL DEFAULT 2 COMMENT 'Ha az érték 1: hivatali dolgozó, ha 2: tulajdonos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók bejelentkezési és authorizációs adatai';

--
-- Dumping data for table `felhasznalo`
--

--
-- user1-user50 jelszo: password123
--

INSERT INTO `felhasznalo` (`azonosito`, `jelszo`, `utolso_belepes_idopontja`, `be_van-e_jelentkezve`, `szerepkor`) VALUES
('aaaaaa', '$2y$10$6nUqpyj/44cWJXtuD8jEg.R1ID5gKaf4XCRmdFoRQIF.IAN00FVSy', NULL, 0, 2),
('asd111', '$2y$10$Tdp0xIDaEBaYTUpWhSce3uwknCnyNquiuP7NontDYyT1KiwliXMzy', NULL, 0, 2),
('asd11111', '$2y$10$9d.lnlw7y5WlWS5g9HZYwuXldKSujO3MeX8X7F31wSOTFjM.0SoDi', NULL, 0, 2),
('jelszo1', '$2y$10$fQknfIK7ohBaFhQEe.fRWuGR97s1f18JAKNEpdi6pngYkyTbJXRrW', NULL, 0, 2),
('jkljkl', '$2y$10$NZi0/9QgoS3RK80JjchmG.iEyEL6NK0kWa9KV7Xdgtgqfjk.8YibG', NULL, 0, 2),
('user1', '$2y$10$Grg0PktOnc88b3q0cC6B/umyZIMT9eE4J1Of9d0lfOXi7xFnqQ82u', NULL, 0, 2),
('user10', '$2y$10$pn1ADhZKW7vyW6mN1SBPl.BQXy.ZBTsScyy5az/1vV1u2yLMzFgfa', NULL, 0, 2),
('user11', '$2y$10$fjzPF0aMyIRiKD5zR6P0Q.XppE2V2iOTyfK2PDKk7w2pXMN8G3JOm', NULL, 0, 2),
('user12', '$2y$10$yFhzzGmJwek/uVzSGyKgauGR6Rg1.oOxvh4rWyKGCTOLCZzvRC9eq', NULL, 0, 2),
('user13', '$2y$10$WzYZVB.T/0hIqj1oFOi5R.qKOF6cXu3hycHz0lb/R8vijyPHXXGlu', NULL, 0, 2),
('user14', '$2y$10$Hvun5I7J.WsHRF6t4H0jjObwL2keXbDOoxDwH0HyU6DDfAn1EjDzi', NULL, 0, 2),
('user15', '$2y$10$27UOAMZHgjsJg0lE8lh.H.cC6Oo8My14HvH0aM6bZ5lVqX0Z1tHki', NULL, 0, 2),
('user16', '$2y$10$j.Y5goBCX0S6hE5rXWYU2uFsXenLhNBqmoZkWbkQNOe8qDxtTIZGy', NULL, 0, 2),
('user17', '$2y$10$LUZleqzLk8brbK6Wi7W8vO9qlJ6pN7btl4yz4OWhP6GfzFV1nBxxq', NULL, 0, 2),
('user18', '$2y$10$YY.SVH1VW6W8aazjDhoEF.u6/ozBZ5YAcBwOHUTVBdWVLmz6QvOKC', NULL, 0, 2),
('user19', '$2y$10$XDfhCp3R2/eXKzFq6rYeueuRn5PbkXLPzTt8l8tqne0pSlV2xhBRm', NULL, 0, 2),
('user2', '$2y$10$1oUR4UKD0Qfg/ZtUskx4Xunb8BKyRyQGvMQbqDPPYmtiW4nUo6Tma', NULL, 0, 2),
('user20', '$2y$10$Grg0PktOnc88b3q0cC6B/umyZIMT9eE4J1Of9d0lfOXi7xFnqQ82u', NULL, 0, 2),
('user21', '$2y$10$1oUR4UKD0Qfg/ZtUskx4Xunb8BKyRyQGvMQbqDPPYmtiW4nUo6Tma', NULL, 0, 2),
('user22', '$2y$10$ZbUjjZGrsqzzU0vI7K/PLusmEYmPLjC5C1LdHfA9cH7MTYKFDfIw2', NULL, 0, 2),
('user23', '$2y$10$9Snd5n.e/k.BVAPeMUmW.uFnRmzLjQIT.5PgyJKziU3E3NB2VxZay', NULL, 0, 2),
('user24', '$2y$10$zdXGmWeASitM8MeZS1bDYOMaCTeDg.KMRfWpum.QblZFmRuDFBFJu', NULL, 0, 2),
('user25', '$2y$10$2OHVvIT4XMqR2QD7kMZqR.5eukm.GkHXlLUeAAtj7aXKvQEGDSsQu', NULL, 0, 2),
('user26', '$2y$10$yyM9kC5V8ylnyUL1X10GzOq6t1lP96bVvtNYNv3SSRm2yS4fT6rjy', NULL, 0, 2),
('user27', '$2y$10$wqL6Wxt4vAXhRdMxQuSDWeHeRT.QX4P5F0XVQxJwF5fCwgdys5HZa', NULL, 0, 2),
('user28', '$2y$10$rHRNVBXQCMelZD0TsjWGke8bKF/o1u5ml0Y4uoFw8YTpLlThnExY6', NULL, 0, 2),
('user29', '$2y$10$pn1ADhZKW7vyW6mN1SBPl.BQXy.ZBTsScyy5az/1vV1u2yLMzFgfa', NULL, 0, 2),
('user3', '$2y$10$ZbUjjZGrsqzzU0vI7K/PLusmEYmPLjC5C1LdHfA9cH7MTYKFDfIw2', NULL, 0, 2),
('user30', '$2y$10$fjzPF0aMyIRiKD5zR6P0Q.XppE2V2iOTyfK2PDKk7w2pXMN8G3JOm', NULL, 0, 2),
('user31', '$2y$10$yFhzzGmJwek/uVzSGyKgauGR6Rg1.oOxvh4rWyKGCTOLCZzvRC9eq', NULL, 0, 2),
('user32', '$2y$10$WzYZVB.T/0hIqj1oFOi5R.qKOF6cXu3hycHz0lb/R8vijyPHXXGlu', NULL, 0, 2),
('user33', '$2y$10$Hvun5I7J.WsHRF6t4H0jjObwL2keXbDOoxDwH0HyU6DDfAn1EjDzi', NULL, 0, 2),
('user34', '$2y$10$27UOAMZHgjsJg0lE8lh.H.cC6Oo8My14HvH0aM6bZ5lVqX0Z1tHki', NULL, 0, 2),
('user35', '$2y$10$j.Y5goBCX0S6hE5rXWYU2uFsXenLhNBqmoZkWbkQNOe8qDxtTIZGy', NULL, 0, 2),
('user36', '$2y$10$LUZleqzLk8brbK6Wi7W8vO9qlJ6pN7btl4yz4OWhP6GfzFV1nBxxq', NULL, 0, 2),
('user37', '$2y$10$YY.SVH1VW6W8aazjDhoEF.u6/ozBZ5YAcBwOHUTVBdWVLmz6QvOKC', NULL, 0, 2),
('user38', '$2y$10$XDfhCp3R2/eXKzFq6rYeueuRn5PbkXLPzTt8l8tqne0pSlV2xhBRm', NULL, 0, 2),
('user39', '$2y$10$Grg0PktOnc88b3q0cC6B/umyZIMT9eE4J1Of9d0lfOXi7xFnqQ82u', NULL, 0, 2),
('user4', '$2y$10$9Snd5n.e/k.BVAPeMUmW.uFnRmzLjQIT.5PgyJKziU3E3NB2VxZay', NULL, 0, 2),
('user40', '$2y$10$1oUR4UKD0Qfg/ZtUskx4Xunb8BKyRyQGvMQbqDPPYmtiW4nUo6Tma', NULL, 0, 2),
('user41', '$2y$10$ZbUjjZGrsqzzU0vI7K/PLusmEYmPLjC5C1LdHfA9cH7MTYKFDfIw2', NULL, 0, 2),
('user42', '$2y$10$9Snd5n.e/k.BVAPeMUmW.uFnRmzLjQIT.5PgyJKziU3E3NB2VxZay', NULL, 0, 2),
('user43', '$2y$10$zdXGmWeASitM8MeZS1bDYOMaCTeDg.KMRfWpum.QblZFmRuDFBFJu', NULL, 0, 2),
('user44', '$2y$10$2OHVvIT4XMqR2QD7kMZqR.5eukm.GkHXlLUeAAtj7aXKvQEGDSsQu', NULL, 0, 2),
('user45', '$2y$10$yyM9kC5V8ylnyUL1X10GzOq6t1lP96bVvtNYNv3SSRm2yS4fT6rjy', NULL, 0, 2),
('user46', '$2y$10$wqL6Wxt4vAXhRdMxQuSDWeHeRT.QX4P5F0XVQxJwF5fCwgdys5HZa', NULL, 0, 2),
('user47', '$2y$10$rHRNVBXQCMelZD0TsjWGke8bKF/o1u5ml0Y4uoFw8YTpLlThnExY6', NULL, 0, 2),
('user48', '$2y$10$pn1ADhZKW7vyW6mN1SBPl.BQXy.ZBTsScyy5az/1vV1u2yLMzFgfa', NULL, 0, 2),
('user49', '$2y$10$yyM9kC5V8ylnyUL1X10GzOq6t1lP96bVvtNYNv3SSRm2yS4fT6rjy', NULL, 0, 2),
('user5', '$2y$10$zdXGmWeASitM8MeZS1bDYOMaCTeDg.KMRfWpum.QblZFmRuDFBFJu', NULL, 0, 2),
('user50', '$2y$10$wqL6Wxt4vAXhRdMxQuSDWeHeRT.QX4P5F0XVQxJwF5fCwgdys5HZa', NULL, 0, 2),
('user51', '$2y$10$rHRNVBXQCMelZD0TsjWGke8bKF/o1u5ml0Y4uoFw8YTpLlThnExY6', NULL, 0, 2),
('user52', '$2y$10$pn1ADhZKW7vyW6mN1SBPl.BQXy.ZBTsScyy5az/1vV1u2yLMzFgfa', NULL, 0, 2),
('user6', '$2y$10$2OHVvIT4XMqR2QD7kMZqR.5eukm.GkHXlLUeAAtj7aXKvQEGDSsQu', NULL, 0, 2),
('user7', '$2y$10$yyM9kC5V8ylnyUL1X10GzOq6t1lP96bVvtNYNv3SSRm2yS4fT6rjy', NULL, 0, 2),
('user8', '$2y$10$wqL6Wxt4vAXhRdMxQuSDWeHeRT.QX4P5F0XVQxJwF5fCwgdys5HZa', NULL, 0, 2),
('user9', '$2y$10$rHRNVBXQCMelZD0TsjWGke8bKF/o1u5ml0Y4uoFw8YTpLlThnExY6', NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_adoszam`
--

CREATE TABLE `felhasznalo_adoszam` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `adoszam` varchar(255) NOT NULL COMMENT 'Felhasználó adószáma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók adószáma';

--
-- Dumping data for table `felhasznalo_adoszam`
--

INSERT INTO `felhasznalo_adoszam` (`azonosito`, `adoszam`) VALUES
('aaaaaa', '112312ASD2'),
('asd111', '112312ASD3'),
('asd11111', '112312ASD4'),
('jelszo1', 'jkqhwdjh'),
('jkljkl', '112312ASD5'),
('user1', '12345678901'),
('user10', '10234567890'),
('user11', '21098765432'),
('user12', '32109876543'),
('user13', '43210987654'),
('user14', '54321098765'),
('user15', '65432109876'),
('user16', '76543210987'),
('user17', '87654321098'),
('user18', '98765432109'),
('user19', '10987654320'),
('user2', '23456789012'),
('user20', '98765432101'),
('user21', '87654321021'),
('user22', '76543210932'),
('user23', '65432109843'),
('user24', '54321098754'),
('user25', '43210987665'),
('user26', '32109876576'),
('user27', '21098765487'),
('user28', '10987654398'),
('user29', '21098765409'),
('user3', '34567890123'),
('user30', '10987654310'),
('user31', '21098765421'),
('user32', '10987654332'),
('user33', '21098765443'),
('user34', '10987654354'),
('user35', '21098765465'),
('user36', '10987654376'),
('user37', '21098765487'),
('user38', '10987654398'),
('user39', '21098765409'),
('user4', '45678901234'),
('user40', '10987654310'),
('user41', '21098765421'),
('user42', '10987654332'),
('user43', '21098765443'),
('user44', '10987654354'),
('user45', '21098765465'),
('user46', '10987654376'),
('user47', '21098765487'),
('user48', '10987654398'),
('user49', '21098765409'),
('user5', '56789012345'),
('user50', '10987654310'),
('user6', '67890123456'),
('user7', '78901234567'),
('user8', '89012345678'),
('user9', '90123456789');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_anyja_neve`
--

CREATE TABLE `felhasznalo_anyja_neve` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (foreign key)',
  `vezeteknev` varchar(255) NOT NULL COMMENT 'Felhasználó anyjának vezetékneve',
  `keresztnev` varchar(255) NOT NULL COMMENT 'Felhasználó anyjának keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók anyjának teljes neve';

--
-- Dumping data for table `felhasznalo_anyja_neve`
--

INSERT INTO `felhasznalo_anyja_neve` (`azonosito`, `vezeteknev`, `keresztnev`) VALUES
('aaaaaa', 'BBBB', 'AAAA'),
('asd111', 'BBBB', 'AAAA'),
('asd11111', 'BBBB', 'AAAA'),
('jelszo1', 'BBBB', 'AAAA'),
('jkljkl', 'BBBB', 'AAAA'),
('user1', 'Johnson', 'Emma'),
('user10', 'Hernandez', 'Grace'),
('user11', 'Lopez', 'Lily'),
('user12', 'Gonzalez', 'Chloe'),
('user13', 'Wilson', 'Scarlett'),
('user14', 'Anderson', 'Aria'),
('user15', 'Thomas', 'Nora'),
('user16', 'Taylor', 'Layla'),
('user17', 'Moore', 'Hazel'),
('user18', 'Clark', 'Penelope'),
('user19', 'Lewis', 'Eleanor'),
('user2', 'Williams', 'Olivia'),
('user20', 'Young', 'Aurora'),
('user21', 'Johnson', 'Emma'),
('user22', 'Williams', 'Olivia'),
('user23', 'Jones', 'Ava'),
('user24', 'Brown', 'Sophia'),
('user25', 'Miller', 'Isabella'),
('user26', 'Davis', 'Mia'),
('user27', 'Garcia', 'Charlotte'),
('user28', 'Rodriguez', 'Abigail'),
('user29', 'Martinez', 'Ella'),
('user3', 'Jones', 'Ava'),
('user30', 'Hernandez', 'Grace'),
('user31', 'Lopez', 'Lily'),
('user32', 'Gonzalez', 'Chloe'),
('user33', 'Wilson', 'Scarlett'),
('user34', 'Anderson', 'Aria'),
('user35', 'Thomas', 'Nora'),
('user36', 'Taylor', 'Layla'),
('user37', 'Moore', 'Hazel'),
('user38', 'Clark', 'Penelope'),
('user39', 'Lewis', 'Eleanor'),
('user4', 'Brown', 'Sophia'),
('user40', 'Young', 'Aurora'),
('user41', 'Scott', 'Violet'),
('user42', 'Hall', 'Zoe'),
('user43', 'Turner', 'Stella'),
('user44', 'Adams', 'Lillian'),
('user45', 'Ward', 'Claire'),
('user46', 'Cook', 'Lucy'),
('user47', 'Bell', 'Anna'),
('user48', 'Cooper', 'Sofia'),
('user49', 'Diaz', 'Grace'),
('user5', 'Miller', 'Isabella'),
('user50', 'Reyes', 'Aubrey'),
('user6', 'Davis', 'Mia'),
('user7', 'Garcia', 'Charlotte'),
('user8', 'Rodriguez', 'Abigail'),
('user9', 'Martinez', 'Ella');

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_infok`
--

CREATE TABLE `felhasznalo_infok` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (foreign kulcs a felhasznalo táblából)',
  `telefonszam` varchar(255) NOT NULL COMMENT 'Telefonszám',
  `szuletesi_datum` date NOT NULL COMMENT 'Felhasználó születési dátuma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók privát adatai';

--
-- Dumping data for table `felhasznalo_infok`
--

INSERT INTO `felhasznalo_infok` (`azonosito`, `telefonszam`, `szuletesi_datum`) VALUES
('aaaaaa', '+36307777777', '2023-11-01'),
('asd111', '+36307777777', '2000-01-05'),
('asd11111', '+36307777777', '2000-01-05'),
('jelszo1', '+36307777777', '2023-11-18'),
('jkljkl', '+36307777777', '2023-11-02'),
('user1', '+1234567890', '1990-05-15'),
('user10', '+1023456789', '1996-07-31'),
('user11', '+2109876543', '1989-10-26'),
('user12', '+3210987654', '1991-01-12'),
('user13', '+4321098765', '1997-04-19'),
('user14', '+5432109876', '1986-08-07'),
('user15', '+6543210987', '1994-11-23'),
('user16', '+7654321098', '1983-01-30'),
('user17', '+8765432109', '1999-05-07'),
('user18', '+9876543210', '1982-09-13'),
('user19', '+1098765432', '1990-12-28'),
('user2', '+2345678901', '1985-08-22'),
('user20', '+9876543211', '1981-03-05'),
('user21', '+8765432102', '1990-06-15'),
('user22', '+7654321093', '1985-09-22'),
('user23', '+6543210984', '1992-04-10'),
('user24', '+5432109875', '1988-12-28'),
('user25', '+4321098766', '1995-07-03'),
('user26', '+3210987657', '1998-10-17'),
('user27', '+2109876548', '1987-05-05'),
('user28', '+1098765439', '1993-01-20'),
('user29', '+2109876540', '1984-03-14'),
('user3', '+3456789012', '1992-03-10'),
('user30', '+1098765431', '1996-08-31'),
('user31', '+2109876542', '1989-11-26'),
('user32', '+1098765433', '1991-02-12'),
('user33', '+2109876544', '1997-05-19'),
('user34', '+1098765435', '1986-09-07'),
('user35', '+2109876546', '1994-12-23'),
('user36', '+1098765437', '1983-02-01'),
('user37', '+2109876548', '1999-06-07'),
('user38', '+1098765439', '1982-10-13'),
('user39', '+2109876540', '1990-01-28'),
('user4', '+4567890123', '1988-11-28'),
('user40', '+1098765431', '1981-04-05'),
('user41', '+2109876542', '1989-07-31'),
('user42', '+1098765433', '1991-10-26'),
('user43', '+2109876544', '1997-01-12'),
('user44', '+1098765435', '1986-04-19'),
('user45', '+2109876546', '1994-08-07'),
('user46', '+1098765437', '1983-11-23'),
('user47', '+2109876548', '1999-01-30'),
('user48', '+1098765439', '1982-05-07'),
('user49', '+2109876540', '1990-09-13'),
('user5', '+5678901234', '1995-06-03'),
('user50', '+1098765431', '1981-12-28'),
('user6', '+6789012345', '1998-09-17'),
('user7', '+7890123456', '1987-04-05'),
('user8', '+8901234567', '1993-12-20'),
('user9', '+9012345678', '1984-02-14');

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

--
-- Dumping data for table `felhasznalo_lakcim`
--

INSERT INTO `felhasznalo_lakcim` (`azonosito`, `iranyitoszam`, `utca`, `hazszam`) VALUES
('aaaaaa', 6000, 'asd utca', 1),
('asd111', 6000, 'asd utca', 1),
('asd11111', 6000, 'asd utca', 1),
('jelszo1', 6000, 'asd utca', 1),
('jkljkl', 6000, 'asd utca', 1),
('user1', 1011, 'Fő utca', 1),
('user10', 9700, 'Szabadság tér', 11),
('user11', 5000, 'Ady Endre utca', 2),
('user12', 2030, 'Bartók Béla út', 6),
('user13', 2800, 'Hunyadi tér', 14),
('user14', 9400, 'Fő tér', 3),
('user15', 7400, 'Kossuth utca', 17),
('user16', 8200, 'Széchenyi tér', 8),
('user17', 5600, 'Kisfaludy utca', 5),
('user18', 8900, 'Arany János utca', 12),
('user19', 3300, 'Szent István tér', 6),
('user2', 4024, 'Kossuth utca', 5),
('user20', 8800, 'Fő tér', 7),
('user21', 2120, 'György utca', 10),
('user22', 6800, 'Arany János utca', 21),
('user23', 7100, 'Szabadság tér', 9),
('user24', 7100, 'Petőfi Sándor utca', 15),
('user25', 2600, 'Kossuth tér', 4),
('user26', 3100, 'Dózsa György út', 6),
('user27', 2700, 'Vörösmarty tér', 8),
('user28', 5900, 'Bajnai út', 5),
('user29', 8400, 'Kossuth Lajos utca', 11),
('user3', 6720, 'Rákóczi út', 12),
('user30', 6600, 'Petőfi tér', 7),
('user31', 2310, 'Szent István tér', 12),
('user32', 6800, 'Arany János utca', 14),
('user33', 3000, 'Kossuth tér', 8),
('user34', 6500, 'Petőfi Sándor utca', 21),
('user35', 2400, 'Dózsa György út', 15),
('user36', 3200, 'Vörösmarty tér', 9),
('user37', 4220, 'Bajnai út', 6),
('user38', 9600, 'Kossuth Lajos utca', 3),
('user39', 8360, 'Petőfi tér', 11),
('user4', 3529, 'Petőfi tér', 7),
('user40', 9200, 'Arany János utca', 5),
('user41', 2360, 'Kossuth tér', 10),
('user42', 6100, 'Petőfi Sándor utca', 8),
('user43', 2500, 'Dózsa György út', 4),
('user44', 8500, 'Vörösmarty tér', 6),
('user45', 4200, 'Bajnai út', 5),
('user46', 8100, 'Kossuth Lajos utca', 17),
('user47', 2100, 'Petőfi tér', 12),
('user48', 5500, 'Arany János utca', 14),
('user49', 2890, 'Kossuth tér', 8),
('user5', 7621, 'Szent István tér', 3),
('user50', 8600, 'Petőfi Sándor utca', 21),
('user6', 9021, 'Bajnai út', 9),
('user7', 4400, 'Kossuth Lajos utca', 16),
('user8', 8000, 'Kossuth tér', 8),
('user9', 6000, 'Deák tér', 4);

-- --------------------------------------------------------

--
-- Table structure for table `felhasznalo_neve`
--

CREATE TABLE `felhasznalo_neve` (
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosítója (foreign key)',
  `vezeteknev` varchar(255) NOT NULL COMMENT 'Felhasználó vezetékneve',
  `keresztnev` varchar(255) NOT NULL COMMENT 'Felhasználó keresztneve'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Felhasználók teljes neve';

--
-- Dumping data for table `felhasznalo_neve`
--

INSERT INTO `felhasznalo_neve` (`azonosito`, `vezeteknev`, `keresztnev`) VALUES
('aaaaaa', 'dsadsa', 'asda'),
('asd111', 'DSA', 'ASD'),
('asd11111', 'DSA', 'ASD'),
('jelszo1', 'awhjdkjaw', 'asdawd'),
('jkljkl', 'DSA', 'ASD'),
('user1', 'Nagy', 'Gábor'),
('user10', 'Kiss', 'Éva'),
('user11', 'Németh', 'Fanni'),
('user12', 'Király', 'Gergő'),
('user13', 'Jakab', 'Lilla'),
('user14', 'Sándor', 'Márton'),
('user15', 'Gáspár', 'Eszter'),
('user16', 'Balogh', 'Levente'),
('user17', 'Kocsis', 'Viktória'),
('user18', 'Orbán', 'Ádám'),
('user19', 'Mészáros', 'Bianka'),
('user2', 'Kovács', 'Anna'),
('user20', 'Takács', 'Dominik'),
('user21', 'Török', 'Réka'),
('user22', 'Simon', 'Tamás'),
('user23', 'Kovács', 'Boglárka'),
('user24', 'Nagy', 'Attila'),
('user25', 'Bakos', 'Dóra'),
('user26', 'Szekeres', 'Sándor'),
('user27', 'Molnár', 'Lili'),
('user28', 'Varga', 'Márk'),
('user29', 'Kiss', 'Bianka'),
('user3', 'Tóth', 'Péter'),
('user30', 'Kovács', 'Norbert'),
('user31', 'Szabó', 'Jázmin'),
('user32', 'Takács', 'Gábor'),
('user33', 'Németh', 'Emma'),
('user34', 'Király', 'Máté'),
('user35', 'Sándor', 'Virág'),
('user36', 'Gáspár', 'Dániel'),
('user37', 'Balogh', 'Laura'),
('user38', 'Kocsis', 'Márton'),
('user39', 'Orbán', 'Réka'),
('user4', 'Varga', 'Zsuzsanna'),
('user40', 'Mészáros', 'Ádám'),
('user41', 'Török', 'Noémi'),
('user42', 'Simon', 'Gergő'),
('user43', 'Kovács', 'Bianka'),
('user44', 'Nagy', 'Áron'),
('user45', 'Bakos', 'Lilla'),
('user46', 'Szekeres', 'Gábor'),
('user47', 'Molnár', 'Márk'),
('user48', 'Varga', 'Nóra'),
('user49', 'Kiss', 'Péter'),
('user5', 'Farkas', 'Bence'),
('user50', 'Kovács', 'Eszter'),
('user6', 'Papp', 'Dóra'),
('user7', 'Molnár', 'István'),
('user8', 'Horváth', 'Katalin'),
('user9', 'Szabó', 'Máté');

-- --------------------------------------------------------

--
-- Table structure for table `ingatlan`
--

CREATE TABLE `ingatlan` (
  `ingatlan_azonosito` varchar(255) NOT NULL COMMENT 'Ingatlan azonosítója',
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
  `helyrajzi_szam` varchar(255) NOT NULL COMMENT 'Telek helyrajzi száma (kulcs)',
  `meret` int(11) NOT NULL COMMENT 'Telek mérete',
  `jelleg` varchar(255) NOT NULL COMMENT 'Telek jellege',
  `becsult_ertek` int(11) NOT NULL COMMENT 'Telek becsült értéke'
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
  `azonosito` varchar(255) NOT NULL COMMENT 'Felhasználó azonosító (kulcs)',
  `helyrajzi_szam` varchar(255) NOT NULL COMMENT 'Telek helyrajzi száma (foreign key)',
  `tulajdonba_kerules` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Tulajdonba kerülés dátuma',
  `tulajdonhanyad` int(11) NOT NULL COMMENT 'Tulajdonhányad százalékban'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tulajdonosok (felhasználó) és telkek kapcsolata';

--
-- Dumping data for table `tulajdonos_telek_birtoklas`
--

INSERT INTO `tulajdonos_telek_birtoklas` (`azonosito`, `helyrajzi_szam`, `tulajdonba_kerules`, `tulajdonhanyad`) VALUES
('user1', '101/4', '2023-11-24 07:30:00', 50),
('user10', '1010/13', '2023-12-03 00:15:00', 35),
('user11', '123/1', '2023-12-04 02:45:00', 33),
('user12', '123/1', '2023-12-05 04:30:00', 33),
('user13', '123/1', '2023-12-06 06:00:00', 33),
('user14', '1515/18', '2023-12-07 08:20:00', 15),
('user15', '1515/18', '2023-12-08 10:10:00', 85),
('user16', '1515/18', '2023-12-09 12:40:00', 20),
('user17', '1515/18', '2023-12-10 14:15:00', 80),
('user18', '1515/18', '2023-12-11 16:30:00', 45),
('user19', '2020/23', '2023-12-12 18:45:00', 55),
('user2', '2020/23', '2023-11-25 09:15:00', 30),
('user20', '2020/23', '2023-12-13 20:00:00', 30),
('user21', '1818/21', '2023-12-14 07:30:00', 40),
('user22', '1919/22', '2023-12-15 09:15:00', 60),
('user23', '2020/23', '2023-12-16 11:45:00', 80),
('user24', '2121/24', '2023-12-17 13:20:00', 20),
('user25', '2222/25', '2023-12-18 15:10:00', 45),
('user1', '2323/26', '2023-11-24 07:30:00', 50),
('user1', '4141/44', '2023-11-24 07:30:00', 50),
('user2', '2323/26', '2023-11-24 07:30:00', 50),
('user2', '456/2', '2023-11-24 07:30:00', 50),
('user3', '456/2', '2023-11-24 07:30:00', 50),
('user4', '3737/40', '2023-11-24 07:30:00', 50),
('user4', '4040/43', '2023-11-24 07:30:00', 50),
('user5', '3737/40', '2023-11-24 07:30:00', 50)



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
  ADD PRIMARY KEY (`azonosito`,`adoszam`);

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
