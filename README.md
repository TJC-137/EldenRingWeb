### Instrucciones para descargar el proyecto

<!-- En la página 79 de la memoria de mi proyecto - 6.3 Guía de Instalación hay un tutorial 
detallando y paso por paso, y con la ayuda de imágenes este proceso. -->

Voy a detallar aquí instrucciones para descargar y desplegar el proyecto en local.

-----------------------------------------------------------------------------------------

<!-- Asegurarse de crear la base de datos, llamarla 'elden_ring_db' e importar el .sql -->

- git clone https://github.com/TJC-137/EldenRingWeb.git

- cd EldenRingWeb

-----------------------------------------------------------------------------------------

### Backend

- cd backend 

<!-- Instalar composer -->

- composer install

<!-- Verificar versión de php -->

- php -v

<!-- Copiar el .env de ejemplo -->

- cp .env.example .env

<!-- 
Entrar en el .env que se acaba de crear y modificar las variables de entorno 
(aparecerán comentadas) 
-->

<!--
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=elden_ring_db
DB_USERNAME=root
DB_PASSWORD= 
-->

<!-- Una vez hecho esto, generar las claves -->

- php artisan key:generate

<!-- Ejecutar servidor -->

- php artisan serve

-------------------------------------------------------------------------------------

### Frontend

<!-- Abrir otro terminal -->

- cd frontend

<!-- Ahora usar 'npm i' o 'npm install' -->

- npm i

<!-- Ejecutar servidor -->
<!-- Ahora usar 'npm run dev' o 'npm start' -->

- npm run dev

-------------------------------------------------------------------------------------

<!-- Dirigete a tu localhost -->

* Si hay algún problema con la base de datos o el import, se pueden usar los siguientes comandos en /backend

- php artisan migrate <!--  Migrará la información de las tablas -->

- php artisan migrate:fresh <!--  Migrará y reseteará la información de las tablas -->