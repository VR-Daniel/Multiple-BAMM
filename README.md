# Multiple BAMM

**[ESPAÑOL]**

Este es un script en R diseñado para automatizar la ejecución de múltiples análisis BAMM sin necesidad de modificar manualmente los parámetros del archivo control. En principio, este ejemplo funciona para un único grupo con n árboles filogenéticos, pero con pequeñas modificaciones (CTRL + C y CTRL + V) puede adaptarse para manejar múltiples grupos simultáneamente o dividir los n árboles en subgrupos, lo que permite reducir el tiempo de análisis (a costa de utilizar más recursos).

El script está diseñado para ejecutarse en una terminal de Linux, ya sea en una distribución oficial, un subsistema o una máquina virtual. Para los usuarios de Windows, es posible descargar el subsistema de Ubuntu directamente desde la tienda de aplicaciones. Sin embargo, dado que los análisis con BAMM son computacionalmente exigentes, lo ideal es ejecutarlos en un servidor.

Adicionalmente, se proporciona un conjunto de datos de ejemplo en la carpeta «Amphibians». Esta carpeta incluye un archivo con 100 árboles filogenéticos para anfibios, submuestreados desde ([VertLife]( https://vertlife.org)), así como una plantilla base con los parámetros por defecto a modificar para poder correr el BAMM. Todos los archivos suministrados son de libre acceso y uso, siempre que se respete la autoría correspondiente.

**[ENGLISH]**

This is an R script designed to automate the execution of multiple BAMM analyses without the need to manually modify the control file parameters. Initially, this example works for a single group with n phylogenetic trees, but with minor adjustments (CTRL + C and CTRL + V), it can be adapted to handle multiple groups simultaneously or divide the n trees into subgroups, allowing for shorter analysis times (at the cost of increased resource usage).

The script is designed to run on a Linux terminal, whether it’s a native distribution, a subsystem, or a virtual machine. For Windows users, the Ubuntu subsystem can be downloaded directly from the app store. However, since BAMM analyses are computationally demanding, the ideal setup is to run the script on a server.

Additionally, an example dataset is provided in the folder named "Amphibians." This folder includes a file with 100 phylogenetic trees for amphibians, subsampled from ([VertLife]( https://vertlife.org)), as well as a base template with the default parameters to be modified for running BAMM. All the files provided are freely accessible and usable, as long as proper credit is given to their authors.

## Autor
* Juan D. Vásquez-Restrepo

## Licencia

Esta obra está bajo una licencia <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons BY-NC-SA 4.0 Internacional</a>.

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="License Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>