# TBD-lab Entrega 1
Entrega 1 de TBD realziada por el grupo 6
# Vista

## Instalación de proyecto
```
npm install
```

### Compilar y ejecutar la vista en un puerto local
```
npm run serve
```

# Backend : Base de datos

En primer lugar usted deberá levantar la base de datos de la aplciación.

## Windows

Asegurese de tener configurada sus variables de entorno para ejecutar psql en cualquier lugar de su computador.

### `psql -U postgres`

## Linux 

### `sudo -u postgres psql`

## Ejecución de los scripts solicitados

Una vez abierta la consola de postgres ejecute el siguiente comando para crear la base de datos junto a sus tablas.

### `\i basedate.sql`

# Backend : Servicio Rest

### Requisitos
* Java 8 o superior 
* Gradle 5.x o superior (opcional)
* 
* En la línea de comandos, dirigirse a la carpeta del proyecto backend
* Iniciar proyecto Gradle con el comando `gradlew` en Windows y con `/.gradlew` Linux/ Mac
Configurar URL de conexión en `application.resources`

* Ejecutar proyecto de desarrollo con `gradlew bootRun` 

### `gradlew bootRun`
* O
### `./gradlew bootRun`




