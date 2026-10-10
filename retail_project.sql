CREATE TABLE clientes (
	id_cliente SERIAL PRIMARY KEY,
	nombre VARCHAR(70) NOT NULL,
	edad INT NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT chk_mayor_edad CHECK (edad >= 16)
);

CREATE TABLE productos (
	id_producto SERIAL PRIMARY KEY,
	precio DECIMAL(10,2) NOT NULL,
	stock INT NOT NULL,
	CONSTRAINT chk_precio_positivo CHECK (precio > 0),
	CONSTRAINT chk_stock_positivo CHECK (stock >= 0)
);

CREATE TABLE ventas (
	id_venta SERIAL PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_producto INT NOT NULL,
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

BEGIN;

INSERT INTO clientes (nombre, edad, email) VALUES 
	('Valentina', 16, 'valentina@email.com'),
	('Tomas', 25, 'tomas@email.com'),
	('Agostina', 20, 'agostina@email.com'),
	('Andrea', 59, 'andrea@email.com'),
	('Alvaro', 61, 'alvaro@email.com');

INSERT INTO productos (precio, stock) VALUES
	(10.00, 5),
	(7.00, 10),
	(5.00, 15),
	(3.00, 20),
	(1.00, 25);

INSERT INTO ventas (id_cliente, id_producto) VALUES
	(2, 3),
	(1, 2),
	(3, 1),
	(4, 5),
	(5, 4);

COMMIT;


UPDATE productos
SET precio = precio * 1.10
WHERE precio < 8.00;

DELETE FROM ventas
WHERE id_cliente = 1;

DELETE FROM clientes
WHERE id_cliente = 1;

