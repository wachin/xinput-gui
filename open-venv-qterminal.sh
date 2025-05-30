#!/bin/bash

# Este script abre una nueva ventana de Qterminal, activa un entorno virtual de Python,
# ejecuta un script de Python y luego permite al usuario desactivar el entorno antes de cerrar.

# Abre una nueva ventana de Qterminal y ejecuta los siguientes comandos en ella
qterminal --execute bash -c '
    # Muestra un mensaje indicando que se está activando el entorno virtual
    echo "Activando el entorno virtual..."

    # Activa el entorno virtual de Python
    source venv/bin/activate

    # Confirma que el entorno virtual ha sido activado
    echo "Entorno virtual activado."

    # Anuncia que se va a ejecutar el script de Python
    echo "Ejecutando venv/bin/xinput-gui"

    # Ejecuta el script de Python
    venv/bin/xinput-gui

    # Confirma que el script ha terminado de ejecutarse
    echo "Ejecución de venv/bin/xinput-gui completada."

    # Deja una línea en blanco para mejor legibilidad
    echo ""

    # Explica al usuario sus opciones
    echo "El entorno virtual sigue activo. Para desactivarlo, escribe \"deactivate\" y presiona Enter."
    echo "Para salir sin desactivar, simplemente presiona Enter."
    echo ""

    # Espera la entrada del usuario
    read -p "> " user_input

    # Si el usuario escribe "deactivate", desactiva el entorno virtual
    if [ "$user_input" = "deactivate" ]; then
        deactivate
        echo "Entorno virtual desactivado."
    fi

    # Indica al usuario cómo cerrar la ventana
    echo "Presiona Enter para cerrar esta ventana."
    read
' &
