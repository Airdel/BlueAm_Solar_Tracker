;/**********************************************************************************\
;|			4 PAOLA MONSERRAT DIAZ BRISENO
;|			8 DARIEN RAFEL MARQUEZ VAZQUEZ
;|			Hora: 11:00 a.m.
;\**********************************************************************************/
;Inclusión de Librerias de Macros
#start=stepper_motor.exe#
include utilerias.lib
include Motor_Solar.lib
.model small
.stack
.data 

    nombre              db 16,0,16 dup ('$')
    msjN                db 'Ingresa tu nombre: $'
    Bienvenida          db 10,13,'Bienvenido a Blue Amethyst: $'
    msjContinuar        db 'Presione cualquier tecla para continuar...'
    
     
    msj_C_Directorio    db  'Creando directorio...              $'
    msjSiDirectorio     db  'Se ha creado el directorio         $'
    msjNODirectorio     db  'No se ha creado el directorio      $'
    msjNOCrearArchivo   db  'No se ha podido crear el archivo   $'
    msjSICrearArchivo   db  'Se ha creado el archivo            $'
     
    msjSiEscribir   db 'Se ha escrito en el reporte. Verifique  $'
    msjNoEscribir   db 'No se ha podido escribir en el reporte. Verifique$'     
    msjNOLeer       db 'NO se ha podido leer el archivo         $'
    msjNOAbrir      db 'NO se ha podido abrir el archivo        $'
    msjSIAbrir      db 'Se ha abierto el archivo                $'
    

    msjDatosLeidos  db 10,13, 'Datos le',161,'dos del archivo:',10,13
    leido           db 2000 dup('$')
    rutaLogo        db 'C:\Logo.txt',0 
    ruta                db 'C:\BlueAM',0
    rutaArchivo         db 'C:\BlueAM\Reporte.txt',0
    ManejadorArchivos   dw 0    
    datcw   db  0000_0011b
            db  0000_0110b
            db  0000_1100b
            db  0000_1001b
    ;menu---------------------------------------------------------
    cad1    db  'Consola de control ',34,'BlueAM',34,'$'
    cad2    db  'Controles:$'
    cad3    db  '1.- Alineacion automatica$'
    cad4    db  '2.- Alinear 10 grados a la derecha$'
    cad5    db  '3.- Alinear 10 grados a la izquierda$'
    cad6    db  '4.- Salir.$'
    cad7    db  'Seleccione una opcion [ ]$'
    entrada db  0,'$'
    
    ;finmenu------------------------------------------------------
    
    ;--DATOS DE ESCRITURA--
    datosBlueAm     db 'Movimiento Registrado, verificar estado del panel!' ;Datos a escribir en el archivo
    totalEscribir   dw  45
    manejador       dw  0  
    proceso         db  'Menu Principal'
.code
inicio:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

;* impresion de l o g o-- *********************************************************************

    cambiar_pagina 1
    abrir_archivo rutaLogo,manejadorArchivos
    jc error_abrir_archivo
    leer_archivo manejadorArchivos,leido
    jc errorLeer
    ;Sin errores
        imprimir_cadena leido,1146,2,0,1,0,0ah
        cambiar_pagina 0 
;*END - l o g o *****************************************************************

creacion_directorio:
    imprimir_cadena msj_C_Directorio,35,21,1,0,0,0ah
    crear_carpeta ruta
    jc error_carpeta 
        crear_archivo rutaArchivo,manejadorArchivos 
    jc error_crear_archivo
        imprimir_cadena  msjSICrearArchivo,35,22,1,0,0,0ah
        ;apertura del archivo
    abrir_archivo rutaArchivo,ManejadorArchivos
    jc error_abrir_archivo 
	    imprimir_cadena msjSIAbrir,40,23,1,0,0,0ah
	    
imprimir_menu: ;impresion de menu principal
               ; (cadena,   longitud,   renglon,    columna,    pagina, modo,   color)
    imprimir_cadena cad1,   27,         1,          23,         0,      0,      0ah
    imprimir_cadena cad2,   10,         5,          23,         0,      0,      0ah
    imprimir_cadena cad3,   25,         7,          23,         0,      0,      0ah
    imprimir_cadena cad4,   34,         8,          23,         0,      0,      0ah
    imprimir_cadena cad5,   36,         9,          23,         0,      0,      0ah
    imprimir_cadena cad6,   10,         10,         23,         0,      0,      0ah
    imprimir_cadena cad7,   25,         12,         23,         0,      0,      0ah         
    MOV BX, offset datcw
recibir_entrada:
    cursor 12,46,0
    recibir_entrada
    mov entrada,al

;Comparacion de entradas y seleccion de opciones

;Alineacion automatica
CMP entrada,'1'
je automatico

;Alineacion 10 derecha
CMP entrada,'2'
je derecha10

;Alineacion 10 izquierda
CMP entrada,'3'
je izquierda10

;SALIR
CMP entrada,'4'
je fin

;   Alineacion automatica
automatico:

derecha10:
        MOV AX,0100H
        MOV DS,AX
        MOV DI,1100H
        MOV AX,0000H
        MOV CL,04H
        
                       ; 03 06 0C 09 PARA DERECHA
        MOV AX,03H
        MOV [DI],AX
        INC DI
        
        MOV AX,06H   
        MOV [DI],AX
        INC DI
        
        MOV AX,0CH
        MOV [DI],AX
        INC DI
        
        MOV AX,09H
        MOV [DI],AX
        INC DI
                           
        MOV CX,01H
START:  MOV BX,1100H
        MOV SI,0
NEXT_STEP:
        MOV AL,[BX][SI]
        OUT 7,AL
        INC SI
        CMP SI,4
        JC NEXT_STEP
        MOV SI,0
        DEC CL
        JZ LOOP1
        JMP NEXT_STEP
LOOP1: jmp recibir_entrada      



izquierda10:     
MOV AX,0100H
        MOV DS,AX
        MOV DI,1100H
        MOV AX,0000H
        MOV CL,04H
        
                       ; 03 06 0C 09 PARA DERECHA
                       
                       ; 09 0C 06 03 PARA IZQUIERDA
        MOV AX,09H
        MOV [DI],AX
        INC DI
        
        MOV AX,0CH   
        MOV [DI],AX
        INC DI
        
        MOV AX,06H
        MOV [DI],AX
        INC DI
        
        MOV AX,03H
        MOV [DI],AX
        INC DI
                           
        MOV CX,01H
START_I:  MOV BX,1100H
        MOV SI,0
NEXT_STEP_I:
        MOV AL,[BX][SI]
        OUT 7,AL
        INC SI
        CMP SI,4
        JC NEXT_STEP_I
        MOV SI,0
        DEC CL
        JZ LOOP1
        JMP NEXT_STEP_I
LOOP1_I: jmp recibir_entrada     

EscrituraReporte1: ;escribir a archivo
	    ;---
	    ;MOTOR_CONTROL 15H
	    TECLA
	        MOV AH,5
	        MOV AL,2
	        INT 10H
	                          ;(cadena,   longitud,   renglon,    columna,    pagina, modo,   color)
	    imprimir_cadena        msjSiEscribir, 40, 24,  40,    0,  0,  2
         
        escribir_archivo ManejadorArchivos,totalEscribir,datosBlueAm
        ;3. Mostrar datos en pantalla
        imprimir_cadena_sin_color msjContinuar
        TECLA

        jmp fin

;------------------Etiquetas

error_Carpeta:
    imprimir_cadena msjNODirectorio,24,20,1,0,0,0ah

error_crear_archivo:
    imprimir_cadena_sin_color msjNOCrearArchivo  
       
error_abrir_archivo: 
    imprimir_cadena_sin_color msjNOAbrir
    
errorEscribir:
    imprimir_cadena_sin_color msjNOEscribir

errorLeer: 
    imprimir_cadena_sin_color msjNOleer
    imprimir_cadena_sin_color msjContinuar
    TECLA

	
fin:
    MOV AX,4C00H
    INT 21H 
     
     
              
              
    ;****************************Seccion de procedimientos
    TECLA   PROC
            MOV AH,0
            INT 16H
        RET
       
    ENDP
    
    CLEAN_SCREEN PROC
    
        MOV AH,0FH  ;INTERRUPCION 15 DETECTA TIPO RESOLUCION (80X25 EN ESTE CASO)
        INT 10H     ;REGRESAR EL MODO EN <AL>
        MOV AH,0
        INT 10H
            RET        
        
    ENDP
    ;****************************Fin de procedimientos****
end 
