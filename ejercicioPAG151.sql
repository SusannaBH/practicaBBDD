-- DROP SCHEMA IF EXISTS java_bcn_4;
CREATE SCHEMA IF NOT EXISTS java_bcn_4;
USE java_bcn_4;

-- Creamos las tablas
CREATE TABLE IF NOT EXISTS salesman (
	salesman_id INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30),
	city VARCHAR(15),
	commission FLOAT(5.2)
);
-- SELECT * FROM salesman;

CREATE TABLE IF NOT EXISTS customer (
	customer_id INTEGER UNSIGNED PRIMARY KEY,
	cust_name VARCHAR(30),
	city VARCHAR(15),
	grade NUMERIC(3)
);
-- SELECT * FROM customer;

CREATE TABLE IF NOT EXISTS orders (
	ord_no INTEGER UNSIGNED AUTO_INCREMENT,
	purch_amt FLOAT(8.2),
	ord_date DATE,
	customer_id_tablaCusto INTEGER UNSIGNED,
    salesman_id_tablaSales INTEGER UNSIGNED,
    PRIMARY KEY(ord_no, customer_id_tablaCusto, salesman_id_tablaSales),
	FOREIGN KEY (customer_id_tablaCusto) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id_tablaSales) REFERENCES salesman(salesman_id)
);
-- SELECT * FROM orders;

-- Inserciones tabla salesman
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (1001, 'John Doe', 'New York', 0.24),
(1002, 'Jane Smith', 'Los Angeles', 0.12), (1003, 'Michael Johnson', 'Chicago', 0.18), 
(1004, 'Emily Williams', 'Houston', 0.14), (1005, 'William Brown', 'Phoenix', 0.16), 
(1006, 'Emma Jones', 'Philadelphia', 0.13), (1007, 'Matthew Garcia', 'San Antonio', 0.17), 
(1008, 'Olivia Martinez', 'San Diego', 0.11), (1009, 'Ethan Robinson', 'Dallas', 0.19), 
(1010, 'Ava Lee', 'San Jose', 0.1123);
-- Inserciones tabla customer
INSERT INTO customer (customer_id, cust_name, city, grade) VALUES (201, 'John Doe', 'New York', 1),
(202, 'Jane Smith', 'Los Angeles', 2), (203, 'Michael Johnson', 'Chicago', 1),
(204, 'Emily Williams', 'Houston', 3), (205, 'William Brown', 'Phoenix', 2),
(206, 'Emma Jones', 'Philadelphia', 1), (207, 'Matthew Garcia', 'San Antonio', 2),
(208, 'Olivia Martinez', 'San Diego', 3), (209, 'Ethan Robinson', 'Dallas', 1), 
(210, 'Ava Lee', 'San Jose', 2);
-- Inserciones tabla orders
INSERT INTO orders (purch_amt, ord_date, customer_id_tablaCusto, salesman_id_tablaSales) VALUES (1500.25, '2023-10-28', 201, 1001),
(2000.50, '2023-10-29', 202, 1002), (1000.75, '2023-10-30', 203, 1003), (2500.30, '2023-10-31', 204, 1004),
(1800.20, '2023-11-01', 205, 1005), (3000.45, '2023-11-02', 206, 1006), (1200.10, '2023-11-03', 207, 1007),
(2200.70, '2023-11-04', 208, 1008), (1700.35, '2023-11-05', 209, 1009), (1900.40, '2023-11-06', 210, 1010);


-- Cuenta el total de registros de la tabla ORDERS
SELECT COUNT(*) FROM java_bcn_4.orders;

-- Muestra los CUSTOMER que tienen nombres distintos, que no se repiten
SELECT DISTINCT * FROM java_bcn_4.customer;

-- Ordena los SALESMAN en funcion de las ventas
SELECT * FROM java_bcn_4.customer
LEFT JOIN java_bcn_4.orders 
	ON salesman_id_tablaSales = salesman_id
GROUP BY salesman_id, name, city, commission, purch_amt
ORDER BY ventas DESC;

-- Muestra los 5 primeros CUSTOMER ordenados por id
SELECT * FROM java_bcn_4.customer ORDER BY customer_id ASC LIMIT 5;

-- Muestra el registro de venta MAYOR
SELECT MAX(purch_amt) FROM java_bcn_4.orders;

-- Muestra el registro de venta MENOR
SELECT MIN(purch_amt) FROM java_bcn_4.orders;
