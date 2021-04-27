SELECT public.comuna.nombre, count(public.cliente.id_cliente)
FROM public.comuna, public.cliente
WHERE public.comuna.id_comuna = public.cliente.id_comuna
GROUP by public.comuna.nombre;