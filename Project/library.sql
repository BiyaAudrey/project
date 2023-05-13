-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Jeu 11 Mai 2023 à 08:02
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `rackID` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `publisherID` int(11) NOT NULL,
  `ISBN` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `no_of_copy` int(5) NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL,
  `uptaded_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `issued_book`
--

CREATE TABLE IF NOT EXISTS `issued_book` (
  `issuebookID` int(11) NOT NULL AUTO_INCREMENT,
  `bookID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `issue_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_return_date` date NOT NULL,
  `return_date_time` datetime NOT NULL,
  `status` enum('Issued','Return','Not Return') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`issuebookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

CREATE TABLE IF NOT EXISTS `publisher` (
  `publisherID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rack`
--

CREATE TABLE IF NOT EXISTS `rack` (
  `rackID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Enable',
  PRIMARY KEY (`rackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Password` varchar(64) NOT NULL,
  `role` enum('admin','user') DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
