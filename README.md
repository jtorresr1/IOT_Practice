# Practica de Internet de las Cosas
En este proyecto se instalará y configurará lo propuesto en el Capítulo 9 *Creating a REST Interface* del libro **Build Your Own IoT Platform**.
## Requerimientos
- Docker versión <= 19
- Docker Compose versión <= 1.28

## Instalación

Los servicios a utilizarse se configurarón en un archivo [docker](docker-compose.yml), donde:

| SERVICIO| VERSIÓN|
| ----- | ---- |
| node-red | latest|
| mosquitto| 1.6|
| mysql| latest|
| phpmyadmin| latest|

Para la creación de la red (indicada en el archivo [docker](docker-compose.yml)) se utilizado el comando:
```bash
docker network create red_local1
```

Luego se ejecuta el siguiente comando para la instalación y el levantamiento de los servicios:
```bash
docker-compose up
```

## Importación de la Base de datos
Se realiza la importación del [archivo](base_de_datos/tSeriesDB.sql), el cual contiene la base de datos. Pero antes se explicara su creación, lo primero es la creación de la base de datos en phpmyadmin. para ello se ingresa al enlace http://localhost:8080/phpmyadmin/, seguido se hace click en la pestaña de **Bases de datos**. Lo último es colocarle el nombre de **tSeriesDB**, seleccionar la codificación de **utf8_general_ci** y click en **Crear**. Después se procede a crear la tabla que tendra el nombre de thingData, la cual es usada en este caso y tendra una cierta cantidad de columnas.

En el caso de la importación de la base de datos se procede a hacer lo siguientes pasos:
1. Selecciona la base de datos **tSeriesDB** .
2. Luego click en **Importar** se encuentra en la pestaña superior.
3. Busca el archivo [tSeriesDB.sql](base_de_datos/tSeriesDB.sql).
4. Por último, se hace click en el botón "Continuar" encontrado en el pie de página.

En el siguiente [enlace](https://help.wnpower.com/hc/es/articles/360043459551-Importar-tu-base-de-datos-MySQL-desde-un-archivo-SQL-en-phpMyAdmin) se encuentra este proceso con imagenes de referencia.

Además para acceder a la base de datos, se crea un usuario especial y se le asigno una contraseña.

## Instalación de nodos requeridos en Node-RED

La instalación predeterminada de Node-RED no tiene un nodo para acceder a MySQL. Por lo tanto, se agrega este nodo usando el administrador de paleta.

1. Abré la interfaz **Node-RED** en el navegador.
2. Abré la **User Settings**.
3. Selecciona la opción **Manage Palette** en el menú que aparece. 
4. Selecciona el apartado **Install** dentro de **Manage Palette** y se escribe **MySQL** para enumerar los nodos disponibles. 
5. Selecciona e instala *node-red-node-MySQL*.

## Importación de Flujos
Los flujos se encuentran en  formato JSON, en la carpeta [flows_Cap9](flows_Cap9).
Para la importación solo se hace click en el icono de opciones(esquina superior derecha), luego en **import**. Seguido se agrega el archivo json a importar y se hace selección de nuevo diagrama. Este proceso se repite para los demas archivos json.

## Testing
* Para la prueba de [Data_access_API.json](flows_Cap9/Data_access_API.json), se usa la siguiente estructura de comando:

  ```bash
  curl -X GET "http://localhost:1880/get/topicLike/my*/payloadLike/*/last/5"
  ```
  Un ejemplo de este comando con la [BD](base_de_datos/tSeriesDB.sql) sería:
  ```bash
  curl -X GET "http://127.0.0.1:1880/get/topicLike/timestamp/payloadLike/*/last/5"
  ```
  Donde devolveria los últimos 5 registros del tópico *timestamp*
  ```[{"id":22,"topic":"timestamp","payload":"1639353664853","timestamp":"1639353664.855"},{"id":21,"topic":"timestamp","payload":"1639353649841","timestamp":"1639353649.843"},{"id":20,"topic":"timestamp","payload":"1639353634841","timestamp":"1639353634.843"},{"id":19,"topic":"timestamp","payload":"1639353619829","timestamp":"1639353619.832"},{"id":18,"topic":"timestamp","payload":"1639353604821","timestamp":"1639353604.824"}] ```
  
* Para la prueba de [Time_Based_Filters.json](flows_Cap9/Time_Based_Filters.json) se puede consultar de tres maneras distintas:

  ```bash
  curl -X GET "http://localhost:1880/get/mytopic/before/1543717154.899/last/5"
  curl -X GET "http://localhost:1880/get/mytopic/after/1543717154.899/last/5"
  curl -X GET "http://localhost:1880/get/mytopic/during/1543717154.899/154371790/last/5"
  ```
  Donde:
    - El primer comando es para consultar por los últimos 5 registros que tengan un *timestamp* menor a *1543717154.899*.
    - El segundo comando es para consultar por los últimos 5 registros que tengan un *timestamp* mayor a *1543717154.899*.
    - Por último, el tercer comando es para consultar por los últimos 5 registros que tengan un *timestamp* entre *1543717154.899* y *154371790*.
  
   Un ejemplo utilizado la [BD](base_de_datos/tSeriesDB.sql) sería:
  ```bash
  curl -X GET "http://127.0.0.1:1880/get/timestamp/before/1639354715/last/5"
  ```
  Devolviendo:
  ```[{"id":22,"topic":"timestamp","payload":"1639353664853","timestamp":"1639353664.855"},{"id":21,"topic":"timestamp","payload":"1639353649841","timestamp":"1639353649.843"},{"id":20,"topic":"timestamp","payload":"1639353634841","timestamp":"1639353634.843"},{"id":19,"topic":"timestamp","payload":"1639353619829","timestamp":"1639353619.832"},{"id":18,"topic":"timestamp","payload":"1639353604821","timestamp":"1639353604.824"}]```

* Para la prueba de [Data_deletion_APIS.json](flows_Cap9/Data_deletion_APIS.json) se puede trabajar de cuatro maneras distintas:

  ```bash
    curl -X GET "http://127.0.0.1:1880/delete/mytopic/id/22"
    curl -X GET "http://127.0.0.1:1880/delete/mytopic"
    curl -X GET "http://127.0.0.1:1880/delete/mytopic/last/5"
    curl -X GET "http://127.0.0.1:1880/delete/mytopic/first/5"
  ```
  
  Donde:
    - El primer comando es para cambiar el estado a *deleted = 1* en el registro con id *22* y que este en el tópico indicado.
    - El segundo comando es para cambiar el estado a *deleted = 1* a todos los registros del tópico indicado.
    - El tercer comando es para cambiar el estado a *deleted = 1* de los últimos 5 registros del tópico indicado.
    - Por último, el cuarto comando es para cambiar el estado a *deleted = 1* de los primeros 5 registros del tópico indicado.
  
   Un ejemplo utilizado la [BD](base_de_datos/tSeriesDB.sql) sería:
  ```bash
  curl -X GET "http://127.0.0.1:1880/delete/timestamp/id/19"
  ```
  Devolviendo:
  ```{"found":1,"changed":1}```
  Indicando que fue encontrado y modificado. Esto puede ser apreciado si se vuelve a consultar por la existencia de este registro (no aparecerá) mediante comandos *curl*, pero si se podrá visualizar el registro desde la [BD](base_de_datos/tSeriesDB.sql).

* Para las prueba de [Removing_data_records.json](flows_Cap9/Removing_data_records.json) se puede trabajar de cuatro maneras distintas:

  ```bash
    curl -X GET "http://127.0.0.1:1880/purge/mytopic/id/22"
    curl -X GET "http://127.0.0.1:1880/purge/mytopic"
    curl -X GET "http://127.0.0.1:1880/purge/mytopic/last/5"
    curl -X GET "http://127.0.0.1:1880/purge/mytopic/first/5"
  ```
  
  Donde:
    - El primer comando elimina el registro con id *22* y que este en el tópico indicado.
    - El segundo comando elimina todos los registros del tópico indicado.
    - El tercer comando elimina los últimos 5 registros del tópico indicado.
    - Por último, el cuarto comando elimina los primeros 5 registros del tópico indicado.
  
   Un ejemplo utilizado la [BD](base_de_datos/tSeriesDB.sql) sería:
  ```bash
  curl -X GET "http://127.0.0.1:1880/purge/timestamp/id/19"
  ```
  Devolviendo:
  ```{"found":1,"changed":0}```
  Indicando que fue encontrado. A diferencia del comando con *delete*, ahora ya no aparece ni en la [BD](base_de_datos/tSeriesDB.sql) debido a que eliminado.

## Integrantes

- Hermoza Loayza, Miguel
- Torres Rodríguez, Jaime

