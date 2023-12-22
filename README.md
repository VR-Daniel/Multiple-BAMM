# Multiple BAMM

**[ESPAÑOL]**

Este es un script de R para automatizar la tarea de correr múltiples análisis BAMM sin tener que modificar manualmente los parámetros. En principio, este ejemplo funciona para un único grupo con n árboles, pero con pequeñas modificaciones (CTRL + C y CTRL + V) se puede hacer que funcione con múltiples grupos a la vez, o particionar los n árboles en subgrupos para que el análisis consuma menos tiempo (aunque más recursos).

El script está diseñado para correrse sobre una terminal de Linux, no importa si esta es una distribución oficial, un subsistema, o una máquina virtual. Para los usuarios de Windows, pueden descargar el subsistema de Ubuntu directamente desde la tienda de aplicaciones. Sin embargo, debido a que los análisis BAMM son computacionalmente demandantes, lo ideal sería ejecutar el código directamente en un servidor.

Adicionalmente, se incluye un conjunto de datos de ejemplo en la carpeta llamada «Amphibians». Allí se encuentra un archivo con 100 árboles filogenéticos para anfibios, obtenidos desde ([VertLife]( https://vertlife.org)). Además, está una plantilla base con los parámetros por defecto a modificar para el BAMM. Todos los archivos aquí provistos son de libre acceso y uso, siempre y cuando se respete la autoría de sus respectivos autores.

**[ENGLISH]**

This is a script to automate the task of running multiple BAMM analyses without manually modifying the parameters. Initially, this example works for a single group with n trees, but with small modifications (CTRL + C and CTRL + V), you can make it work with multiple groups at once or partition the n trees into subgroups to make the analysis consume less time (though more resources).

The script is designed to run on a Linux terminal, regardless of whether it is an official distribution, a subsystem, or a virtual machine. For Windows users, you can download the Ubuntu subsystem directly from the app store. However, because BAMM analyses are computationally demanding, it is ideal to run the code directly on a server.

Additionally, a sample dataset is included in the folder named "Amphibians." There is a file with 100 phylogenetic trees for amphibians, obtained from [VertLife](https://vertlife.org). Also included is a base template with default parameters to be modified for BAMM. All files provided here are freely accessible and usable, as long as the authorship of their respective authors is respected.

## Autor
* Juan D. Vásquez-Restrepo

## Licencia

Esta obra está bajo una licencia <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons BY-NC-SA 4.0 Internacional</a>.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="License Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>