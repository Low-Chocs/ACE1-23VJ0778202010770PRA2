imprimir_pantalla macro string      
            mov dx, offset string
            mov ah,09
		    int 21
endm 

analizador_lexico macro 
    mov AH, 3Fh        
    mov BX, [handle_archivo] 
    mov CX, 1         
    mov DX, OFFSET caracter 
    int 21h           
    cmp AX, 0         
    je fin_lectura  
endm
primer_abecedario macro primera_letra, cantidad1, manipulador, tra, tda, tdc, trc
   mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 04
    mov DX, offset tra
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 04
    mov DX, offset tda
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset primera_letra
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 05
    mov DX, offset tdc
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 04
    mov DX, offset tda
    int 21
    mov AX, [cantidad1]
    call numAcadena
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 02
    mov DX, offset numero
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 05
    mov DX, offset tdc
    int 21
    mov BX, [manipulador]
    mov AH, 40
    mov CH, 00
    mov CL, 05
    mov DX, offset trc
    int 21
endm

Sumar_contador macro letritas
        inc letritas
endm 

refrescar_consola macro 
            mov  ah, 0
            mov  al, 3
            int  10H
endm



.MODEL SMALL
.RADIX 16
.STACK
.DATA

usac       db    "Universidad de San Carlos de Guatemala",0a,"$"
facultad   db    "Facultad de Ingenieria",0a,"$"
Periodo    db    "Escuela De Vacaciones",0a,"$"
curso      db    "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
nombre     db    "Nombre: Luis Mariano Moreira GarcIa",0a,"$"
carne      db    "Carnet: 202010770                                    |",0a,"$"
nueva_linea_texto db 0Dh, 0Ah, '$'
buffer_de_entrada   db  20, 00
                 db  20 dup (00)
numero           db   03 dup (30), "$"
archivo_reporte_catalogo      db   "CatalogoCompleto202010770.HTM",00
archivo_reporte_abecedario      db   "Abecedario202010770.HTM",00
archivo_falta db 'FALTA.HTM',00
repeticion_manipulacion      dw   0000
manipulacion_repeticiones_1      dw   0000
puntero_temp     dw    0000
mensaje_error_credenciales db "Se detecto error en el archivo",0ah,"$"
no_mas_existencias db "No hay suficientes existencias para vender",0ah,"$"
Monto_total   db "Total: ",0ah,"$"
tam_encabezado_html    db     4A
ceros          db     2a  dup (0)
espacio db 20h, '$'
caracter db ?
nombre_del_usuario db  "lmoreira","$"
cadena_clave db  "202010770","$"
mensaje_de_credenciales_correctas db "Credenciales Correctas, Enter -> Continuar",0ah,"$"
msg_productos_completos db "Ya no hay productos",0a,"$"
texto_productos  db    "(p)roductos",0a,"$"
ventas     db    "(v)entas",0a,"$"
herramientas db  "(h)erramientas",0a,"$"
titulo_salir db  "(s)alir",0a,"$"
prompt     db    "Presione tecla:",0a,"$"
cod_prod_temp    db    05 dup (0)
file_reporte_ventas   db "REP.TXT"
handle_reportes dw 0000
encabezado_html        db     "<html><head><link href='styles.css'rel='stylesheet'></head><body>"
tam_inicializacion_tabla   db   5e
inicializacion_tabla   db     '<table border="1"><tr><td>codigo</td><td>descripcion</td><td>Precio</td><td>Cantidad</td></tr>'
tam_inicializacion_tabla2   db   4D
inicializacion_tabla2   db     '<table border="1"><tr><td>codigo</td><td>descripcion</td><td>Precio</td></tr>'
tam_inicializacion_tabla_alfabeto   db   3a
inicializacion_tabla_alfabeto  db     '<table border="1"><tr><td>Letra</td><td>Cantidad</td></tr>'
tam_cierre_tabla       db     8
cierre_tabla           db     "</table>"
tam_footer_html        db     0e
footer_html            db     "</body></html>"
td_html                db     "<td>"
tdc_html               db     "</td>"
tr_html                db     "<tr>"
trc_html               db     "</tr>"
p_html                 db     "<p>"
pc_html                db     "</p>"
msg_hora               db     "Fecha: "
dos_puntos             db     ":" 
guion                  db     "-"
diagonal              db     "/" ,0ah, "$"
titulo_catalogo       db  "<p>CATALOGO DE PRODUCTOS</p>",0ah,"$"
titulo_alfabeto       db  "<p>ALFABETO</p>",0ah,"$"
titulo_falta          db "<p>Reporte Productos Sin Existencias</p>",0ah,"$"
css_catalogo          db "<link href='styles.css' rel='stylesheet' >",0ah,"$"  
token_mayor           db ">",00
token_menor           db "<",00
ultimas_ventas       db "Ultimas Ventas: ", 0ah, "$"
Fecha_33           db "Fecha: "

T_parte1 db "PARTE 1",0a
Ventas_totales   dw    0000
se_realizo_venta_o_no   db 0a,0a,'Enter -> Confirmar, q -> Cancelar',0a,'$'
el_total_de_la_venta db 'TOTAL Global:','$'
almacenar_temporal_de_ventas dw 0
IncItem db 0
CodigoVentas  db 0a,'>> CODIGO: ','$'
UnidadVentas  db 0a,'>> UNIDADES: ','$'
ValorUnidad    db    03 dup (0) 
sin_ingresar_texto   db  'Ingrese un valor valido','$'
Productos_con_no_existencias_1 db 'El producto no tiene existencias',0ah,'$'
num_ventas   dw    000
archivo_de_ventas    db 'VENT.BIN', 00 
archivo_de_ventas_2   db 'vent1.bin', 00
handle_ventas dw  0000
handle_ventas2 dw 0000
handle_falta dw 0000
generado db 'Restantes Generado', '$'
codigo_no_encontrado db  'No se encontro el codigo', '$'
codigo_borrado db 'Se ha eliminado el codigo', '$'

mostrar_productos     db  "(M)ostrar",0a,"$"
ingresar_productos    db  "(I)ngresar",0a,"$"
texto_eliminar_productos      db  "(E)liminar",0a,"$"
texto_volver    db   "(V)olver",0a,"$"
titulo_produc    db   "Ingresa Producto",0a,"$"
msg_error_prodcuto db "Ya existe codigo",0a,"$"
catalogo_completo   db  "(c)atalogo",0a,"$"
Reporte_alfabetico  db  "(a)lfabeto",0a,"$"
Productos_sin_existencias  db "(p)roductos con no existencias",0a,"$"
msg_catalogo    db "Se ha generado catalago!",0ah,"$"
msg_alfabetico  db "Se ha generado alfabetico!",0ah,"$"
msg_ventas      db "Se ha generado ventas!",0ah,"$"
msg_sin_existencias db "Se ha generado sin existencias!",0ah,"$"
letra_a  db "A","$"
letra_b  db "B","$"
letra_c  db "C","$"
letra_d  db "D","$"
letra_e  db "E","$"
letra_f  db "F","$"
letra_g  db "G","$"
letra_h  db "H","$"
letra_i  db "I","$"
letra_j  db "J","$"
letra_k  db "K","$"
letra_l  db "L","$"
letra_m  db "M","$"
letra_n  db "N","$"
letra_o  db "O","$"
letra_p  db "P","$"
letra_q  db "Q","$"
letra_r  db "R","$"
letra_s  db "S","$"
letra_t  db "T","$"
letra_u  db "U","$"
letra_v  db "V","$"
letra_w  db "W","$"
letra_x  db "X","$"
letra_y  db "Y","$"
letra_z  db "Z","$"
buffer db 256 dup(0), '$' 
contador_buffer dw 0 
quotes db '"' 
buffer_de_salida db 256 dup(0)
contador_del_buffer dw 0 
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000
handle_archivo dw 0000
num_price   dw    0000
num_units dw 0000
mensaje_mostrar_productos db "Enter -> Siguiente, q -> Regresar",0h,'$'
cod_prod    db    05 dup (0)
cod_prod1    db    05 dup (0)
cod_descripcion    db    21 dup (0)
cod_price   dw    03 dup (0)
cod_units   dw    03 dup (0)
hora db 3 dup('$'),0ah
minuto db 3 dup('$'),0ah
dia db 3 dup('$'),0ah
num_dia db 00  ,0ah
mes db 3 dup('$'), 0ah
anio db 5 dup('$'), 0ah
contador_item dw 0000
contador_ventas dw 0000
prompt_code      db    "Codigo: ","$"
prompt_des       db    "Descripcion: ","$"
prompt_price     db    "Precio: ","$"
prompt_units     db    "Unidades: ","$"
mensaje_error_ubicacion_archivo db "No se encontro archivo",0a,"$"
archivo_prueba    db   "PRA2.CNF",00
mensaje_de_error_cadenas db "Verifica las credenciales",0ah,"$"
mensaje_de_despedida db "Feliz dia!",0a,"$"
contador_a dw 0000
contador_b dw 0000
contador_c dw 0000
contador_d dw 0000
contador_e dw 0000
contador_f dw 0000
contador_g dw 0000
contador_h dw 0000
contador_i dw 0000
contador_j dw 0000
contador_k dw 0000
contador_l dw 0000
contador_m dw 0000
contador_n dw 0000
contador_o dw 0000
contador_p dw 0000
contador_q dw 0000
contador_r dw 0000
contador_s dw 0000
contador_t dw 0000
contador_u dw 0000
contador_v dw 0000
contador_w dw 0000
contador_x dw 0000
contador_y dw 0000
contador_z dw 0000


.CODE
limpiarbuff proc
    mov contador_del_buffer, 0
    limpiar:
        mov bx, contador_del_buffer
        mov buffer_de_salida[bx], 0
        inc contador_del_buffer
        cmp contador_del_buffer, 256
    
        jne limpiar 

    mov contador_del_buffer, 0
    ret
limpiarbuff endp


revisar_claves proc
     buscar_comillas:
        mov bx, contador_buffer
        mov al, buffer[bx]
        cmp al, quotes
        jne siguiente_char 
        inc contador_buffer

    guardar_caracter:
        mov bx, contador_buffer
        mov al, buffer[bx]
        cmp al, quotes
        je llaves_final
        mov bx, contador_del_buffer
        mov buffer_de_salida[bx], al
        inc contador_del_buffer
        inc contador_buffer
        jmp guardar_caracter 
    siguiente_char:
        inc contador_buffer
        mov bx, contador_buffer
        cmp buffer[bx], '$'
        jne buscar_comillas 
    llaves_final:
        mov bx, contador_del_buffer
        mov buffer_de_salida[bx], '$' 
        ret
revisar_claves endp


ObtenerFecha MACRO
    mov ah, 2a
    int 21h
    xor ah, ah
    mov al, dl
    mov bl, 0a
    div bl
    add al, 30
    add ah, 30
    mov dia[0], al
    mov dia[1], ah
    xor ah, ah
    mov al, dh
    mov bl, 0a
    div bl
    add al, 30
    add ah, 30
    mov mes[0], al
    mov mes[1], ah
    ;procedimineto para el año CX
    ;para obtener el milenio
    xor dx, dx
    mov ax, cx
    mov cx, 1000
    div cx
    add al, 32
    mov anio[0], al
    ;para obtener la centena
    mov ax, dx
    xor dx, dx
    mov cx, 100
    div cx
    add al, 29
    mov anio[1], al
    ;para obtener la decada
    mov ax, dx
    xor dx, dx
    mov cx, 10
    div cx
    add al, 24
    mov anio[2], al
    ;para los dias el residu
    add dl, 2c
    mov anio[3], dl
ENDM
;; Obtener hora y minuto
ObtenerHora MACRO
    mov ah, 2ch
    int 21h
    ;procedimiento para la hora; CH
    xor ah, ah
    mov al, ch
    mov bl, 0a
    div bl
    add al, 30
    add ah, 30
    mov hora[0], al
    mov hora[1], ah
    ;procedimiento para los minutos CL
    xor ah, ah
    mov al, cl
    mov bl, 0a
    div bl
    add al, 30
    add ah, 30
    mov minuto[0], al
    mov minuto[1], ah
ENDM

verificar_cadenas:

        mov AH, 3Dh       
   	 	mov AL, 0         
    	mov DX, OFFSET archivo_prueba  
    	int 21h         
    	jc error_archivo  
    	                
		mov BX, AX          
		mov ah, 3Fh 
        lea dx, buffer 
        mov cx, 255 
        int 21h
        jc error
        mov contador_buffer, 0
        call limpiarbuff 
        call revisar_claves ; extrae la primera cita
        xor si,si
        jmp comparar_cadenas 
compare_clave: 
        inc contador_buffer
        call limpiarbuff 
        call revisar_claves
        jmp comparar_claves

.STARTUP
;; CODIGO
inicio:
    mov AX, 7e7
	call numAcadena
	mov BX, 01
	mov CX, 0003
	imprimir_pantalla nueva_linea_texto
	imprimir_pantalla usac
	imprimir_pantalla Facultad
	imprimir_pantalla Periodo
	imprimir_pantalla curso
	imprimir_pantalla nombre
	imprimir_pantalla carne
    imprimir_pantalla nueva_linea_texto

		
        mov AH, 3Dh           
        mov AL, 0              
        mov DX, OFFSET archivo_prueba 
        int 21h                
        mov [handle_archivo], AX 
        jmp chequear_caracter 
        



     
Menu:
     
        imprimir_pantalla texto_productos
        imprimir_pantalla ventas
        imprimir_pantalla herramientas
        imprimir_pantalla titulo_salir
        imprimir_pantalla prompt
        mov AH, 08
		int 21
		cmp AL, 70 ; p 
		je menu_de_productos
		cmp AL, 76 ; v 
		je menu_de_ventas 
		cmp AL, 68 ; h 
		je menu_de_herramientas 
        cmp AL, 73      ;; s minuscula ascii
        je fin
		jmp Menu
        jmp fin

menu_de_productos:
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla ingresar_productos
    imprimir_pantalla mostrar_productos
    imprimir_pantalla texto_eliminar_productos
    imprimir_pantalla texto_volver
    imprimir_pantalla nueva_linea_texto

    imprimir_pantalla prompt
        mov AH, 08
		int 21
        ;; AL = CARACTER LEIDO
		cmp AL, 69 ;; i
		je ingresar_producto_archivo
		cmp AL, 6d ;; m
		je mostrar_productos_archivo
        cmp AL, 65 ;; e
        je borrar_producto
        cmp AL, 76 ;; v
        je Menu
		jmp menu_de_productos
		;;
        jmp fin

ingresar_producto_archivo:
        imprimir_pantalla titulo_produc
        imprimir_pantalla nueva_linea_texto
        
pedir_codigo:
    imprimir_pantalla prompt_code
    mov dx, offset buffer_de_entrada
    mov ah, 0a
    int 21
    mov DI, offset buffer_de_entrada
    inc DI
    mov AL, [DI]  
    cmp AL, 05
    jb verificar_cadena
    imprimir_pantalla nueva_linea_texto
    jmp pedir_codigo
    
verificar_cadena:
    mov SI, offset cod_prod
    mov DI, offset buffer_de_entrada
    inc di
    mov CH, 00
    mov CL , [DI]
    inc DI 
    copiar_codigo1:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo1  
        mov DI, offset cod_prod
        jmp verificacion_codigo
    
verificacion_codigo:

    mov AL , [DI]
    cmp AL , 00
    je codigo_correcto
    cmp AL, 22
    je error_letra
    cmp AL, 23
    je error_letra
    cmp AL, 24
    je error_letra
    cmp AL, 25
    je error_letra
    cmp AL, 26
    je error_letra
    cmp AL, 27
    je error_letra
    cmp AL, 28
    je error_letra
    cmp AL, 2A
    je error_letra
    cmp AL, 2B
    je error_letra
    cmp AL, 2C
    je error_letra
    cmp AL, 2E
    je error_letra  
    cmp AL, 2F
    je error_letra 
    cmp AL, 3A
    je error_letra
    cmp AL, 3B
    je error_letra
    cmp AL, 3C
    je error_letra
    cmp AL, 3D
    je error_letra
    cmp AL, 3E
    je error_letra
    cmp AL, 3F
    je error_letra
    cmp AL, 40  
    je error_letra         
    cmp AL , 'Z'
    ja error_letra
    inc DI
    jmp verificacion_codigo

error_letra:
    mov DI, offset cod_prod
    mov CX, 05
    call memset
    imprimir_pantalla nueva_linea_texto
    jmp pedir_codigo

codigo_correcto:
    mov AL, 02             
	mov DX, offset archivo_prods
	mov AH, 3d
	int 21
    jc crear_archiv 
	mov [handle_prods], AX
    jmp buscar_codigo_repetido
crear_archiv:
         mov CX, 0000

        mov AH, 3c
        mov DX, offset archivo_prods
        
        int 21
        mov [handle_prods], AX
    jmp buscar_codigo_repetido
buscar_codigo_repetido:
    int 03
    mov BX, [handle_prods]
    mov CX, 05
    mov DX, offset cod_prod1
    mov Ah,3F
    int 21
    mov BX, [handle_prods]
    mov CX, 21
    mov DX, offset cod_descripcion
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_price
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_units
    mov AH, 3F
    int 21
    cmp AX, 0000
    je error_descc
    mov DX, [puntero_temp]
    add DX, 2A
    mov [puntero_temp], DX
    mov AL, 00
    cmp [cod_prod1], AL
    je buscar_codigo_repetido
    mov SI, offset cod_prod
    mov DI, offset cod_prod1
    mov CX, 0005
    call cadenas_iguales1
    cmp DL, 0ff
	je codigo_existente
	jmp buscar_codigo_repetido
codigo_existente:
    refrescar_consola
    imprimir_pantalla msg_error_prodcuto
    mov DI, offset cod_prod
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset
    jmp menu_de_productos


error_descc:
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset
  
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla prompt_des
    mov DX, OFFSET buffer_de_entrada
    mov AH, 0ah
    int 21h
    mov DI, offset buffer_de_entrada
    inc DI
    mov AL, [DI]
    cmp AL, 00
    je error_descc
    cmp AL, 21
    jb verificar_des
    jmp error_descc

verificar_des:
     mov SI, offset cod_descripcion
    mov DI, offset buffer_de_entrada
    inc di
    mov CH, 00
    mov CL , [DI]
    inc DI 
    copiar_descripcion:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_descripcion 
        mov DI, offset cod_descripcion
        jmp verificar_descripcion


verificar_descripcion:
    mov AL , [DI]
    cmp AL , 00
    je descripcion_correcta
    cmp AL, 20
    je error_desc
    cmp AL, 22
    je error_desc
    cmp AL, 23
    je error_desc
    cmp AL, 24
    je error_desc
    cmp AL, 25
    je error_desc
    cmp AL, 26
    je error_desc
    cmp AL, 27
    je error_desc
    cmp AL, 28
    je error_desc
    cmp AL, 2A
    je error_desc
    cmp AL, 2D
    je error_desc
    cmp AL, 2B
    je error_desc
    cmp AL, 2F
    je error_desc  
    cmp AL, 3A
    je error_desc
    cmp AL, 3B
    je error_desc
    cmp AL, 3C
    je error_desc
    cmp AL, 3D
    je error_desc
    cmp AL, 3E
    je error_desc
    cmp AL, 3F
    je error_desc
    cmp AL, 40  
    je error_desc
    cmp AL, 5B
    je error_desc
    cmp AL, 5C
    je error_desc
    cmp AL, 5D
    je error_desc
    cmp AL, 5E
    je error_desc
    cmp AL, 5F
    je error_desc
    cmp AL, 60
    je error_desc
    cmp AL , 7a
    ja error_desc
    inc DI
    jmp verificar_descripcion
 
error_desc:
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    imprimir_pantalla nueva_linea_texto
    jmp error_descc

descripcion_correcta:
    imprimir_pantalla nueva_linea_texto
   jmp pedir_precio

pedir_precio:
   
    imprimir_pantalla prompt_price
    mov DX, OFFSET buffer_de_entrada
    mov AH, 0ah
    int 21h
    mov DI, offset buffer_de_entrada
    inc DI
    mov AL, [DI]
    cmp AL, 00
    je pedir_precio
    cmp AL, 03
     imprimir_pantalla nueva_linea_texto
    jb verificar_precio
    jmp pedir_precio

verificar_precio:
    mov SI, offset cod_price
    mov DI, offset buffer_de_entrada
    inc DI
    mov CH, 00
    mov CL , [DI]
    inc DI 
copiar_precio:
    mov AL, [DI]
    mov [SI], Al
    inc SI
    inc DI
    loop copiar_precio 
    mov DI, offset cod_price
    jmp verificacion_precio

verificacion_precio:
    mov AL , [DI]
    cmp AL , 00
    je precio_correcto
    cmp AL, 22
    je error_precio
    cmp AL, 23
    je error_precio
    cmp AL, 24
    je error_precio
    cmp AL, 25
    je error_precio
    cmp AL, 26
    je error_precio
    cmp AL, 27
    je error_precio
    cmp AL, 28
    je error_precio
    cmp AL, 2A
    je error_precio
    cmp AL, 2B
    je error_precio
    cmp AL, 2C
    je error_precio
    cmp AL, 2E
    je error_precio
    cmp AL, 2F
    je error_precio
    cmp AL, '9'
    ja error_precio
    inc DI
    jmp verificacion_precio

error_precio:
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    imprimir_pantalla nueva_linea_texto
    jmp pedir_precio
precio_correcto:

    imprimir_pantalla nueva_linea_texto
    mov DI, offset cod_price
    call cadenaAnum
    mov [num_price],AX
    mov DI, offset cod_price
    mov CX, 0003
    call memset

pedir_cantidad:
    imprimir_pantalla prompt_units
    mov DX, OFFSET buffer_de_entrada
    mov AH, 0ah
    int 21h
    mov DI, offset buffer_de_entrada
    inc DI
    mov AL, [DI]
    cmp AL, 00
    je pedir_cantidad
    cmp AL, 03
    imprimir_pantalla nueva_linea_texto
    jb verificar_cantidad
    jmp pedir_cantidad

verificar_cantidad:
    mov SI, offset cod_units
    mov DI, offset buffer_de_entrada
    inc DI
    mov CH, 00
    mov CL , [DI]
    inc DI
copiar_cantidad:
    mov AL, [DI]
    mov [SI], Al
    inc SI
    inc DI
    loop copiar_cantidad 
    mov DI, offset cod_units
    jmp verificacion_cantidad

verificacion_cantidad:
       mov AL , [DI]
    cmp AL , 00
    je cantidad_correcto
    cmp AL, 22
    je error_cantidad
    cmp AL, 23
    je error_cantidad
    cmp AL, 24
    je error_cantidad
    cmp AL, 25
    je error_cantidad
    cmp AL, 26
    je error_cantidad
    cmp AL, 27
    je error_cantidad
    cmp AL, 28
    je error_cantidad
    cmp AL, 2A
    je error_cantidad
    cmp AL, 2B
    je error_cantidad
    cmp AL, 2C
    je error_cantidad
    cmp AL, 2E
    je error_cantidad
    cmp AL, 2F
    je error_cantidad
    cmp AL, '9'
    ja error_cantidad
    inc DI
    jmp verificacion_cantidad



error_cantidad:
    mov DI, offset cod_units
    mov CX, 0003
    call memset
    imprimir_pantalla nueva_linea_texto
    jmp pedir_cantidad

cantidad_correcto:
    imprimir_pantalla nueva_linea_texto
    mov DI, offset cod_units
    call cadenaAnum
    mov [num_units],AX
    mov DI, offset cod_units
    mov CX, 0003
    call memset
  
    jmp abrir_archivo_prod


abrir_archivo_prod:
	    mov AH, 3D
        mov AL, 02
        mov DX, offset archivo_prods
        int 21
        jc crear_archivo_prod
        jmp guardar_handle_prod

crear_archivo_prod:
        mov CX, 0000
        mov AH, 3c
        mov DX, offset archivo_prods
        int 21

guardar_handle_prod:
    mov [handle_prods], AX
    mov BX, [handle_prods]
    mov CX, 00
    mov DX, 00
    mov AL, 02
    mov AH, 42
    int 21
    mov CX, 05
    mov DX, offset cod_prod
    mov AH, 40
    int 21
    mov cx, 21
    mov dx, offset cod_descripcion
    mov ah, 40
    int 21
    mov CX, 0002
    mov DX, offset num_price
    mov AH, 40
    int 21
    mov CX, 0002
    mov DX, offset num_units
    mov AH, 40
    int 21
    mov AH, 3Eh
    int 21
    ;; limpiar buffer de nuestro datos
    mov DI, offset cod_prod
    mov CX, 05
    call memset
    mov DI, offset cod_prod1
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset


    jmp menu_de_productos


mostrar_productos_archivo:
 mov DI, offset cod_prod
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset

    refrescar_consola
    imprimir_pantalla nueva_linea_texto
     
    mov AL, 02
    mov AH, 3D
    mov DX, offset archivo_prods
    int 21
   
    mov [handle_prods], AX
    mov SI,0
    

ciclo_mostrar:
    inc si
   
    mov BX, [handle_prods]
    mov CX, 05
    mov DX, offset cod_prod
    mov AH,3F
    int 21
    mov BX, [handle_prods]
    mov CX, 21
    mov DX, offset cod_descripcion
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_price
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_units
    mov AH, 3F
    int 21
    cmp AX, 0000
    je repetir_mostrar
    mov AL, 00
    cmp [cod_prod], AL
    je ciclo_mostrar
    call imprimir_estructura
    cmp SI, 05
    je sig_page
    jmp ciclo_s

ciclo_s:
   
    jmp ciclo_mostrar
sig_page: 
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla mensaje_mostrar_productos
    mov ah, 08
    int 21
    cmp Al, 71
    je fin_mostrar
    mov si,0
    refrescar_consola
    jmp ciclo_mostrar
    
repetir_mostrar:
       imprimir_pantalla nueva_linea_texto
    imprimir_pantalla mensaje_mostrar_productos
    mov ah, 08
    int 21
    cmp Al, 71
    je fin_mostrar
    mov si,0
    refrescar_consola
    jmp mostrar_productos_archivo

ciclo_mostrar2:
    refrescar_consola
    mov si,0
    jmp ciclo_mostrar


fin_mostrar:
   refrescar_consola
    mov DI, offset cod_prod
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset
    jmp menu_de_productos

borrar_producto:
    	mov DX, 0000
		mov [puntero_temp], DX
pedir_codigo_eliminar:
       imprimir_pantalla prompt_code
       mov DX, offset buffer_de_entrada
		mov AH, 0a
		int 21
		mov DI, offset buffer_de_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_codigo_eliminar
		cmp AL, 05
		jb  aceptar_tam_cod2  
		imprimir_pantalla nueva_linea_texto
		jmp pedir_codigo_eliminar

aceptar_tam_cod2:
        mov SI, offset cod_prod_temp
		mov DI, offset buffer_de_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  
copiar_codigo2:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo2   
        imprimir_pantalla nueva_linea_texto 
        mov AL, 02             
		mov DX, offset archivo_prods
		mov AH, 3d
		int 21
		mov [handle_prods], AX

ciclo_encontrar:
    int 03
    mov BX, [handle_prods]
    mov CX, 05
    mov DX, offset cod_prod
    mov Ah,3F
    int 21
    mov BX, [handle_prods]
    mov CX, 21
    mov DX, offset cod_descripcion
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_price
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_units
    mov AH, 3F
    int 21
    cmp AX, 0000
    je codigo_inexistente
    mov DX, [puntero_temp]
    add DX, 2A
    mov [puntero_temp], DX
    mov AL, 00
    cmp [cod_prod], AL
    je ciclo_encontrar
    mov SI, offset cod_prod_temp
    mov DI, offset cod_prod
    mov CX, 0005
    call cadenas_iguales1
    cmp DL, 0ff
	je borrar_encontrado
	jmp ciclo_encontrar

borrar_encontrado:
		mov DX, [puntero_temp]
		sub DX, 2a
		mov CX, 0000
		mov BX, [handle_prods]
		mov AL, 00
		mov AH, 42
		int 21
		mov CX, 1e
		mov DX, offset ceros
		mov AH, 40
		int 21
finalizar_borrar:
		mov BX, [handle_prods]
		mov AH, 3e
		int 21
        mov DI, offset cod_prod
    mov CX, 05
    call memset
     mov DI, offset cod_prod_temp
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset 
        refrescar_consola
        imprimir_pantalla codigo_borrado
        imprimir_pantalla nueva_linea_texto
		jmp menu_de_productos

codigo_inexistente:
	mov BX, [handle_prods]
		mov AH, 3e
		int 21
        mov DI, offset cod_prod
    mov CX, 05
    call memset
     mov DI, offset cod_prod_temp
    mov CX, 05
    call memset
    mov DI, offset cod_descripcion
    mov CX, 21
    call memset
    mov DI, offset cod_price
    mov CX, 0003
    call memset
    mov DI, offset cod_units
    mov CX, 0003
    call memset 
        refrescar_consola
        imprimir_pantalla codigo_no_encontrado
        imprimir_pantalla nueva_linea_texto
		jmp borrar_producto

menu_de_ventas:
        mov Ventas_totales, 0000
        mov IncItem , 0
        MenuVENTAS:
            cmp IncItem , 0A
            je salir_3
            ObtenerFecha
            ObtenerHora
            mov DX, 0000
            mov [puntero_temp], DX
            imprimir_pantalla nueva_linea_texto
            imprimir_pantalla  el_total_de_la_venta
            mov AX, [Ventas_totales]
            call numAcadena2
            ;; [numero] tengo la cadena convertida
            mov BX, 0001
            mov CX, 0005
            mov DX, offset numero
            mov AH, 40
            int 21
        VentasCODE:
            
            imprimir_pantalla CodigoVentas
            mov DX, offset buffer_de_entrada
            mov AH, 0a
            int 21
            mov DI, offset buffer_de_entrada
            inc DI
            mov AL, [DI]
            cmp AL, 00
            je  VentasCODE
            cmp AL, 05
            jb  PASO1  
            jmp VentasCODE
        PASO1: 
            mov SI, offset cod_prod_temp
            mov DI, offset buffer_de_entrada
            inc DI
            mov CH, 00
            mov CL, [DI]
            inc DI  
            jmp PASO2
        PASO2:	
            mov AL, [DI]
            mov [SI], AL
            inc SI
            inc DI
            loop PASO2
            jmp ES_FIN
        ES_FIN:
            mov DI , offset cod_prod_temp
            jmp PASO3
        PASO3:
            mov AL, [DI]
            cmp AL, 'f'
            je Salir_1
            jmp PASO4
        Salir_1:
            inc DI
            mov AL, [DI]
            cmp AL , 'i'
            je Salir_2
        Salir_2:
            inc DI
            mov AL, [DI]
            cmp AL , 'n'
            je Salir_3
        Salir_3:
            mov DI, offset cod_prod_temp
            mov Cx , 05
            call memset
            call guardar_datototal
            jmp Menu

        PASO4:
            mov ah, 3D   
            mov al, 02       
            mov dx, offset archivo_prods
            int 21  
            mov [handle_prods], AX
            jmp BUSCARPRODUCTO
        BUSCARPRODUCTO:
            ; lectura
            mov BX, [handle_prods]
            mov CX, 05
            mov DX, offset cod_prod
            moV AH, 3f
            int 21
            mov BX, [handle_prods]
            mov CX, 21
            mov DX, offset cod_descripcion
            moV AH, 3f
            int 21
            mov BX, [handle_prods]
            mov CX, 0002
            mov DX, offset num_price
            moV AH, 3f
            int 21
            mov BX, [handle_prods]
            mov CX, 0002
            mov DX, offset num_units
            moV AH, 3f
            int 21
            cmp AX, 0000   
            je FINDOCUMENTO
        
            mov DX, [puntero_temp]
            add DX, 2a
            mov [puntero_temp], DX
            mov AL, 00
            cmp [cod_prod], AL
            je BUSCARPRODUCTO
            mov SI, offset cod_prod_temp
            mov DI, offset cod_prod
            mov CX, 0005
            call cadenas_iguales1
            cmp DL, 0ff
            je PRODUCTOENCONTRADO
            jmp BUSCARPRODUCTO 

        PRODUCTOENCONTRADO:
                cmp num_units, 00
                je PRODUCTO_SIN
                jmp PEDIRUNIDADESVENDER
        FINDOCUMENTO:
            mov BX, [handle_prods]
            mov AH, 3e
            int 21
            imprimir_pantalla nueva_linea_texto
            imprimir_pantalla nueva_linea_texto
            imprimir_pantalla sin_ingresar_texto
            imprimir_pantalla nueva_linea_texto
            mov DI, offset cod_prod_temp
            mov Cx , 05
            call memset
            jmp Menu
        PRODUCTO_SIN:
        imprimir_pantalla nueva_linea_texto
        imprimir_pantalla Productos_con_no_existencias_1
        imprimir_pantalla nueva_linea_texto
        jmp Menu
        PEDIRUNIDADESVENDER:
            imprimir_pantalla UnidadVentas
            mov DX, offset buffer_de_entrada
            mov AH, 0a
            int 21
            mov DI, offset buffer_de_entrada
            inc DI
            mov AL, [DI]
            cmp AL, 00
            je  PEDIRUNIDADESVENDER
            cmp AL, 03
            jb  PUNIDADES  
            jmp PEDIRUNIDADESVENDER
            PUNIDADES:
                mov SI, offset ValorUnidad
                mov DI, offset buffer_de_entrada
                inc DI
                mov CH, 00
                mov CL, [DI]
                inc DI 
                jmp CopiarUnidad
            CopiarUnidad:
                mov AL , [DI]
                mov [SI], AL
                inc SI
                inc DI 
                loop CopiarUnidad

                  mov DI, offset ValorUnidad
                call cadenaAnum
                mov [num_ventas], AX
                mov DI, offset ValorUnidad
                mov CX, 0003
                call memset 
                ;; imprimir valorunidad 

                 mov ax, num_ventas
                 cmp ax, num_units
                 jle PreguntarSicontinuar
                 jmp nohayexistencias
              
            PreguntarSicontinuar:
                
                 imprimir_pantalla se_realizo_venta_o_no
                mov ah, 08
                int 21
                 cmp al , 71
                 je MenuVENTAS
                 jmp ActualizarPRODUCTO
               
        nohayexistencias:
                imprimir_pantalla nueva_linea_texto
                imprimir_pantalla no_mas_existencias
                imprimir_pantalla nueva_linea_texto
                jmp MenuVENTAS
      ActualizarPRODUCTO:
                mov DX, [puntero_temp]
		        sub DX, 2a
                mov CX, 0000
                mov BX, [handle_prods]
                mov AL, 00
                mov AH, 42
                int 21

                mov CX, 05
                mov DX, offset cod_prod
                mov AH, 40
                int 21

                mov CX, 21
                mov DX, offset cod_descripcion
                mov AH, 40
                int 21
                
                mov CX, 0002
                mov DX, offset num_price
                mov AH, 40
                int 21
              
             
              
                mov ax , num_ventas
                sub num_units , ax
                
                mov CX, 0002
                mov DX, offset num_units
                mov AH, 40
                int 21
                
                mov ax , num_ventas
                mov almacenar_temporal_de_ventas , ax

                mov ax , almacenar_temporal_de_ventas
                mov bx , num_price
                mul bx
                mov almacenar_temporal_de_ventas , ax

                mov ax , almacenar_temporal_de_ventas
                add Ventas_totales , ax

                mov BX, [handle_prods]
                mov AH, 3e
                int 21

                jmp CREARVENTA
    CREARVENTA:
        ; Se abre bin
        mov ah, 3D   
        mov al, 02       
        mov dx, offset archivo_de_ventas 
        int 21  
        jc existeVenta 
        jmp sigueReadV
        existeVenta:
            mov ah, 3C
            mov cx , 0000      
            mov dx, offset archivo_de_ventas 
            int 21                   
        sigueReadV:
            mov [handle_ventas], AX
            mov BX, [handle_ventas]
            mov CX, 00 
            mov DX, 00
            mov AL, 02
            mov AH, 42
            int 21
            mov CX, 021
            mov DX, offset cod_descripcion
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset dia
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset mes
            mov AH, 40
            int 21
            mov CX, 04
            mov DX, offset anio
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset hora
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset minuto
            mov AH, 40
            int 21  
            mov CX, 05
            mov DX, offset cod_prod
            mov AH, 40
            int 21
            mov CX, 0002
            mov DX, offset num_ventas
            mov AH, 40   
            int 21    
            mov AH, 3e
            int 21
            Inc IncItem
            jmp MenuVENTAS


guardar_datototal:
      mov ah, 3D
            mov al, 02
            mov dx, offset archivo_de_ventas_2
            int 21
            jc existeVenta2
            jmp sigueReadV2
            existeVenta2:
                mov ah, 3C
                mov cx , 0000
                mov dx, offset archivo_de_ventas_2
                int 21
            sigueReadV2:
                mov [handle_ventas2],AX
                mov BX, [handle_ventas2]
                mov CX, 00
                mov DX, 00
                mov AL, 02
                mov AH, 42
                int 21
                mov CX, 02
                mov DX, offset dia
                mov AH, 40
                int 21

            mov CX, 02
            mov DX, offset mes
            mov AH, 40
            int 21
            mov CX, 04
            mov DX, offset anio
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset hora
            mov AH, 40
            int 21
            mov CX, 02
            mov DX, offset minuto
            mov AH, 40
            int 21
            mov CX, 04
            mov DX, offset Ventas_totales
            mov ah,40
            int 21
            mov AH, 3e
            int 21
            ret

menu_de_herramientas:
   
    imprimir_pantalla catalogo_completo 
    imprimir_pantalla Reporte_alfabetico 
    imprimir_pantalla Productos_sin_existencias
    imprimir_pantalla texto_volver

    imprimir_pantalla prompt
    mov AH, 08
    int 21h
    cmp Al, 63
    je generar_catalogo
    cmp Al, 61
    je generar_reporte_alfabetico
    cmp Al, 76
    je generar_reporte_ventas
    cmp Al, 70
    je ReporteFalta
    cmp Al, 76
    je Menu
    jmp menu_de_herramientas

generar_reporte_productos:
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla msg_sin_existencias
    imprimir_pantalla nueva_linea_texto
    jmp fin

generar_reporte_ventas:
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla msg_ventas
    imprimir_pantalla nueva_linea_texto
    mov contador_ventas , 00
    mov ah, 3D
    mov al, 02
    mov dx, offset archivo_de_ventas_2
    int 21
    mov [handle_ventas2], AX

ciclo_contar_ventas:
 
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset dia
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset mes
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 04
    mov DX, offset anio
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset hora
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset minuto
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 04
    mov DX, offset Ventas_totales
    mov AH, 3F
    int 21
    cmp AX, 0000
    je obtenemos_conteo
    mov AL,00
    cmp [dia], AL
    je seguir_contando
    jmp seguir_contando

seguir_contando:
    inc contador_ventas
    jmp ciclo_contar_ventas
obtenemos_conteo:
    mov AH, 3e
    int 21
    ObtenerFecha
    ObtenerHora
    mov ah, 3c
    mov CX, 0000
    mov dx, offset file_reporte_ventas
    int 21
    mov [handle_reportes], AX
    mov [handle_reportes], AX
    mov BX , AX
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset token_menor
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 02
    mov DX, offset dia
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset diagonal
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 02
    mov DX, offset mes
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset diagonal
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 04
    mov DX, offset anio
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset token_mayor
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset espacio
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset token_menor
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 02
    mov DX, offset hora
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset dos_puntos
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 02
    mov DX, offset minuto
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset token_mayor
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset nueva_linea_texto
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 32
    mov DX, offset nueva_linea_texto
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 01
    mov DX, offset nueva_linea_texto
    int 21
    mov BX, [handle_reportes]
    mov AH, 40
    mov CH, 00
    mov CL, 11
    mov DX, offset ultimas_ventas
    int 21
    jmp imprimir_ventas_menor
    mov ax, [contador_ventas]
    call numAcadena2
    mov bx, 0001
    mov cx, 0005
    mov dx, offset numero
    mov ah, 40
    int 21
    jmp fin

 imprimir_ventas_menor:
        mov ah, 3D
        mov al, 02
        mov dx, offset archivo_de_ventas_2
        int 21
        mov [handle_ventas2], AX

recorrer_venta22:
     mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset dia
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset mes
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 04
    mov DX, offset anio
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset hora
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 02
    mov DX, offset minuto
    mov AH, 3F
    int 21
    mov BX, [handle_ventas2]
    mov CX, 04
    mov DX, offset Ventas_totales
    mov AH, 3F
    int 21
    cmp AX, 0000
    je fin_conteo
    mov AL,00
    cmp [dia], AL
    je recorrer_venta22
    call ciclo_escribir_ventas
    jmp recorrer_venta22

    


ciclo_escribir_ventas:
    mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 07
    mov DX, offset Fecha_33
    int 21
 
   mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 02
    mov DX, offset dia
    int 21

       mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset diagonal
    int 21
    
      mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 02
    mov DX, offset mes
    int 21

        mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset diagonal
    int 21

         mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 04
    mov DX, offset anio
    int 21

    mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset espacio
    int 21
    
    mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 02
    mov DX, offset hora
    int 21

       
    mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset dos_puntos
    int 21

        mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 02
    mov DX, offset minuto
    int 21

          mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset nueva_linea_texto
    int 21
    

    mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 07
    mov DX, offset Monto_total
    int 21
    
       mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 07
    mov DX, offset Monto_total
    int 21

         mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset espacio
    int 21
    
    mov AX, Ventas_totales
    call numAcadena2
          mov BX, [handle_reportes]
       mov AH,40
    mov CH, 00
    mov CL, 05
    mov DX, offset numero
    int 21


       mov BX, [handle_reportes]
    mov AH,40
    mov CH, 00
    mov CL, 01
    mov DX, offset nueva_linea_texto
    int 21
    ret
    

fin_conteo:
    mov AH, 3e
            int 21
 
    jmp Menu
    
imprimir_ventas_mayor:

    mov ax, [contador_ventas]
    sub ax, 05
    call numAcadena2
    mov bx, 0001
    mov cx, 0005
    
    imprimir_pantalla usac
    jmp fin


generar_reporte_alfabetico:
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla msg_alfabetico
    imprimir_pantalla nueva_linea_texto
    jmp buscar_abecedario
    jmp fin



buscar_abecedario:
    mov AL, 02
    mov AH, 3D
    mov DX, offset archivo_prods
    int 21
    mov [handle_prods], AX
    mov SI,0
    mov contador_a , 0
    mov contador_b , 0
    mov contador_c , 0
    mov contador_d , 0
    mov contador_e , 0
    mov contador_f , 0
    mov contador_g , 0
    mov contador_h , 0
    mov contador_i , 0
    mov contador_j , 0
    mov contador_k , 0
    mov contador_l , 0
    mov contador_m , 0
    mov contador_n , 0
    mov contador_o , 0
    mov contador_p , 0
    mov contador_q , 0
    mov contador_r , 0
    mov contador_s , 0
    mov contador_t , 0
    mov contador_u , 0
    mov contador_v , 0
    mov contador_w , 0
    mov contador_x , 0
    mov contador_y , 0
    mov contador_z , 0



ciclo_buscar_abecedario:
  inc SI
    mov BX, [handle_prods]
    mov CX, 05
    mov DX, offset cod_prod
    mov AH,3F
    int 21
    mov BX, [handle_prods]
    mov CX, 21
    mov DX, offset cod_descripcion
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_price
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 0002
    mov DX, offset num_units
    mov AH, 3F
    int 21
    cmp AX, 0000
    je fin_mostrar1
	mov AL, 00
	cmp [cod_prod], AL
	je ciclo_buscar_abecedario
	call buscar_letra
	jmp ciclo_buscar_abecedario

buscar_letra:
    mov DI, offset cod_descripcion

ciclo_buscar:
    mov Al, [DI]
    inc DI 
    mov Al, 24
    mov[DI], AL
    mov AL, cod_descripcion
    cmp AL, 41
    je sumar_a
    cmp AL, 42
    je sumar_b
    cmp AL, 43
    je sumar_c
    cmp AL, 44
    je sumar_d
    cmp AL, 45
    je sumar_e
    cmp AL, 46
    je sumar_f
    cmp AL, 47
    je sumar_g
    cmp AL, 48
    je sumar_h
    cmp AL, 49
    je sumar_i
    cmp AL, 4A
    je sumar_j
    cmp AL, 4B
    je sumar_k
    cmp AL, 4C
    je sumar_l
    cmp AL, 4D
    je sumar_m
    cmp AL, 4E
    je sumar_n
    cmp AL, 4F
    je sumar_o
    cmp AL, 50
    je sumar_p
    cmp AL, 51
    je sumar_q
    cmp AL, 52
    je sumar_r
    cmp AL, 53
    je sumar_s
    cmp AL, 54
    je sumar_t
    cmp AL, 55
    je sumar_u
    cmp AL, 56
    je sumar_v
    cmp AL, 57
    je sumar_w
    cmp AL, 58
    je sumar_x
    cmp AL, 59
    je sumar_y
    cmp AL, 5A
    je sumar_z
    cmp AL, 61
    je sumar_a
    cmp AL, 62
    je sumar_b
    cmp AL, 63
    je sumar_c
    cmp AL, 64
    je sumar_d
    cmp AL, 65
    je sumar_e
    cmp AL, 66
    je sumar_f
    cmp AL, 67
    je sumar_g
    cmp AL, 68
    je sumar_h
    cmp AL, 69
    je sumar_i
    cmp AL, 6A
    je sumar_j
    cmp AL, 6B
    je sumar_k
    cmp AL, 6C
    je sumar_l
    cmp AL, 6D
    je sumar_m
    cmp AL, 6E
    je sumar_n
    cmp AL, 6F
    je sumar_o
    cmp AL, 70
    je sumar_p
    cmp AL, 71
    je sumar_q
    cmp AL, 72
    je sumar_r
    cmp AL, 73
    je sumar_s
    cmp AL, 74
    je sumar_t
    cmp AL, 75
    je sumar_u
    cmp AL, 76
    je sumar_v
    cmp AL, 77
    je sumar_w
    cmp AL, 78
    je sumar_x
    cmp AL, 79
    je sumar_y
    cmp AL, 7A
    je sumar_z
    jmp ciclo_buscar_abecedario


sumar_a:
    inc contador_a
    jmp ciclo_buscar_abecedario
sumar_b:
    inc contador_b
    jmp ciclo_buscar_abecedario
sumar_c:
    inc contador_c
    jmp ciclo_buscar_abecedario
sumar_d:
    inc contador_d
    jmp ciclo_buscar_abecedario
sumar_e:
    inc contador_e
    jmp ciclo_buscar_abecedario
sumar_f:
    inc contador_f
    jmp ciclo_buscar_abecedario
sumar_g:
    inc contador_g
    jmp ciclo_buscar_abecedario
sumar_h:
    inc contador_h
    jmp ciclo_buscar_abecedario
sumar_i:
    inc contador_i
    jmp ciclo_buscar_abecedario
sumar_j:
    inc contador_j
    jmp ciclo_buscar_abecedario
sumar_k:
    inc contador_k
    jmp ciclo_buscar_abecedario
sumar_l:
    inc contador_l
    jmp ciclo_buscar_abecedario
sumar_m:
    inc contador_m
    jmp ciclo_buscar_abecedario
sumar_n:
    inc contador_n
    jmp ciclo_buscar_abecedario
sumar_o:
    inc contador_o
    jmp ciclo_buscar_abecedario
sumar_p:
    inc contador_p
    jmp ciclo_buscar_abecedario
sumar_q: 
    inc contador_q
    jmp ciclo_buscar_abecedario
sumar_r:
    inc contador_r
    jmp ciclo_buscar_abecedario
sumar_s:
    inc contador_s
    jmp ciclo_buscar_abecedario
sumar_t:
    inc contador_t
    jmp ciclo_buscar_abecedario
sumar_u: 
    inc contador_u
    jmp ciclo_buscar_abecedario
sumar_v:
    inc contador_v
    jmp ciclo_buscar_abecedario
sumar_w:
    inc contador_w
    jmp ciclo_buscar_abecedario
sumar_x:
    inc contador_x
    jmp ciclo_buscar_abecedario
sumar_y:
    inc contador_y
    jmp ciclo_buscar_abecedario
sumar_z:
    inc contador_z
    jmp ciclo_buscar_abecedario

fin_mostrar1:
    ;; imprimir contador_j
   jmp generar_html_alfabetico

generar_html_alfabetico:
    mov numero , 0000
    ObtenerHora
    ObtenerFecha
    mov ah, 2
    int 21h
    mov AH, 3C
    mov CX, 0000
    MOV dx, offset archivo_reporte_abecedario
    int 21
    mov [manipulacion_repeticiones_1], AX
    mov BX,AX
    mov AH, 40
    mov CH, 00
    mov CL, [tam_encabezado_html]
    mov DX, offset encabezado_html
    int 21
    mov BX, [manipulacion_repeticiones_1]
    mov AH, 40
    mov CH, 00
    mov CL, [tam_inicializacion_tabla_alfabeto]
    mov DX, offset inicializacion_tabla_alfabeto
    int 21
    mov BX, [manipulacion_repeticiones_1]
    mov AH, 40
    mov CH, 00
    mov CL, 19
    mov DX, offset titulo_alfabeto
    int 21


    primer_abecedario letra_a, contador_a, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_b, contador_b, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_c, contador_c, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_d, contador_d, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_e, contador_e, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_f, contador_f, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_g, contador_g, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_h, contador_h, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_i, contador_i, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_j, contador_j, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_k, contador_k, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_l, contador_l, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_m, contador_m, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_n, contador_n, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_o, contador_o, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_p, contador_p, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_q, contador_q, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_r, contador_r, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_s, contador_s, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_t, contador_t, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_u, contador_u, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_v, contador_v, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_w, contador_w, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_x, contador_x, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_y, contador_y, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html
    
    primer_abecedario letra_z, contador_z, manipulacion_repeticiones_1, tr_html, td_html, tdc_html, trc_html

fin_mostrar_rep2:
		mov BX, [manipulacion_repeticiones_1]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla

		int 21
         mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 03
        mov DX, offset p_html
        int 21
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 05
        mov DX, offset msg_hora
        int 21
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21


        ;; escribir fecha
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset dia
        int 21

        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset mes
        int 21

        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset anio
        int 21

        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset guion
        int 21

        ;; escribir hora;;
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset hora
        int 21


        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset minuto
        int 21

     
        mov BX, [manipulacion_repeticiones_1]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset pc_html
        int 21
		;;
		mov BX, [manipulacion_repeticiones_1]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		;;
		mov AH, 3e
		int 21
		jmp Menu

generar_catalogo: 
    imprimir_pantalla nueva_linea_texto
    imprimir_pantalla msg_catalogo
    imprimir_pantalla nueva_linea_texto
    ObtenerHora
    ObtenerFecha
    mov ah, 2        
    int 21h   
    mov AH, 3c
	mov CX, 0000
	mov DX, offset archivo_reporte_catalogo
	int 21
	mov [repeticion_manipulacion], AX
	mov BX, AX
	mov AH, 40
	mov CH, 00
	mov CL, [tam_encabezado_html]
	mov DX, offset encabezado_html
	int 21
	mov BX, [repeticion_manipulacion]
	mov AH, 40
	mov CH, 00
	mov CL, [tam_inicializacion_tabla]
	mov DX, offset inicializacion_tabla
	int 21
    mov BX, [repeticion_manipulacion]
    mov AH, 40
    mov CH, 00
    mov CL, 1c
    mov DX, offset titulo_catalogo
    int 21
	mov AL, 02
	mov AH, 3d
	mov DX, offset archivo_prods
	int 21
	mov [handle_prods], AX
        
ciclo_mostrar_rep1:
    mov BX, [handle_prods]
    mov CX, 05
    mov DX, offset cod_prod
    mov AH,3F
    int 21
    mov BX, [handle_prods]
    mov CX, 21
    mov DX, offset cod_descripcion
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 02
    mov DX, offset num_price
    mov AH, 3F
    int 21
    mov BX, [handle_prods]
    mov CX, 02
    mov DX, offset num_units
    mov AH, 3F
    int 21
    cmp AX, 00
    je fin_mostrar_rep1
    mov AL, 00
    cmp [cod_prod], AL
    je ciclo_mostrar_rep1
    call imprimir_estructura_html
    jmp ciclo_mostrar_rep1
imprimir_estructura_html:
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		mov DX, offset cod_prod
		mov SI, 0000
ciclo_escribir_codigo:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_desc
		cmp SI, 0006
		je escribir_desc
		mov CX, 0001
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_codigo
escribir_desc:
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21

		mov DX, offset cod_descripcion
		mov SI, 0000
ciclo_escribir_desc:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_precio
		cmp SI, 0021
		je escribir_precio
		mov CX, 0001
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_desc
        
escribir_precio:
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 05
        mov DX, offset tdc_html
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset td_html
        int 21
        mov AX, [num_price]
        call numAcadena
        mov BX, 0000
        mov CX, 0002
        mov DX, offset numero
        mov SI, 0000
ciclo_escribir_price:
        mov DI, DX
        mov AL, [DI]
        cmp AL, 00
        je ciclo_escribir_unidades
        cmp SI, 02
        je ciclo_escribir_unidades
        mov CX, 0001
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        int 21
        inc DX
        inc SI
        jmp ciclo_escribir_price
ciclo_escribir_unidades:
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 05
        mov DX, offset tdc_html
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset td_html
        int 21
        mov AX, [num_units]
        call numAcadena
        mov BX, 0000
        mov CX, 0002
        mov DX, offset numero
        mov SI, 0000
ciclo_escribir_units:
        mov DI, DX
        mov AL, [DI]
        cmp AL, 00
        je cerrar_tags
        cmp SI, 02
        je cerrar_tags
        mov CX, 0001
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        int 21
        inc DX
        inc SI
        jmp ciclo_escribir_units
cerrar_tags:
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
		ret
fin_mostrar_rep1:
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla
		int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 03
        mov DX, offset p_html
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 05
        mov DX, offset msg_hora
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset dia
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset mes
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset anio
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset guion
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset hora
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset minuto
        int 21
        mov BX, [repeticion_manipulacion]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset pc_html
        int 21
		mov BX, [repeticion_manipulacion]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		mov AH, 3e
		int 21
		jmp Menu


comparar_claves:
    mov bh, buffer_de_salida[si]
    mov bl, cadena_clave[si]
    cmp bh, bl
    jnz cadenas_diferentes
    cmp bl, '$'
    jz cla_iguales
    inc si
    jmp comparar_claves

comparar_cadenas:
    mov bh, buffer_de_salida[si]
    mov bl, nombre_del_usuario[si]
    cmp bh, bl
    jnz cadenas_diferentes
    cmp bl, '$'
    jz cadenas_iguales
    inc si
    jmp comparar_cadenas

cadenas_iguales:

    jmp compare_clave

cla_iguales:
    cmp bh, 0
    jne salto_enter
    jmp cadenas_diferentes



cadenas_diferentes:
    imprimir_pantalla mensaje_de_error_cadenas
    jmp fin

salto_enter:
    imprimir_pantalla mensaje_de_credenciales_correctas
    MOV AH, 00h
    INT 16h
    CMP Al, 0Dh

    JNE salto_enter

    jmp Menu

imprimir_estructura:
    imprimir_pantalla nueva_linea_texto
    
    mov DI, offset cod_prod
ciclo_poner_dolar_1 :
    mov AL, [DI]
    cmp AL, 00

    je poner_dolar_1
    inc DI
    jmp ciclo_poner_dolar_1

poner_dolar_1:
    mov AL, 24
    mov[DI], AL
    imprimir_pantalla prompt_code
  
    imprimir_pantalla cod_prod
    imprimir_pantalla nueva_linea_texto
    mov DI, offset cod_descripcion
ciclo_poner_dolar_2 :
    mov AL, [DI]
    cmp AL, 00
    je poner_dolar_2
    inc DI
    jmp ciclo_poner_dolar_2


poner_dolar_2:
    mov AL, 24
    mov[DI], AL
    imprimir_pantalla prompt_des

    imprimir_pantalla cod_descripcion
    imprimir_pantalla nueva_linea_texto
   

    ret


		
chequear_caracter:

    analizador_lexico
    cmp [caracter], '[' 
    jne error_credenciales  
    analizador_lexico 
    cmp [caracter], 'c' 
    jne error_credenciales 
    analizador_lexico    
    cmp [caracter], 'r' 
    jne error_credenciales 
    analizador_lexico 
    cmp [caracter], 'e' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'd' 
    jne error_credenciales 
    analizador_lexico
    cmp [caracter], 'e' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'n' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'c' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'i' 
    jne error_credenciales 
    analizador_lexico
    cmp [caracter], 'a' 
    jne error_credenciales 
    analizador_lexico 
    cmp [caracter], 'l' 
    jne error_credenciales 
    analizador_lexico   
    cmp [caracter], 'e' 
    jne error_credenciales 
    analizador_lexico    
    cmp [caracter], 's' 
    jne error_credenciales 
    analizador_lexico    
    cmp [caracter], ']' 
    jne error_credenciales 
    analizador_lexico 
    cmp [caracter], 'u'
    je sig_linea
    jmp saltos_delinea
sig_linea:
    analizador_lexico  
    cmp [caracter], 's' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'u' 
    jne error_credenciales 
    analizador_lexico     
    cmp [caracter], 'a' 
    jne error_credenciales 
    analizador_lexico    
    cmp [caracter], 'r' 
    jne error_credenciales 
    analizador_lexico
    cmp [caracter], 'i' 
    jne error_credenciales 
    analizador_lexico    
    cmp [caracter], 'o' 
    jne error_credenciales 
salto_1: 
    analizador_lexico
    cmp [caracter], '='
    je next
    jmp saltos_delinea2
next:
    analizador_lexico
    cmp [caracter], '"'
    je next2
    jmp saltos_delinea3
next2:
    analizador_lexico
    cmp [caracter], '"'
    je next3
    jmp saltos_delinea3
next3: 
   analizador_lexico
    jmp saltos_delinea4

next4:
    analizador_lexico    
    cmp [caracter], 'l' 
    jne error_credenciales 
    analizador_lexico 
    cmp [caracter], 'a' 
    jne error_credenciales 
    analizador_lexico  
    cmp [caracter], 'v' 
    jne error_credenciales 
    analizador_lexico  
    je fin_lectura     
    cmp [caracter], 'e' 
    jne error_credenciales 
    jmp salto_1
    jmp fin_lectura

saltos_delinea:
    analizador_lexico     
    cmp [caracter], 'u'
    je sig_linea 
    jmp saltos_delinea

saltos_delinea2:
    analizador_lexico
    cmp [caracter], '='
    je next
    cmp [caracter], 20
    jne error_credenciales
    jmp saltos_delinea2
saltos_delinea3:
    analizador_lexico 
    cmp [caracter], '"'
    je next3
    jmp saltos_delinea3
saltos_delinea4:
    analizador_lexico   
    cmp [caracter], 'c'
    je next4
    jmp saltos_delinea4




fin_lectura:
    mov AH, 3Eh            
    mov BX, AX             
    INT 21h                
	jmp verificar_cadenas

error:
    mov ax, 4C01h 
    int 21h
    
error_credenciales:
    imprimir_pantalla mensaje_error_credenciales
    jmp fin


error_archivo:
    imprimir_pantalla mensaje_error_ubicacion_archivo 
    jc fin



;; resetea 
memset:
ciclo_memset:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo_memset
		ret

        
cadenaAnum:
    mov AX, 0000    
    mov CX, 0002    

seguir_convirtiendo:
    mov BL, [DI]
    cmp BL, 00
    je retorno_cadenaAnum
    sub BL, 30      
    mov DX, 000a
    mul DX          
    mov BH, 00
    add AX, BX 
    inc DI          
    dec CX          
    jnz seguir_convirtiendo

retorno_cadenaAnum:
    ret



numAcadena2:
		mov CX, 0005
		mov DI, offset numero

ciclo_poner30sTotal:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30sTotal
        cmp ax,00
        je retorno_convertirAcadenaTotal
		mov CX, AX    
		mov DI, offset numero
		add DI, 0004

ciclo_convertirAcadenaTotal:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a

		je aumentar_siguiente_digito_primera_vezTotal
		loop ciclo_convertirAcadenaTotal
		jmp retorno_convertirAcadenaTotal


aumentar_siguiente_digito_primera_vezTotal:
		push DI


aumentar_siguiente_digitoTotal:
		mov BL, 30    
		mov [DI], BL
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a

		je aumentar_siguiente_digitoTotal
		pop DI         
		loop ciclo_convertirAcadenaTotal


retorno_convertirAcadenaTotal:
		ret

numAcadena:
		mov CX, 0002
		mov DI, offset numero
        cmp AX, 0000
        je retornar_00


ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		mov CX, AX    
		mov DI, offset numero
		add DI, 0001
	
ciclo_convertirAcadena:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito_primera_vez
		loop ciclo_convertirAcadena
		jmp retorno_convertirAcadena

aumentar_siguiente_digito_primera_vez:
		push DI


aumentar_siguiente_digito:
		mov BL, 30    
		mov [DI], BL
		dec DI       
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito
		pop DI         
		loop ciclo_convertirAcadena


retorno_convertirAcadena:
		ret


retornar_00:
    mov DI, offset numero
    mov BL, 30
    mov [DI], BL
    inc DI
    mov [DI], BL
    ret


cadenas_iguales1:
ciclo_cadenas_iguales:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo_cadenas_iguales
		mov DL, 0ff
		ret

no_son_iguales:	mov DL, 00
		ret


ReporteFalta:
        ObtenerHora
        ObtenerFecha

		mov AH, 3c
		mov CX, 0000
		mov DX, offset archivo_falta
		int 21

		mov [handle_falta], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [tam_encabezado_html]
		mov DX, offset encabezado_html
		int 21
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_inicializacion_tabla2]
		mov DX, offset inicializacion_tabla2
		int 21
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		mov [handle_prods], AX



ciclo_ReporteFalta:

		mov BX, [handle_prods]
		mov CX, 05    ;; leer 
		mov DX, offset cod_prod
		mov AH, 3f
		int 21


		mov BX, [handle_prods]
		mov CX, 21    
		mov DX, offset cod_descripcion
		mov AH, 3f
		int 21



		mov BX, [handle_prods]
		mov CX, 0002 ; LEER PRECIO
		mov DX, offset num_price
		mov AH, 3f
		int 21


		mov BX, [handle_prods]
		mov CX, 0002
		mov DX, offset num_units
		mov AH, 3f
		int 21
		
		cmp AX, 00
		je finCiclo_reporteFalta



		
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_ReporteFalta




		cmp word ptr [num_units], 0
		jz llamar_imprimir_falta
		jmp ciclo_ReporteFalta

llamar_imprimir_falta:
	call imprimir_estructura_FALTA
	jmp ciclo_ReporteFalta


finCiclo_reporteFalta:
		ObtenerFecha
		ObtenerHora

          mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 03
        mov DX, offset p_html
        int 21
        

         mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 28
        mov DX, offset titulo_falta
        int 21

          mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset pc_html
        int 21
           
		  mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 03
        mov DX, offset p_html
        int 21
        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 05
        mov DX, offset msg_hora
        int 21
        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21


        mov BX, [handle_falta]
         mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset dia
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset mes
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 01
        mov DX, offset diagonal
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset anio
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset guion
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset hora
        int 21

        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL , 01
        mov DX, offset dos_puntos
        int 21
        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 02
        mov DX, offset minuto
        int 21

     
 
  
        ;; cerrar hora
        mov BX, [handle_falta]
        mov AH, 40
        mov CH, 00
        mov CL, 04
        mov DX, offset pc_html
        int 21
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21


		mov AH, 3e
		int 21
        refrescar_consola
		imprimir_pantalla generado
		imprimir_pantalla nueva_linea_texto
		jmp menu_de_herramientas
imprimir_estructura_FALTA:
		
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		mov DX, offset cod_prod
		mov SI, 0000
ciclo_escribir_codigo_falta:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_nombre_falta
		cmp SI, 05
		je escribir_nombre_falta
		mov CX, 0001
		mov BX, [handle_falta]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_codigo_falta

escribir_nombre_falta:
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		mov DX, offset cod_descripcion
		mov SI, 0000
ciclo_escribir_nombre_falta:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribirPrecioFalta
		cmp SI, 21
		je escribirPrecioFalta
		mov CX, 0001
		mov BX, [handle_falta]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_nombre_falta

escribirPrecioFalta:
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		mov AX, [num_price]


		call numAcadena
		mov BX, 0000
		mov CX, 0002
		mov DX, offset numero
		mov SI, 0000



ciclo_escribirPrecioFalta:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribirUnidadesFalta
		cmp SI, 0002
		je escribirUnidadesFalta
		mov CX, 0001
		mov BX, [handle_falta]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribirPrecioFalta
escribirUnidadesFalta:
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		


		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
	
		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21




		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21

		mov BX, [handle_falta]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		ret



fin:
imprimir_pantalla mensaje_de_despedida
.EXIT
END
