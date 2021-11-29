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
1. Selecciona la base de datos de destino donde quieres importar tu base de datos.
2. Haz clic sobre "Importar" en la botonera superior.
3. Busca el archivo en tu PC .SQL que quieres importar.
4. Haz clic en el botón "Continuar" del pie de página para realizar la importación.


## Importación de Flujos

## Integrantes

- Céspedes Fuentes, Renato
- Hermoza Loayza, Miguel
- Torres Rodríguez, Jaime
- Vicente Castro, Renzo

