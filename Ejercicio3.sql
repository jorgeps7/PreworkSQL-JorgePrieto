/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico). */

CREATE TABLE Productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  precio NUMERIC
)

/* 2. Inserta al menos cinco registros en la tabla "Productos". */ 

INSERT INTO public.productos(nombre,precio)
VALUES('platanos', 1.38),('peras', 1.69),('mandarinas', 1.98),('tomates', 2.23),('naranjas', 1.20)

/* 3. Actualiza el precio de un producto en la tabla "Productos". */

UPDATE public.productos
SET precio = 1.50
WHERE id = 2

/* 4. Elimina un producto de la tabla "Productos". */

DELETE FROM public.productos
WHERE id = 5

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos"). */

CREATE TABLE compras(
	id SERIAL PRIMARY KEY,
	usuario_id INT,
	producto_id INT,
	cantidad INT,
	CONSTRAINT FK_usuarios_compras FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	CONSTRAINT FK_productos_compras FOREIGN KEY (producto_id) REFERENCES productos(id)
)

INSERT INTO public.compras(usuario_id,producto_id,cantidad)
VALUES(1,2,3),(2,2,3),(2,4,3),(2,1,2),(1,4,3),(1,1,6)

SELECT 
	u.nombre,
	p.nombre, 
	p.precio,
	c.cantidad,
	p.precio * c.cantidad AS coste
FROM public.compras c
	INNER JOIN public.productos p
ON p.id = c.producto_id
	INNER JOIN public.usuarios u
ON u.id = c.usuario_id
ORDER BY u.nombre




