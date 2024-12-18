#!/bin/bash

# Este script lanza otro archivo de script en un entorno virtual
# utilizando xfce4-terminal.

# Nombre del script a ejecutar
SCRIPT_NAME="xfce4-venv-script.sh"

# Asegúrate de que el script auxiliar existe
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "El script auxiliar $SCRIPT_NAME no existe. Creándolo..."
    cat << 'EOF' > "$SCRIPT_NAME"
#!/bin/bash

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

# Explica al usuario sus opciones
echo "El entorno virtual sigue activo. Para desactivarlo, escribe \"deactivate\" y presiona Enter."
echo "Para salir sin desactivar, simplemente presiona Enter."

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
EOF
    chmod +x "$SCRIPT_NAME"
fi

# Ejecuta el script en xfce4-terminal
xfce4-terminal --hold --title="xinput-gui" -e "./$SCRIPT_NAME"
