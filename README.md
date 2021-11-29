# Practica de Internet de las Cosas
En este proyecto se instalará y configurará lo propuesto en el Capítulo 7 *Building the Critical Components* del libro **Build Your Own IoT Platform**.
## Requerimientos
- Docker

## Instalación

Los servicios a utilizarse se configurarón en un archivo [docker](docker-compose.yml), donde contiene:

| SERVICIO| VERSIÓN|
| ----- | ---- |
| node-red | latest|
| mosquitto| 1.6|
| mysql| latest|
| phpmyadmin| latest|

Luego se ejecuta el siguiente comando para la instalación de los servicios:
```bash
docker-compose up
```

## Importación de la Base de datos
Antes de realizar la importación del [archivo](base_de_datos/tSeriesDB.sql), lo primero es la creación de la base de datos en phpmyadmin. para ello se ingresa al enlace http://localhost:8080/phpmyadmin/, seguido se hace click en la pestaña de **Bases de datos**. Lo último es colocarle el nombre de **tSeriesDB**, seleccionar la codificación de **utf8_general_ci** y click en **Crear**.

Ya teniendo la Base de Datos, lo siguiente es la importación para ello se sigue el siguiente proceso:
1. Selecciona la base de datos **tSeriesDB** .
2. Luego click en **Importar** se encuentra en la pestaña superior.
3. Busca el archivo [tSeriesDB.sql](base_de_datos/tSeriesDB.sql).
4. Por último, se hace click en el botón "Continuar" encontrado en el pie de página.

En el siguiente [enlace](https://help.wnpower.com/hc/es/articles/360043459551-Importar-tu-base-de-datos-MySQL-desde-un-archivo-SQL-en-phpMyAdmin) se encuentra este proceso con imagenes de referencia.

## Importación de Flujos

## Integrantes

- Céspedes Fuentes, Renato
- Hermoza Loayza, Miguel
- Torres Rodríguez, Jaime
- Vicente Castro, Renzo

