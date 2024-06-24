# soltec-odoo
Imagen gestión Odoo community en el marco del programa SolTec de Mueve para la promoción de uso de software libre de gestión para organizaciones sociales y de la economía popular


## Descarga

> `git clone --recursive -b 16.0 https://github.com/Mueve-TEC/soltec-odoo.git`

> `cd soltec-odoo`

La opción --recursive es para que traiga los submódulos

## Instrucciones para la generación de la imagen

Se debe hacer uso del script `build.sh`. Es necesario adaptar las variables `IMAGENAME` Y `IMAGEVERSION` según el nombre y versión que se desee usar.

Una vez q se ejecuta el mismo:

> `./build.sh`

se producirá lo siguiente:
* Se creará el directorio `modules_from_github` y se colocarán dentro del mismo los módulos de los distintos repositorios github.
* Se ejecutará el comando `docker build` para la construcción de la imagen en base a las directivas contenidas en el `Dockerfile`

Llegado a este punto, estará generada la imagen y lista para su uso


## Para despliegue local para testing


Se debe ingresar al directorio `testing`

> `cd testing/`

Una vez allí, procedemos a revisar los archivos `deploy.sh` y `docker-compose.yml` para constatar que la imagen referenciada sea la correcta. Finalmente, ejecutamos el script de despliegue

> `./deploy.sh`

Y ello levantará un stack con una instancia de odoo + una instancia de postgres
