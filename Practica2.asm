.model small
.stack 


.data 
    msg db 'hello a todos! ',10,13,'$'
    usac       db    "Universidad de San Carlos de Guatemala",0a,"$"
    facultad   db    "Facultad de Ingenieria",0a,"$"
    curso      db    "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
    nombre     db    "Luis Mariano Moreira Garcia",0a,"$"
    carne      db    "202010770",0a,"$"
; segemento de codigo    
.code

    ; procedimiento principal main
	main PROC

        ; carga en memoria las variables del semento de datos
    	MOV ax, @data
    	MOV ds, ax  

        ; impresion por pantalla
		mov dx, offset msg
		mov ah, 9
    	int 21h   
    	.exit   

	main ENDP   

end main