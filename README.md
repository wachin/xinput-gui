# xinput-gui
Una GUI simple para la herramienta Xinput de Xorg.

| ![](https://user-images.githubusercontent.com/1174413/61573693-78d29000-aaa2-11e9-834c-2d7f35c765e3.png) | ![](https://user-images.githubusercontent.com/1174413/61573694-78d29000-aaa2-11e9-902f-7c5989cc43f8.png) |
| --- | --- |

xinput le permite editar propiedades de dispositivos como teclados, ratones y paneles táctiles. Esta interfaz gráfica de usuario utiliza el comando xinput para que la edición sea más rápida y sencilla.

#### **Configurar la velocidad del cursor en Linux con xinput-gui**
**Fecha:** 23 de Diciembre de 2024  
**Autor:** Washington Indacochea Delgado  

**Introducción**  
En algunas distribuciones de Linux, como Ubuntu, OpenSUSE, Debian o MX Linux, podría encontrarse con que no puede ajustar la velocidad del cursor del ratón, touchpad o dispositivos similares. Este problema suele ocurrir en gestores de ventanas para X11 como Fluxbox, IceWM, JWM u Openbox.  

A continuación una solución utilizando la herramienta **xinput-gui** para configurar la velocidad del cursor de forma sencilla.  

---

### **Causas comunes del problema**
1. **Actualización del Kernel:**  
   Algunas actualizaciones del Kernel pueden provocar que ciertas funcionalidades, como el touchpad o la velocidad del cursor, dejen de funcionar correctamente.  

2. **Gestores de ventanas minimalistas:**  
   Gestores como Fluxbox o Openbox no siempre incluyen herramientas gráficas para ajustar la configuración del ratón.  

3. **Dispositivos externos:**  
   Al conectar ratones o touchpads externos, puede que las configuraciones predeterminadas no permitan ajustar la velocidad del cursor.  

---

### **Instalación de xinput-gui en Debian 10, 11, 12 (MX Linux 19, 21, 23) y otros Linux basados en Debian**
#### **1. Actualizar el sistema**  
Abra una terminal y ejecute:  
```bash
sudo apt update && sudo apt upgrade
```  

#### **2. Instalar dependencias**  
Instale los paquetes necesarios:  
```bash
sudo apt install xinput python3-setuptools
```  

#### **3. Descargar e instalar xinput-gui**  
Ejecute los siguientes comandos uno por uno:  
```bash
wget -c https://github.com/IvanFon/xinput-gui/archive/refs/tags/0.3.1.tar.gz
tar xf 0.3.1.tar.gz
cd xinput-gui-0.3.1
sudo python3 setup.py install
```  

(Opcional) Limpie los archivos de instalación:  
```bash
sudo rm -fr ~/xinput-gui-0.3.1 ~/0.3.1.tar.gz
```  

#### **4. Ejecutar xinput-gui**  
Para iniciar la aplicación, escriba en la terminal (en cualquier ruta donde esté):  
```bash
xinput-gui
```  

---

### **Añadir xinput-gui al inicio del sistema**
Para que xinput-gui se ejecute automáticamente al iniciar el sistema:  
- En gestores de ventanas como Fluxbox, edite el archivo `~/.fluxbox/startup` y añada:  

```bash
  /usr/local/bin/xinput-gui &
```  
- Para OpenBox, edite el archivo `~/.config/openbox/autostart` y añada:  

```bash
  /usr/local/bin/xinput-gui &
```  

---

### **Notas adicionales**  
1. Actualmente, xinput-gui no incluye un ícono ni un lanzador `.desktop`. Si desea personalizarlo, puede consultar recursos sobre cómo crear iconos y archivos `.desktop`.  
2. Cuando conecte o desconecte dispositivos, asegúrese de actualizar la lista de dispositivos en xinput-gui seleccionando nuevamente el dispositivo en el apartado "Virtual Core Pointer".  
