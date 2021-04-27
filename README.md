# TBD-lab
Laboratorio de TBD hecho por el grupo 6

## Comandos para ejecutar
Para ejcutar estos scripts, abra una consola de postgres en la carpeta del código.

## Windows

Asegurese de tener configurada sus variables de entorno para ejecutar psql en cualquier lugar de su computador.

### `psql -U postgres`

## Linux

### `sudo -u postgres psql`

## Ejecución de los scripts solicitados


Una vez abierta la consola de postgres ejecute el siguiente comando para crear la base de datos junto a sus tablas.

### `\i dbCreate.sql`

Una vez creada la base de datos y estar dentro de ella poble la base de datos con el script : 

### `\i loadData.sql`

Una vez cargado los datos dummys, puede hacer las consultas requeridas con el script de  : 

### `\i runStatements.sql`

