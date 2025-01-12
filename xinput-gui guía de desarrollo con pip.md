# xinput-gui guía de desarrollo con pip

## Cómo instalar xinput-gui en modo editable en pip

El modo **editable** de instalación con `pip` es exactamente lo que necesitas para desarrollar y probar un programa escrito en python, pues puedes ejecutar los cambios que hagas inmediatamente desde la terminal.

### **Qué hace el modo editable (-e)**
Cuando instalas en modo editable con `pip install -e .`:
- Python no copia los archivos del proyecto a una ubicación separada (como lo hace con una instalación normal).
- En su lugar, crea un enlace simbólico desde el entorno Python al directorio del proyecto. Esto significa que cualquier cambio que hagas en los archivos de tu proyecto se reflejará inmediatamente cuando ejecutes el programa.

---

### Cómo instalar tu proyecto en modo editable, en este caso xinput-gui
Lo siguiente ha sido testeado en Debian 12

necesitas las siguientes dependencias:

```
sudo apt install python3 python3-pip python3.*-venv pkg-config \
	libcairo2-dev build-essential pkg-config python3-dev \
	libglib2.0-dev xinput python3-setuptools \
	libgirepository1.0-dev gir1.2-gtk-3.0
``` 

Breve descripción de algunos paquetes:

- `build-essential`: proporciona herramientas necesarias para compilar software en C/C++.
- `pkg-config`: ayuda a gestionar las bibliotecas y sus ubicaciones.
- `python3-dev`: incluye archivos de desarrollo necesarios para compilar extensiones de Python.
- `libglib2.0-dev`: proporciona las bibliotecas de desarrollo para GLib, que es una biblioteca fundamental para muchas aplicaciones de GNOME.
- `libcairo2-dev`: incluye los archivos de desarrollo para Cairo, que es una biblioteca de gráficos.


además les recomiendo leer el siguiente tutorial:  

**pip no me deja instalar paquetes de python en Debian 12 OK.md**  
[https://github.com/wachin/Facilitar-el-Software-Libre/tree/main/Tutoriales/pip/pip%20no%20me%20deja%20instalar%20paquetes%20de%20python%20en%20Debian%2012](https://github.com/wachin/Facilitar-el-Software-Libre/tree/main/Tutoriales/pip/pip%20no%20me%20deja%20instalar%20paquetes%20de%20python%20en%20Debian%2012)


1. Clona el repositorio de xinput-gui

   ```bash
   git clone https://github.com/IvanFon/xinput-gui
   ```

1. **Navega al directorio de tu proyecto**
   pon:

   ```bash
   cd xinput-gui
   ```
   estarás en la raíz del proyecto. Verifica con:

   ```bash
   ls
   ```

   Debes ver archivos como `setup.py`, `README.md`, y el directorio `xinput_gui`.

2. **Crea allí un entorno virtual**
   Para evitar conflictos con otras instalaciones de Python, crea un entorno virtual:

   ```bash
   python3 -m venv venv
   ```
   >**Nota**: Este paso sólo se lo hace la primera vez.

3. **Activa el entorno virtual**
   y actívalo:

   ```
   source venv/bin/activate
   ```

   Esto activará el entorno virtual. Verás algo como `(venv)` al principio de tu línea de terminal. Y cuando revises en tu administrador de archvios habrá una nueva carpeta con ese nombre:
   
```
/xinput-gui/docs
/xinput-gui/venv
/xinput-gui/xinput_gui
/xinput-gui/LICENSE
/xinput-gui/MANIFEST.in
/xinput-gui/README.md
/xinput-gui/setup.cfg
/xinput-gui/setup.py
```

   >**Nota**: Este paso hay que hacerlo cada vez que usted apague y encienda el ordenador y quiera usar el programa.

4. **Instala en modo editable**
   Ejecuta este comando dentro del entorno virtual:

   ```bash
   pip install -e .
   ```

   Esto instalará el proyecto en modo editable. El punto `.` se refiere al directorio actual (la raíz del proyecto).

5. **Prueba ejecutar el programa**
   Ahora puedes ejecutar el programa en el entorno virtual simplemente escribiendo:

   ```bash
   venv/bin/xinput-gui
   ```
   
**Nota:** Recuerda que debes estar en el entorno virtual para poder ejecutarlo.

   Si tienes curiosidad, en el administrador de archivos entra en la nueva carpeta venv y allí entra a la carpeta bin y allí dentro verás al ejecutable xinput-gui y por eso funciona.

**Nota:** Este directorio no está en el `PATH` del sistema de forma predeterminada, por lo que el comando `xinput-gui` no funciona globalmente fuera del entorno virtual.

6. **Activar siempre el entorno virtual para ejecutar xinput-gui**
   Cada vez que quieras usar el programa en modo de desarrollo con pip, activa el entorno virtual abriendo la carpeta del programa pues allí fue creado, y ejecuta, "source venv/bin/activate" y luego "venv/bin/xinput-gui". Por todo lo que debes hacer es:
   ```bash
   cd xinput-gui
   source venv/bin/activate
   venv/bin/xinput-gui
   ```

7. **script para activar venv y ejecutar xinput-gui con Konsole**
Le proporcioniono un script llamado: 

   open-venv-environment.sh
   
necesita para funcionar Konsole. El script es para facilitar el paso "6." anterior

Para usarlo verifica la primera vez con clic derecho en la pestaña "Permisos" que esté como "Ejecutable" y dale doble clic, este automáticamente activará venv y ejecutará xinput-gui para que lo uses rapidamente, y quedará abierta la terminal Konsolo esperando tus instrucciones para cerrarlo.

---

### Cómo editar los archivos del proyecto
1. **Edita cualquier archivo como lo harías normalmente**
   Por ejemplo, si deseas modificar `xinput_gui/gui/dialog_about.py`, abre el archivo con tu editor de texto o IDE:

   ```bash
   nano xinput_gui/gui/dialog_about.py
   ```

   Realiza tus cambios y guarda el archivo.
   
   >**Nota**: Puedes usar otro editor de textos, ejemplo gedit, Kate, Geany, Featherpad, etc, etc, o IDLE, etc

2. **Ejecuta el programa para probar**
   Los cambios que hagas se aplicarán de inmediato porque la instalación en modo editable apunta al código fuente en tu proyecto. Simplemente ejecuta el programa como antes:

   ```bash
   venv/bin/xinput-gui
   ```

---

### Cómo desinstalar el proyecto
Si en algún momento decides eliminar la instalación editable, puedes hacerlo con:

```bash
pip uninstall xinput-gui
```

---

### Recomendación
Para desarrollo, lo más limpio es activar siempre el entorno virtual y trabajar desde allí. Esto evita conflictos con otros programas o bibliotecas de Python.

Dios te bendiga 😊 😊
