# TBD-lab Entrega 1
Entrega 1 de TBD realziada por el grupo 6.

El proyecto se divide en 3 carpetas correspondientes a las 3 partes de la aplicación : 
* Cliente (Carpeta Vista desarrollado con Vue.js)
* Serivicio Res con Spring (Backend API)
* Base de Datos (PostgreSQL)
# Vista :sunglasses:
<p align="center"><a target="_blank"><img src="https://vuejs.org/images/logo.svg" width="200"></a></p>

### Requisitos

* Npm
* Nodejs

Para levantar la vista usted tendrá que ubicarse en la carpeta llamada vista.

## Instalación de proyecto
### `npm install`
### Compilar y ejecutar la vista en el puerto local 8080
### `npm run serve`

# Backend : Base de datos POSTGRESQL	:cold_face:
<p align="center"><a target="_blank"><img src="https://programacion.net/files/article/20151129021117_postgresql-logo.png" width="400"></a></p>

### Requisitos
* PostgreSQL

Para generar la base de datos con la que opera la aplicación, usted deberá ubicarse en la carpeta BD, una vez dentro de esa carpeta
abrá una terminal o consola en esa carpeta y ejecute la consola de PostgresSQL

## Windows

Asegurese de tener configurada sus variables de entorno para ejecutar psql en cualquier lugar de su computador.

### `psql -U postgres`

## Linux 

### `sudo -u postgres psql`

## Ejecución de los scripts solicitados

Una vez abierta la consola de postgres ejecute el siguiente comando para crear la base de datos junto a sus tablas.

### `\i dbCreate.sql`

Ya creada la base de datos procedá a cargar datos dump mediante:
### `\i loadData.sql`

# Backend : Base de datos MONGODB


### Requisitos
* MongoDB
<p align="center"><a target="_blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/MongoDB_Logo.svg/1280px-MongoDB_Logo.svg.png" width="400"></a></p>
Para generar la base de datos con la que opera la aplicación, usted deberá ubicarse en la carpeta BD,luego en la carpeta MONGO una vez dentro de esa carpeta
abrá una terminal o consola en esa carpeta y ejecute :

## Windows, Linux o MAC

Asegurese de tener configurada sus variables de entorno para ejecutar mongo en cualquier lugar de su computador.

### `mongo < database.js`

# Backend : Servicio Rest 	:exploding_head:
<p align="center"><a target="_blank"><img src="https://cleventy.com/wp-content/uploads/2020/05/spring-boot.png" width="400"></a></p>

### Requisitos
* Java 8 o superior 
* Gradle 5.x o superior (opcional)
* En la línea de comandos, dirigirse a la carpeta del proyecto backend
* Iniciar proyecto Gradle con el comando `gradlew` en Windows y con `/.gradlew` Linux/ Mac
Configurar credenciales del usuario postgres en `application.resources`

* Ejecutar proyecto de desarrollo con
## Windows
### `gradlew bootRun`
## Linux o MAC
### `./gradlew bootRun`
