-- CREATE DATABASE java_bcn_4; 				-- Crear la base de datos
DROP DATABASE IF EXISTS java_bcn_4; 		-- Borrar la base de datos SI EXISTE
CREATE DATABASE IF NOT EXISTS java_bcn_4; 	-- Crear la base de datos SI NO EXISTE
USE java_bcn_4; 							-- Usar la base de datos

-- CREAR TABLA EN DIAGRAMA Y DESPUÉS HACER FORWARD (PAG.66)
CREATE TABLE IF NOT EXISTS `java_bcn_4`.`Tabla1` (
  `fecha` DATE NULL,
  `texto` LONGTEXT NULL,
  `numeroEntero` INT NULL,
  `numeroDecimal` FLOAT NULL);

-- CREAR TABLAS (PAG.69)
CREATE TABLE IF NOT EXISTS Genre(
	idGenre INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Album(
	idAlbum INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    albumName VARCHAR(255),
    dataReleased DATE
);

CREATE TABLE IF NOT EXISTS Artist(
	idArtist INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    artistName VARCHAR(255)
);

-- CREAR 10 REGISTROS EN CADA TABLA CON INSERT (PAG.74)
INSERT INTO Genre(genre) VALUES ('Pop'),('Rock'),('Hip-hop'),('R&B'),
('Electronica'),('Reggae'),('Jazz'),('Country'),('Clasica'),('Metal');
INSERT INTO Album(albumName,dataReleased) VALUES ('Thriller', '1982-11-30'),
('The Dark Side of the Moon', '1973-03-01'),('Illmatic', '1994-04-19'),
('The Miseducation of Lauryn Hill', '1998-08-25'),('Random Access Memories', '2013-05-17'),
('Legend', '1984-05-08'),('Kind of Blue', '1959-08-17'),('Red Headed Stranger', '1975-05-01'),
('The Four Seasons', '1725-01-01'),('Master of Puppets', '1986-03-03');
INSERT INTO Artist(artistName) VALUES ('Michael Jackson'),('Pink Floyd'),
('Nas'),('Lauryn Hill'),('Daft Punk'),('Bob Marley & The Wailers'),
('Miles Davis'),('Willie Nelson'),('Vivaldi'),('Metallica');

-- SACAR VISTA DE LA TABLA PARA HACER INSERTACIONES MANUALES (PAG.74)
SELECT * FROM java_bcn_4.Genre;
SELECT * FROM java_bcn_4.Album;
SELECT * FROM java_bcn_4.Artist;



