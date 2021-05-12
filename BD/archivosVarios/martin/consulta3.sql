SELECT public.edificio_estacion.id_edificio, public.empleado.rut_empleado, MAX(public.sueldo.monto)
FROM public.sueldo, public.empleado, public.edificio_estacion
WHERE public.edificio_estacion.id_edificio = public.empleado.id_edificio AND public.sueldo.id_sueldo = public.empleado.id_sueldo AND public.sueldo.monto IN (SELECT MAX(public.sueldo.monto)
FROM public.sueldo, public.empleado, public.edificio_estacion
WHERE public.edificio_estacion.id_edificio = public.empleado.id_edificio AND public.sueldo.id_sueldo = public.empleado.id_sueldo
GROUP by public.edificio_estacion.id_edificio)
GROUP by public.edificio_estacion.id_edificio, public.empleado.rut_empleado;



