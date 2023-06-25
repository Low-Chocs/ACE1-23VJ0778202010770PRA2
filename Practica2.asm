.model small
.RADIX 16
.stack 


.data 
    usac       db    "Universidad de San Carlos de Guatemala",0a,"$"
    facultad   db    "Facultad de Ingenieria",0a,"$"
    curso      db    "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
    nombre     db    "Nombre: Luis Mariano Moreira Garcia",0a,"$"
    carne      db    "Carnet: 202010770",0a,"$"
    menu_productos db "(P)roductos", 0a, "$"
    menu_ventas db "(V)entas", 0a, "$"
    menu_herramientas db "(H)erramientas", 0a, "$"
    texto_salir db "(S)alir", 0a, "$"
    salto_de_linea db 0a,"$"
    user db "lmoreira"
    password db "202010770"
    solicitud_codigo db "Codigo: ","$"
    solicitud_nombre db "Nombre: ","$"
    handle_conf            dw     0000
    buffer_de_entrada db 20, 00
        db 20 dup(0)
    codigo_producto    db    05 dup (0)
    codigo_nombre    db    21 dup (0)
    codigo_precio   db    05 dup (0)
    codigo_unidades   db    05 dup (0)
.code
    	MOV ax, @data
    	MOV ds, ax 


        

Header:
		mov DX, offset usac
		mov AH, 09
		int 21
		mov DX, offset facultad
		mov AH, 09
		int 21
		mov DX, offset curso
		mov AH, 09
		int 21
		mov DX, offset nombre
		mov AH, 09
		int 21
		mov DX, offset carne
		mov AH, 09
		int 21

Menu:
    mov DX, offset menu_productos
	mov AH, 09
	int 21
    mov DX, offset menu_ventas
	mov AH, 09
	int 21
    mov DX, offset menu_herramientas
	mov AH, 09
	int 21
    mov DX, offset texto_salir
	mov AH, 09
	int 21
    
    mov AH, 01  ;Se lee el caracter ingresado y se almacena en AH
    int 21

    mov DX, offset salto_de_linea
	mov AH, 09
	int 21

    cmp AL, 70
	je pedir_de_nuevo_codigo
    cmp AL, 50
	je pedir_de_nuevo_codigo
    cmp AL, 56
	je Menu_de_Ventas
    cmp AL, 76
    je Menu_de_Ventas
    cmp AL, 48
	je Menu_de_Herramientas
    cmp AL, 68
    je Menu_de_Herramientas
    cmp AL, 63
	je Terminamos
    cmp AL, 73
    je Terminamos
    jmp Menu

Menu_de_Productos:
    mov DX, offset menu_productos
	mov AH, 09
	int 21
    jmp Menu
Menu_de_Ventas:
    mov DX, offset menu_ventas
	mov AH, 09
	int 21
    jmp Menu
Menu_de_Herramientas:
    mov DX, offset menu_herramientas
	mov AH, 09
	int 21
    jmp Menu

pedir_de_nuevo_codigo:
		mov DX, offset solicitud_codigo
		mov AH, 09
		int 21
        
		mov DX, offset buffer_de_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_de_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_codigo
		cmp AL, 05
		jb  aceptar_tam_cod  ;; jb --> jump if below
		mov DX, offset salto_de_linea
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod:
		mov SI, offset codigo_producto
		mov DI, offset buffer_de_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset salto_de_linea
		mov AH, 09
		int 21
        jmp pedir_de_nuevo_nombre

pedir_de_nuevo_nombre:
		mov DX, offset solicitud_nombre
		mov AH, 09
		int 21
		mov DX, offset buffer_de_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del nombre no sea mayor a 20
		mov DI, offset buffer_de_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_nombre
		cmp AL, 20
		jb  aceptar_tam_nom
		mov DX, offset salto_de_linea
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_nombre
		;;; mover al campo codigo en la estructura producto
aceptar_tam_nom:
		mov SI, offset codigo_nombre
		mov DI, offset buffer_de_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_nombre:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset salto_de_linea
		mov AH, 09
		int 21



    
Terminamos:
    .exit
  
end 