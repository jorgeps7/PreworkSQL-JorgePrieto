/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/

CREATE DATABASE "MiBaseDeDatos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/

CREATE TABLE Usuarios(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  edad INT
)

/* 3. Inserta dos registros en la tabla "Usuarios".*/

INSERT INTO public.usuarios(nombre,edad)
VALUES('Jorge', 30), ('Patricia', 28)

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */

UPDATE public.usuarios
SET edad = 29
WHERE id = 2

/* 5. Elimina un usuario de la tabla "Usuarios". */

DELETE FROM public.usuarios
WHERE id = 2

/* 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto). */

CREATE TABLE Ciudades(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	pais VARCHAR(255) NOT NULL
)

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */

INSERT INTO public.ciudades(nombre,pais)
VALUES ('Madrid', 'España'),('Barcelona', 'España'),('Sevilla', 'España'),
('Roma', 'Italia'),('Milán', 'Italia'),('Florencia', 'Italia')

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades". */ 

ALTER TABLE public.usuarios
ADD COLUMN ciudades_id INT

UPDATE public.usuarios
SET ciudades_id = 0
WHERE ciudades_id IS NULL

ALTER TABLE public.usuarios
ALTER COLUMN ciudades_id SET NOT NULL

ALTER TABLE public.usuarios
UPDATE public.usuarios
SET ciudades_id = 1
WHERE id = 1

ALTER TABLE public.usuarios
ADD CONSTRAINT FK_Ciudades_usuarios FOREIGN KEY (ciudades_id) REFERENCES ciudades(id)

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN). */

SELECT * FROM public.usuarios
LEFT JOIN public.ciudades
ON public.usuarios.ciudades_id = public.ciudades.id

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN). */

SELECT * FROM public.usuarios
LEFT JOIN public.ciudades
ON public.usuarios.ciudades_id = public.ciudades.id