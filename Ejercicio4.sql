/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos"). */

CREATE TABLE Pedidos(
	id SERIAL PRIMARY KEY,
	id_usuario INT,
	id_producto INT,
	CONSTRAINT FK_usuarios_pedidos FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	CONSTRAINT FK_productos_pedidos FOREIGN KEY (id_producto) REFERENCES productos(id)
)

/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos. */

INSERT INTO public.pedidos(id_usuario,id_producto)
VALUES(1,2),(2,2),(2,4),(2,1),(1,4),(1,1)


/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE). */

SELECT 
	u.nombre,
	p.nombre
FROM public.pedidos e
	LEFT JOIN public.productos p
ON p.id = e.id_producto
	LEFT JOIN public.usuarios u
ON u.id = e.id_usuario
ORDER BY u.nombre

/* 4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN). */

SELECT 
	u.nombre,
	p.nombre
FROM public.pedidos e
	LEFT JOIN public.productos p
ON p.id = e.id_producto
	LEFT JOIN public.usuarios u
ON u.id = e.id_usuario
ORDER BY u.nombre

/* 5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT

UPDATE public.pedidos
SET cantidad = 2
WHERE cantidad IS NULL