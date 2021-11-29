# Practica de Internet de las Cosas
En este proyecto se instalará y configurará lo propuesto en el Capítulo 7 *Building the Critical Components* del libro **Build Your Own IoT Platform**.
## Requerimientos
- Docker

## Instalación

Para la instalación de servicios se creó un archivo [docker](docker-compose.yml), donde contiene:

| SERVICIO| VERSIÓN|
| node-red | latest|
| mosquitto| 1.6|
| mysql| latest|
| phpmyadmin| latest|


```bash
docker-compose up
```



