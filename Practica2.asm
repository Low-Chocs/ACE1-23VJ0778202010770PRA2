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
    salto_de_linea db 0a,"$"
; segemento de codigo    
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

    mov AH, 01
    int 21

    mov DX, offset salto_de_linea
	mov AH, 09
	int 21

    cmp AL, 70
	je Terminamos
    cmp AL, 50
	je Terminamos
    cmp AL, 56
	je Terminamos
    cmp AL, 76
    je Terminamos
    cmp AL, 48
	je Terminamos
    cmp AL, 68
    je Terminamos
    jmp Menu



Terminamos:
    .exit



  
end 