## Descripción del código

El menú consta de las siguientes opciones:

Productos: Permite realizar operaciones relacionadas con productos.
Ventas: Permite acceder a las funciones relacionadas con las ventas.
Herramientas: Ofrece opciones de herramientas adicionales.
Salir: Permite salir del programa.
El código comienza mostrando el menú y luego lee la entrada del teclado para determinar la opción seleccionada por el usuario. A continuación, se realizan comparaciones utilizando las teclas presionadas para identificar la opción elegida por el usuario.

Si el usuario selecciona "p" (letra "p" en minúscula), se redirige al menú de productos. Si elige "v", se redirige al menú de ventas. Si selecciona "h", se redirige al menú de herramientas. Si selecciona "s", el programa finaliza y sale. En caso de que se ingrese una opción inválida, se vuelve a mostrar el menú.

Cada menú tiene sus propias opciones y acciones asociadas. Por ejemplo, el menú de productos ofrece opciones como ingresar nuevos productos, mostrar productos, borrar productos, etc. El usuario puede seleccionar una opción ingresando el carácter asociado a cada opción.

El código sigue un enfoque de bucle, lo que significa que después de ejecutar una opción, vuelve a mostrar el menú principal para que el usuario pueda seleccionar otra opción o salir del programa.

### Ingresar Producto

Solicitud de código: Se solicita al usuario que ingrese un código y se almacena en un buffer de entrada.
Verificación de la cadena: Se verifica la validez de la cadena ingresada por el usuario, revisando cada carácter y mostrando un mensaje de error si es necesario.
Verificación del código: Se realiza la verificación del código ingresado, comparando cada carácter con valores específicos y mostrando un mensaje de error si es necesario.
Código correcto: Si el código ingresado es válido, se procede a abrir o crear un archivo de productos.
Búsqueda de código repetido: Se busca el código ingresado en el archivo de productos, comparando con los registros existentes. Si se encuentra una coincidencia, se muestra un mensaje de error.
Error de descripción: Si la descripción ingresada es inválida, se muestra un mensaje de error.
Verificación de descripción: Se realiza la verificación y validación de la descripción ingresada.
Descripción correcta: Si la descripción ingresada es válida, se continúa con las operaciones relacionadas al manejo de archivos y registros.
Esta descripción proporciona una visión general del flujo y las operaciones realizadas en el código ensamblador. Es posible que existan más secciones y operaciones en otras partes del programa que no se hayan incluido en el fragmento proporcionado.

Al finalizar las demas verificaciones se guarda el archivo y si este no esta creado se crea.

### Mostrar producto

Inicialización: Se prepara el espacio de memoria para almacenar los códigos de producto, descripciones, precios y unidades. Esto se logra llamando a la función memset para establecer todos los valores en cero.
Refrescar consola: Se realiza una operación para limpiar la pantalla de la consola y asegurarse de que esté lista para mostrar los productos.
Apertura del archivo: Se abre el archivo de productos utilizando la función int 21h del sistema de interrupciones. El descriptor de archivo resultante se almacena en la variable handle_prods.
Ciclo de mostrar productos: Se inicia un bucle para mostrar los productos almacenados en el archivo. En cada iteración del bucle:
Se lee el código de producto del archivo utilizando la función int 21h y se almacena en la variable cod_prod.
Se lee la descripción del producto del archivo y se almacena en la variable cod_descripcion.
Se lee el precio del producto del archivo y se almacena en la variable num_price.
Se lee la cantidad de unidades del producto del archivo y se almacena en la variable num_units.
Se verifica si se alcanzó el final del archivo. Si es así, se salta a la etiqueta repetir_mostrar para finalizar el ciclo.
Se verifica si el código de producto es igual a cero. Si es así, se salta a la etiqueta ciclo_mostrar para pasar al siguiente producto.
Se llama a la función imprimir_estructura para mostrar en pantalla la información del producto.
Se compara el número de productos mostrados (SI) con el valor 5. Si son iguales, se salta a la etiqueta sig_page para mostrar la siguiente página de productos.
Se salta a la etiqueta ciclo_s para continuar con la siguiente iteración del bucle.

### Eliminar

Solicitud de código de eliminación: El programa muestra una solicitud en pantalla para que el usuario ingrese el código del producto que desea eliminar. El código debe tener una longitud de 5 caracteres. Si el código ingresado es inválido (menos de 5 caracteres), se mostrará un mensaje de error y se solicitará nuevamente el código.

Búsqueda del producto: Una vez ingresado un código válido, el programa busca el producto correspondiente en la lista. Se realiza una comparación del código ingresado con los códigos de los productos existentes en el archivo.

Producto encontrado: Si se encuentra un producto con el código ingresado, se procede a realizar el borrado. Esto implica marcar el espacio ocupado por el producto como disponible y borrar los datos asociados al producto en el archivo.

Finalización del borrado: Después de borrar el producto, se realizan las operaciones necesarias para limpiar y preparar el programa para futuras acciones. Se restablecen los datos relacionados con el producto borrado y se muestra un mensaje en pantalla confirmando que el producto ha sido eliminado exitosamente.

Producto inexistente: Si el código ingresado no corresponde a ningún producto en la lista, se muestra un mensaje en pantalla indicando que el código no se encontró y se vuelve a solicitar un nuevo código de eliminación.

### Ventas: 

Solicitud de código de ventas: El programa muestra una solicitud en pantalla para que el usuario ingrese el código de ventas. El código debe tener una longitud válida. Si el código ingresado es inválido, se muestra un mensaje de error y se solicita nuevamente el código.

Procesamiento del código: Una vez ingresado un código válido, el programa realiza varias operaciones para procesarlo. Estas operaciones incluyen la copia del código ingresado a una ubicación temporal y la verificación de ciertos caracteres específicos en el código.

Verificación y acciones posteriores: Después de procesar el código, el programa verifica ciertas condiciones. Si se cumplen estas condiciones, se ejecutan acciones específicas. Por ejemplo, si se encuentra una secuencia de caracteres específica en el código, se realiza una acción de salida del bucle actual. Luego se realiza una limpieza de datos y se guardan los datos totales en algún lugar. Posteriormente, se retorna al menú principal del programa.

Búsqueda de productos: En esta sección del código, se realiza una búsqueda de productos en un archivo. Se leen los códigos, descripciones, precios y unidades del archivo y se comparan con los datos ingresados. Si se encuentra un producto con el código ingresado, se realiza una acción específica.

Producto encontrado: Si se encuentra el producto, se verifica la cantidad de unidades disponibles. Si la cantidad es cero, se realiza una acción para manejar la situación de un producto sin unidades disponibles. Si hay unidades disponibles, se solicita al usuario ingresar la cantidad de unidades a vender.

Producto no encontrado: Si no se encuentra el producto en el archivo, se muestra un mensaje indicando que el documento no se encontró.

Finalización del proceso: Al finalizar el proceso, se realiza una limpieza de datos y se muestran mensajes en pantalla. Luego se retorna al menú principal del programa.

### Reportes

Se muestra un menú de herramientas que incluye las opciones "catalogo_completo", "Reporte_alfabetico", "Productos_sin_existencias" y "texto_volver".
Luego, se solicita al usuario que ingrese una opción utilizando la función de entrada de teclado.
Se comparan las opciones ingresadas con diferentes valores para determinar la acción correspondiente a cada opción.
Si se selecciona la opción "generar_catalogo", se ejecuta la función "generar_reporte_productos" que muestra un mensaje de productos sin existencias y luego se salta a la etiqueta "fin".
Si se selecciona la opción "generar_reporte_alfabetico", se muestra un mensaje de reporte de ventas y se inicializa un contador de ventas. Luego se abre un archivo de ventas y se inicia un ciclo para contar y obtener información de las ventas. Se verifica si hay ventas disponibles y si el día es igual a 0, se incrementa el contador de ventas y se continúa con el ciclo. Una vez finalizado el ciclo, se obtiene la fecha y la hora, se crea un archivo de reporte y se escriben los datos obtenidos en el archivo.
Si se selecciona la opción "ReporteFalta", se realiza un proceso similar al del reporte alfabético, pero se utiliza otro archivo de ventas y se recorre cada venta para escribir los datos correspondientes en el archivo de reporte.
Si se selecciona la opción "Menu", se vuelve al menú principal.
Si ninguna de las opciones anteriores es seleccionada, se vuelve al menú de herramientas.