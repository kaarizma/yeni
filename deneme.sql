-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Oca 2022, 15:07:34
-- Sunucu sürümü: 8.0.21
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `deneme`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cevap`
--

DROP TABLE IF EXISTS `cevap`;
CREATE TABLE IF NOT EXISTS `cevap` (
  `kod` int NOT NULL AUTO_INCREMENT,
  `soruKod` int NOT NULL,
  `kullaniciKod` int NOT NULL,
  `cevap` text NOT NULL,
  `zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kod`),
  KEY `kullaniciKod` (`kullaniciKod`),
  KEY `soruKod` (`soruKod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cevap`
--

INSERT INTO `cevap` (`kod`, `soruKod`, `kullaniciKod`, `cevap`) VALUES
(1, 2, 3, 'nasıl çözemiyon aminyum'),
(2, 1, 7, 'deneme123'),
(3, 1, 7, '4 eder al öp başına koy yavrum'),
(4, 3, 7, '10 eder assanım');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `kod` int NOT NULL AUTO_INCREMENT,
  `kategoriAdi` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kod`, `kategoriAdi`) VALUES
(1, 'Matematik'),
(2, 'Türkçe'),
(3, 'Fen Bilimleri'),
(4, 'Sosyal Bilimler'),
(5, 'İngilizce');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `kod` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `kAdi` varchar(255) NOT NULL,
  `ePosta` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kod`, `ad`, `soyad`, `kAdi`, `ePosta`, `sifre`) VALUES
(1, 'Ahmet', 'Elgörmüş', 'Aslan', 'deneme@gmail.com', '12345'),
(2, 'ahmet', 'elgörmüş', 'asdasdas', 'ahmet@hotmail.com', '213345433'),
(3, 'elgörmüş', '', 'asd@hotmail.com', 'asd@hotmail.com', '$2y$10$/CLbM7SQddWwXFpSithKiufTqMIzhbBz9jdm3JbhJzNKVZoY05db2'),
(4, 'ahmet', 'elgörmüş', 'asd@hotmail.com', 'asd@hotmail.com', '$2y$10$POH75igvStuk/oysLddiIOLN4z48A/ZY3jmaT3wo5PBuqFzGDxMQa'),
(5, 'ahmet', 'elgörmüş', 'asd@hotmail.com', 'asd@hotmail.com', '$2y$10$p1lkyEoopwz5AL862hkUGOwDji7EF2da/oHftlXEzJ.4bSkfiiStq'),
(7, 'admin', 'admin', 'admin', 'admin@admin.com', '$2y$10$xyGpoHvn/PlYQCTkQ24m2OaAEHr0bj/AwfndtCwdBQmho8dn/ivee');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru`
--

DROP TABLE IF EXISTS `soru`;
CREATE TABLE IF NOT EXISTS `soru` (
  `kod` int NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) NOT NULL,
  `kategoriKod` int NOT NULL,
  `icerik` text NOT NULL,
  `kullaniciKod` int NOT NULL,
  `zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kod`),
  KEY `kategoriKod` (`kategoriKod`),
  KEY `kullaniciKod` (`kullaniciKod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soru`
--

INSERT INTO `soru` (`kod`, `baslik`, `kategoriKod`, `icerik`, `kullaniciKod`) VALUES
(1, 'bu soruyu çözemedim', 4, '2+2 = kaç eder lütfen yardım edin', 7),
(2, 'bu soruysu çözemedim', 2, '2+2 = kaç eder lütfen yardım edin', 2),
(3, 'deneme', 1, '5+5', 7);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cevap`
--
ALTER TABLE `cevap`
  ADD CONSTRAINT `cevap_ibfk_1` FOREIGN KEY (`kullaniciKod`) REFERENCES `kullanici` (`kod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cevap_ibfk_2` FOREIGN KEY (`soruKod`) REFERENCES `soru` (`kod`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Tablo kısıtlamaları `soru`
--
ALTER TABLE `soru`
  ADD CONSTRAINT `soru_ibfk_1` FOREIGN KEY (`kategoriKod`) REFERENCES `kategori` (`kod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `soru_ibfk_2` FOREIGN KEY (`kullaniciKod`) REFERENCES `kullanici` (`kod`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
