DROP VIEW if exists empleados_disponible;

CREATE VIEW empleados_disponible as (SELECT public.edificio_estacion.id_edificio, count(public.empleado.id_empleado) as cantidad
FROM public.edificio_estacion, public.empleado
WHERE public.edificio_estacion.id_edificio = public.empleado.id_edificio 
GROUP by public.edificio_estacion.id_edificio
ORDER by public.edificio_estacion.id_edificio);

SELECT public.edificio_estacion.nombre, empleados_disponible.cantidad as empleados_en_total
FROM empleados_disponible, public.edificio_estacion
WHERE empleados_disponible.id_edificio = public.edificio_estacion.id_edificio AND empleados_disponible.cantidad IN (SELECT MAX(empleados_disponible.cantidad)
FROM empleados_disponible)
GROUP by public.edificio_estacion.nombre, empleados_disponible.cantidad;
