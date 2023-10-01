/* 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto). */ 

CREATE TABLE clientes(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL	
)

/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes". */

INSERT INTO public.clientes (nombre)
VALUES ('John')

/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes". */

UPDATE public.clientes
SET nombre = 'John Doe'
WHERE id = 1

/* 4. Elimina el cliente con id=1 de la tabla "Clientes". */

DELETE FROM public.clientes
WHERE id = 1

/*5. Lee todos los clientes de la tabla "Clientes". */

SELECT * FROM public.clientes

/*6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero). */

CREATE TABLE pedidos(
  id SERIAL PRIMARY KEY,
  cliente_id INT NOT NULL	
)

/* 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos". */

INSERT INTO public.pedidos (cliente_id)
VALUES (1)

/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos". */

UPDATE public.pedidos
SET cliente_id = 2
WHERE id = 1

/* 9. Elimina el pedido con id=1 de la tabla "Pedidos". */

DELETE FROM public.pedidos
WHERE id = 1

/* 10. Lee todos los pedidos de la tabla "Pedidos". */

SELECT * FROM public.pedidos

/* 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto). */

CREATE TABLE productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
)

/* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". */

CREATE TABLE productos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
)

/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". */

UPDATE productos
SET nombre='pantalón'
WHERE id=1

/* 14. Elimina el producto con id=1 de la tabla "Productos". */

DELETE FROM productos
WHERE id=1

/* 15. Lee todos los productos de la tabla "Productos".*/

SELECT * FROM public.productos

/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero). */

CREATE TABLE DetallesPedido(
	pedido_id INT NOT NULL,
	producto_id INT NOT NULL
)

/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido". */

INSERT INTO DetallesPedido(pedido_id,producto_id)
VALUES(1,1)

/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido". */

UPDATE DetallesPedido
SET producto_id = 2
WHERE pedido_id = 1

/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido". */

DELETE FROM DetallesPedido
WHERE pedido_id = 1

/* 20. Lee todos los detalles de pedido de la tabla "DetallesPedido". */

SELECT * FROM public.DetallesPedido

/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join. */

SELECT * FROM public.clientes c
INNER JOIN public.pedidos p
ON p.cliente_id = c.id

/* 22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join. */

SELECT * FROM public.clientes c
LEFT JOIN public.pedidos p
ON p.cliente_id = c.id

/* 23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join. */

SELECT * FROM public.productos r
INNER JOIN public.detallespedido d
ON r.id = d.producto_id

/* 24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join. */

SELECT * FROM public.productos r
LEFT JOIN public.detallespedido d
ON r.id = d.producto_id

/* 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes". */

ALTER TABLE public.clientes
ADD COLUMN telefono VARCHAR(255)

/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero. */

ALTER TABLE public.clientes
ALTER COLUMN telefono INT

/* 27. Elimina la columna "telefono" de la tabla "Clientes". */

ALTER TABLE public.clientes
DROP COLUMN telefono

/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/

ALTER TABLE clientes
RENAME TO usuarios

/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a
"nombre_completo". */

ALTER TABLE usuarios
RENAME COLUMN nombre TO nombre_completo

/* 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios". */

ALTER TABLE usuarios
ADD PRIMARY KEY (id)
