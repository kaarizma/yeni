-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 20 May 2019, 16:53:07
-- Sunucu sürümü: 5.7.24
-- PHP Sürümü: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mydb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cevap`
--

DROP TABLE IF EXISTS `cevap`;
CREATE TABLE IF NOT EXISTS `cevap` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `kullaniciKod` int(11) NOT NULL,
  `soruKod` int(11) NOT NULL,
  `cevap` text NOT NULL,
  `zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`kod`),
  KEY `fk_kullanici_has_soru_soru1_idx` (`soruKod`),
  KEY `fk_kullanici_has_soru_kullanici1_idx` (`kullaniciKod`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cevap`
--

INSERT INTO `cevap` (`kod`, `kullaniciKod`, `soruKod`, `cevap`, `zaman`) VALUES
(11, 28, 36, 'asdasdasdasdasd', '2019-05-06 20:21:10'),
(12, 28, 36, 'asdasdasdasdasdasd asd asdas', '2019-05-06 20:21:23'),
(13, 28, 36, 'asdasd asd as asd', '2019-05-06 20:21:28'),
(14, 28, 35, 'asd asd as dad as dass', '2019-05-06 20:21:49'),
(15, 28, 35, 'asdasdasda da sdas das asd as', '2019-05-06 20:35:03'),
(16, 28, 35, 'asdasdas ads ads das asd   adsadsasads sad ads asd sad', '2019-05-06 20:35:12'),
(17, 30, 35, 'asd asd as adsas', '2019-05-06 20:36:33'),
(18, 30, 45, 'sadasdsadasd ad assad', '2019-05-06 20:37:15'),
(19, 28, 46, 'deneme', '2019-05-14 11:42:26'),
(20, 28, 46, 'deneme2', '2019-05-14 11:42:30'),
(21, 28, 46, '3. secap', '2019-05-14 13:30:32'),
(22, 30, 46, 'son yorum', '2019-05-14 16:49:00'),
(23, 28, 48, 'ilk yorum', '2019-05-20 13:03:14'),
(24, 28, 49, 'cevapladim.com', '2019-05-20 13:30:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `kategoriAdi` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kod`, `kategoriAdi`) VALUES
(1, 'Türkçe'),
(2, 'Matematik'),
(3, 'Fen'),
(4, 'Sosyal'),
(5, 'Matematik 2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `soyad` varchar(255) NOT NULL,
  `ePosta` varchar(255) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kod`, `kullanici`, `sifre`, `ad`, `soyad`, `ePosta`) VALUES
(28, 'admin', '$2y$10$4Csz6EPMRpPAugtTwoyyUOk.TR701HrX17uVec6bDnnbhxfihJNTa', 'admin', 'admin', 'admin@hotmail.com'),
(30, 'aslan', '$2y$10$LumjFX43YDqgNPz20B/JZOXBhnoRUDeMCLDeXo0Ot2UFTnMyfwHk.', 'aslan', 'korkmaz', 'asdasd@hotmail.com'),
(31, 'deneme', '$2y$10$UbGw1r7Tlk1q8uFHGeLEVuGwA7W9tWCZ29SFZs3Zd4bdYLc5iO3u6', 'deneme', 'deneme', 'deneme@deneme.deneme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soru`
--

DROP TABLE IF EXISTS `soru`;
CREATE TABLE IF NOT EXISTS `soru` (
  `kod` int(11) NOT NULL AUTO_INCREMENT,
  `baslik` varchar(255) NOT NULL,
  `soru` text NOT NULL,
  `dosya` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hit` int(11) NOT NULL,
  `kategoriKod` int(11) NOT NULL,
  `kullaniciKod` int(11) NOT NULL,
  PRIMARY KEY (`kod`),
  KEY `fk_soru_kategori_idx` (`kategoriKod`),
  KEY `fk_soru_kullanici1_idx` (`kullaniciKod`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soru`
--

INSERT INTO `soru` (`kod`, `baslik`, `soru`, `dosya`, `url`, `zaman`, `hit`, `kategoriKod`, `kullaniciKod`) VALUES
(35, '1. Sorunun Başlığı', '1. sorunun detayları', 'kayit.jpg', 'resimler/1556644525_kayit.jpg', '0000-00-00 00:00:00', 8, 5, 28),
(36, '2. Sorunun Başlığı', '2. sorunun detayları', 'kayit.jpg', 'resimler/1556644530_kayit.jpg', '0000-00-00 00:00:00', 3, 5, 28),
(45, '3. Sorunun Başlığı', '3. sorunun detayları', 'logol.jpeg', 'resimler/1557166915_logol.jpeg', '2019-05-06 18:21:55', 7, 4, 30),
(46, '4. Soru', '4. Sorumun \r\ndetayları\r\nyardım\r\nacil\r\nlazım', 'WhatsApp Image 2019-03-24 at 23.37.51.jpeg', 'resimler/1557171964_WhatsApp Image 2019-03-24 at 23.37.51.jpeg', '2019-05-06 19:46:04', 5, 5, 28),
(48, 'deneme', 'deneme deneme \r\n\r\n<wbr>\r\n\r\n<br>\r\n\r\ndeneme', NULL, NULL, '2019-05-14 17:11:57', 19, 2, 30),
(49, 'son soru', 'sdadsads', NULL, NULL, '2019-05-20 13:03:39', 20, 1, 28);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sorubegeni`
--

DROP TABLE IF EXISTS `sorubegeni`;
CREATE TABLE IF NOT EXISTS `sorubegeni` (
  `kkod` int(11) NOT NULL,
  `skod` int(11) NOT NULL,
  PRIMARY KEY (`kkod`,`skod`),
  KEY `skod` (`skod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sorubegeni`
--

INSERT INTO `sorubegeni` (`kkod`, `skod`) VALUES
(28, 35),
(30, 35),
(28, 36),
(28, 46),
(30, 46),
(28, 48),
(28, 49);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cevap`
--
ALTER TABLE `cevap`
  ADD CONSTRAINT `fk_kullanici_has_soru_kullanici1` FOREIGN KEY (`kullaniciKod`) REFERENCES `kullanici` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kullanici_has_soru_soru1` FOREIGN KEY (`soruKod`) REFERENCES `soru` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `soru`
--
ALTER TABLE `soru`
  ADD CONSTRAINT `fk_soru_kategori` FOREIGN KEY (`kategoriKod`) REFERENCES `kategori` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_soru_kullanici1` FOREIGN KEY (`kullaniciKod`) REFERENCES `kullanici` (`kod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Tablo kısıtlamaları `sorubegeni`
--
ALTER TABLE `sorubegeni`
  ADD CONSTRAINT `sorubegeni_ibfk_1` FOREIGN KEY (`kkod`) REFERENCES `kullanici` (`kod`),
  ADD CONSTRAINT `sorubegeni_ibfk_2` FOREIGN KEY (`skod`) REFERENCES `soru` (`kod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
