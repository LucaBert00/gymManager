-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.1.16-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win32
-- HeidiSQL Versione:            9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database palestra
DROP DATABASE IF EXISTS `palestra`;
CREATE DATABASE IF NOT EXISTS `palestra` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `palestra`;

-- Dump della struttura di tabella palestra.clienti
CREATE TABLE IF NOT EXISTS `clienti` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella palestra.clienti: ~19 rows (circa)
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` (`username`, `password`, `cognome`, `nome`, `citta`, `telefono`) VALUES
	('admin', 'segreta', 'Amministratore', 'Palestra', 'Lecco', ''),
	('gino', 'segreta', 'Rossi', 'Gino', 'lecco', '3344555'),
		('giorgio', 'segreta', 'Giorgio', 'Giorgi', 'Zapponeta', '667788'),
	('giorgio1', 'segreta', 'Giorgio1', 'Giorgi', 'Milano', '334455'),
	('giovanni', 'segreta', 'Verdi', 'Giovanni', 'Bari', '223344'),
	('luca', 'segreta', 'Rossi', 'Luca', 'Milano', '02554488'),
	('marco', 'segreta', 'Bianchi', 'Marco', 'Lecco', '0341338855'),
	('michele', 'segreta', 'Rossi', 'Michele', 'Milano', '334455'),
	('paolo', 'segreta', 'Neri', 'Paolo', 'lecco', '0341112233'),
	('silvio', 'segreta', 'Rossi', 'Silvio', 'Milano', '223344');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;

-- Dump della struttura di tabella palestra.corsi
CREATE TABLE IF NOT EXISTS `corsi` (
  `idCorso` varchar(5) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `giornoSettimana` varchar(20) DEFAULT NULL,
  `ora` varchar(20) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCorso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella palestra.corsi: ~10 rows (circa)
/*!40000 ALTER TABLE `corsi` DISABLE KEYS */;
INSERT INTO `corsi` (`idCorso`, `descrizione`, `giornoSettimana`, `ora`, `costo`) VALUES
	('kf', 'Kung Fu', 'mercoledi', '18.00', 250),	
	('yg', 'Corso Yoga Base', 'martedi', '16.00', 150),
	('yga', 'Corso Yoga Avanzato', 'giovedi', '14.00', 300);
/*!40000 ALTER TABLE `corsi` ENABLE KEYS */;

-- Dump della struttura di tabella palestra.iscrizioni
CREATE TABLE IF NOT EXISTS `iscrizioni` (
  `idIscrizione` int(11) NOT NULL AUTO_INCREMENT,
  `idCorso` varchar(5) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idIscrizione`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella palestra.iscrizioni: ~20 rows (circa)
/*!40000 ALTER TABLE `iscrizioni` DISABLE KEYS */;
INSERT INTO `iscrizioni` (`idIscrizione`, `idCorso`, `username`) VALUES
	(1, 'yg', 'luca'),
	(2, 'kf', 'marco'),
	(3, 'yga', 'luca'),
	(4, 'kf', 'luca');	
	
/*!40000 ALTER TABLE `iscrizioni` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
