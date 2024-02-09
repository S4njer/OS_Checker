# OS_Checker
Allows to verify the OS of a host with the ICMP protocol
## Descripción del Script

Este script en Bash es un utilitario diseñado para facilitar la identificación de sistemas operativos en una red local a través de la dirección IP proporcionada. Ofrece varias funcionalidades útiles, incluyendo:

- **Comprobación de Sistema Operativo**: Permite verificar el sistema operativo asociado a una dirección IP específica en la red local.
  
- **Visualización de Registros**: Permite mostrar todos los registros de direcciones IP junto con sus sistemas operativos detectados previamente.

- **Eliminación de Registros**: Ofrece la opción de eliminar completamente los registros almacenados de detección de sistemas operativos.

El funcionamiento del script se basa en el uso de la herramienta `ping` para determinar la existencia de una conexión con la dirección IP especificada y, a partir de la respuesta, infiere el tipo de sistema operativo asociado. Los resultados de la detección se registran en un archivo de registro para futuras referencias.

El script proporciona una interfaz de línea de comandos simple con opciones claras y directas, lo que lo hace fácil de usar para usuarios con diversos niveles de experiencia en Bash.

Mediante su diseño modular y eficiente, este script ofrece una forma rápida y sencilla de explorar y gestionar los sistemas operativos dentro de una red local.

![image](https://github.com/S4njer/OS_Checker/assets/125299897/bd70c898-c593-4570-ac18-8bf21e215aaf)

> Basado en el script whichSystem desarrollado por S4vitar
