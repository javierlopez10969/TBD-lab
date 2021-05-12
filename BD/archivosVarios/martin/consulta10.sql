SELECT public.edificio_estacion.nombre, public.empleado.tipo as tipo_empleo, public.sueldo.monto, public.comuna.nombre as comuna_del_empleado 
FROM public.comuna, public.edificio_estacion, public.empleado, public.sueldo
WHERE public.comuna.id_comuna = public.empleado.id_comuna AND public.edificio_estacion.id_edificio = public.empleado.id_edificio AND public.empleado.id_sueldo = public.sueldo.id_sueldo
ORDER by public.edificio_estacion.nombre DESC, public.empleado.tipo DESC;
