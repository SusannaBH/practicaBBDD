-- Usar BBDD que ya hemos creado anteriormente
USE java_bcn_4;


-- CREAR TABLAS
CREATE TABLE IF NOT EXISTS country (
  country_id SMALLINT NOT NULL,
  country VARCHAR(50) NULL,
  last_update TIMESTAMP NULL,
  PRIMARY KEY (country_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS city (
  city_id SMALLINT NOT NULL,
  city VARCHAR(50) NULL,
  last_update TIMESTAMP NULL,
  country_id SMALLINT NOT NULL,
  PRIMARY KEY (city_id),
  INDEX fk_city_country1_idx (country_id ASC) VISIBLE,
  CONSTRAINT fk_city_country1
    FOREIGN KEY (country_id)
    REFERENCES country (country_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS address (
  address_id SMALLINT NOT NULL,
  address VARCHAR(50) NULL,
  address2 VARCHAR(50) NULL,
  district VARCHAR(20) NULL,
  postal_code VARCHAR(10) NULL,
  phone VARCHAR(20) NULL,
  location VARCHAR(20) NULL,
  last_update TIMESTAMP NULL,
  city_id SMALLINT NOT NULL,
  PRIMARY KEY (address_id),
  INDEX fk_address_city_idx (city_id ASC) VISIBLE,
  CONSTRAINT fk_address_city
    FOREIGN KEY (city_id)
    REFERENCES city (city_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- INSERTAR DATOS PARA LA TABLA COUNTRY
INSERT INTO country (country_id, country, last_update) VALUES 
(1, 'USA', NOW()),
(2, 'Canada', NOW()),
(3, 'UK', NOW()),
(4, 'France', NOW()),
(5, 'Germany', NOW()),
(6, 'Australia', NOW()),
(7, 'Japan', NOW()),
(8, 'China', NOW()),
(9, 'Brazil', NOW()),
(10, 'India', NOW()),
(11, 'Italy', NOW()),
(12, 'Spain', NOW()),
(13, 'Mexico', NOW()),
(14, 'South Korea', NOW()),
(15, 'Russia', NOW()),
(16, 'Argentina', NOW()),
(17, 'South Africa', NOW()),
(18, 'Nigeria', NOW()),
(19, 'Saudi Arabia', NOW()),
(20, 'Sweden', NOW());

-- INSERTAR DATOS PARA LA TABLA CITY
INSERT INTO city (city_id, city, last_update, country_id) VALUES 
(1, 'New York', NOW(), 1),
(2, 'Toronto', NOW(), 2),
(3, 'London', NOW(), 3),
(4, 'Paris', NOW(), 4),
(5, 'Berlin', NOW(), 5),
(6, 'Sydney', NOW(), 6),
(7, 'Tokyo', NOW(), 7),
(8, 'Beijing', NOW(), 8),
(9, 'Rio de Janeiro', NOW(), 9),
(10, 'Mumbai', NOW(), 10),
(11, 'Rome', NOW(), 11),
(12, 'Madrid', NOW(), 12),
(13, 'Mexico City', NOW(), 13),
(14, 'Seoul', NOW(), 14),
(15, 'Moscow', NOW(), 15),
(16, 'Buenos Aires', NOW(), 16),
(17, 'Johannesburg', NOW(), 17),
(18, 'Lagos', NOW(), 18),
(19, 'Riyadh', NOW(), 19),
(20, 'Stockholm', NOW(), 20);

-- INSERTAR DATOS PARA LA TABLA ADDRESS
INSERT INTO address (address_id, address, address2, district, postal_code, phone, last_update, city_id) VALUES 
(1, '123 Main St', 'Apt 1', 'Downtown', '12345', '123-456-7890', NOW(), 1),
(2, '456 Maple Ave', 'Suite 5', 'Midtown', '67890', '123-555-7890', NOW(), 2),
(3, '789 Oak St', NULL, 'Central', '45678', '123-777-7890', NOW(), 3),
(4, '321 Elm St', NULL, 'Rive Gauche', '34567', '123-888-7890', NOW(), 4),
(5, '567 Pine St', 'Apt 10', 'Mitte', '56789', '123-999-7890', NOW(), 5),
(6, '234 Cedar St', 'Suite 3', 'CBD', '23456', '123-333-7890', NOW(), 6),
(7, '876 Walnut St', 'Suite 8', 'Chiyoda', '78901', '123-222-7890', NOW(), 7),
(8, '543 Birch St', 'Unit 12', 'Dongcheng', '89012', '123-444-7890', NOW(), 8),
(9, '987 Ash St', 'Apt 20', 'Copacabana', '12343', '123-111-7890', NOW(), 9),
(10, '654 Walnut St', 'Flat 15', 'Bandra', '56787', '123-000-7890', NOW(), 10),
(11, '321 Cedar St', 'Apartment 7', 'Esquilino', '45676', '123-666-7890', NOW(), 11),
(12, '789 Oak St', 'Piso 2', 'Salamanca', '67894', '123-123-7890', NOW(), 12),
(13, '123 Main St', 'Apt 5', 'Zona Rosa', '23456', '123-777-7890', NOW(), 13),
(14, '567 Pine St', 'Unit 18', 'Jongno', '78905', '123-888-7890', NOW(), 14),
(15, '876 Maple Ave', 'Apartment 22', 'Tverskoy', '34562', '123-999-7890', NOW(), 15),
(16, '234 Cedar St', 'Departamento 6', 'San Telmo', '56783', '123-333-7890', NOW(), 16),
(17, '543 Birch St', 'Unit 25', 'Sandton', '12340', '123-222-7890', NOW(), 17),
(18, '789 Oak St', 'Flat 30', 'Lekki', '67899', '123-444-7890', NOW(), 18),
(19, '321 Elm St', 'Riyadh 2', 'Al Olaya', '78903', '123-111-7890', NOW(), 19),
(20, '987 Ash St', 'Lägenhet 35', 'Södermalm', '23459', '123-000-7890', NOW(), 20);


-- REALIZA UNA CONSULTA CON INNER JOIN MOSTRANDO LAS 3 TABLAS
SELECT * FROM city ci
	INNER JOIN country co ON ci.country_id = co.country_id
	INNER JOIN address ad ON ad.city_id = ci.city_id;