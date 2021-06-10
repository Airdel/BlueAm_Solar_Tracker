;/**********************************************************************************\
;|			4 PAOLA MONSERRAT DIAZ BRISENO
;|			8 DARIEN RAFEL MARQUEZ VAZQUEZ
;|			Hora: 11:00 a.m.
;\**********************************************************************************/
;Inclusión de Librerias de Macros
include Utilerias.LIB
include Motor_Solar.LIB
.model small
.stack
.data 

    nombre    db 16,0,16 dup ('$')
    msjN      db 'Ingresa tu nombre: $'
    comprueba db 10,13,'Bienvenido a Blue Ametyst: $'
    msjContinuar    db  'Presione cualquier tecla para continuar...'
    ruta            db 'C:\4_8_ProyectoU3\',0
    ruta1           db 'C:\4_8_ProyectoU3\BlueAM',0
    ruta2           db 'C:\4_8_ProyectoU3\BlueAM\Reporte.txt',0
     
    msjIni          db 'Creando directorio...',10,13,'$'
    msjSi           db 'Se ha creado el directorio',10,13,'$'
    msjNO           db 'No se ha creado el directorio',10,13,'$'
     
    msjSiEscribir   db 'Se ha escrito en el archivo. Verifique$'
    msjNoEscribir   db 'No se ha podido ESCRIBIR en el archivo. Verifique$'
      
    msjNOLeer       db 'NO se ha podido leer el archivo'
    msjNOAbrir      db 'NO se ha podido abrir el archivo'
    

    msjSalida       db 10,13, 'Datos le',161,'dos del archivo:',10,13
    leido           db 500 dup('$')    

    ;--DATOS DE ESCRITURA--
    datosBlueAm      db 'Movimiento Registrado, verificar estado del panel!' ;Datos a escribir en el archivo
    totalEscribir   dw  45
    manejador       dw  0  
;* l o g o-- *********************************************************************
                                                                                       
logo   db 'B#KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKNBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'
logo1  db 'BA***********************************************************************rrPBBP2QBBBBBgPUAsyC]U6RBBBBBQmhQBBBBB'
logo2  db 'B]***********************************************************************r*PBBBbzgBb]v!--------!rLoDBQ25QBBBBBB'
logo3  db 'B]r************************************************************************]25#BBDc---------------/rtdBBQPhZQBB'
logo4  db 'B]r************************************************************************PBDkQh!--------<U}------!r*2QdmgBBBB'
logo5  db 'B]**!           r******;::!***********!  !***********  r****             !rzKNBW---------rm#RI------!rr]BQDmU9B'
logo6  db 'B]**;  ~****r!   ;r****!  !***********!  !***********  1****   !***********%RMQv---------id#Rk-------|rrmQ#MBBB'
logo7  db 'B]**;  ~*****r!  ^***r*!  !***********!  !***********  1****   !**r**r***rr]PQb----1r!---!2RD?---!rr-!rrAB#mmmB'
logo8  db 'B]**;  ~**r**/~  !*****!  !***********!  !***********  1****   !*********rrS#B#!---oDW%s|-!h?--vwDR%-!rrhBgDDWB'
logo9  db 'B]**;  ~~~~~:::^r**r***!  !***********!  !***********  1****            ***SK#B7---*9pbRPr-n*-YK#RD?-/r*DQPD@BB'
logo10 db 'B]**;  :!+!!;:;;rr****!!  ***********!!  ***********~  *****   !+!+!++/*rrzPgB#!---!7hK#2!n*?dD9Cr--!r*UBQp%w%B'
logo11 db 'B]**;  ~*******;  _r***!  !***********!  :r*********r  1****   !**********rPQb9Qm1------|?7]yir!---|rv9Bp6QBBBB'
logo12 db 'B]**;  ~*******!  ~****!  !***********r  :+*********+  *****   !r********r*zwKQBQQZv-------**----!riZQQBBbZZQBB'
logo13 db 'B]**;  ~*r***r*   !****!  !rrrr*rr*****  ::r***r*r::   *****   !r*********rPBBQ%z@BBW2L!---**-!|thpQBQA2RBBBBBB'
logo14 db 'B]r*;          .;r*rr**!          |***r:               *****             +rPBB69BBBBBBQ?**!Y>1**PbQBBBBpUQBBBBB'
logo15 db 'B]*********r***************************r*r**r|++|1******r****r************rPBBBBBBBBB%7i???iii??cubBBBBBBBBBBBB'
logo16 db 'B]r************************************************************************PBBBBBBBBBQq!~~------#BBBBBBBBBBBBBB'
logo17 db 'B]*************************************************************************PBBBBBBBBBbe*!!!!/rr*tybBBBBBBBBBBBB'
logo18 db 'B]*************************************************************************PBBBBBBBBBK]?!-------kKQBBBBBBBBBBBB'
logo19 db 'B]*************************************************************************PBBBBBBBBBBBbL!**!!*wBBBBBBBBBBBBBBB'
logo20 db 'BgbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbQBBBBBBBBBBRbbNBBBBBBBBBBBBBBBBBBBBB'
logo21 db 'BBBBR ;KBBBBBBBi;KBBBBBBBBBK  gBBW^;tttttY%Utttt~;ttttoQBv-9BBBBBBj ]BB]~rMBBBBQ|9B#>rc}nxrCQBSt    *YttteBBBBB'
logo22 db 'BBBQ+< ^DBBBBBBr~~mBBBBBBBm  -RBBK  BBBBBBBBBBBB  BBBBBBB+ SBBBBBBx yBBBj  RBBR 5BB?-PBBBBDjRBBBBBK.*BBBBBBBBBB'
logo23 db 'BBQ jB ~ PBBBBB*m> ]BBBBBzrd~-RBBK  USSUUpBBBBBB  BBBBBBB+ iSUSUUU/ yBBBB6~ %Z 9BBBD/.;>smQBBBBBBBK.*BBBBBBBBBB'
logo24 db 'BB?iBBBP ~WBBBBrKQ? }BBB}>Qg--RBBK  SSSSUpBBBBBB  BBBBBBB+ iUUUUUU/ }BBBBBD   pBBBBBBM%j*. rDBBBBBq.*BBBBBBBBBB'
logo25 db 'Bt 7Ytttv _bBBBrKBBc xQ7iQBR--RBBK  BBBBBBBBBBBB  BBBBBBB+ SBBBBBBx yBBBBBB   BBBBQ5#BBBBBo.!BBBBBK.*BBBBBBBBBB'
logo26 db '2 RBBBBBBS ;#BBrKBBBt ;7QBBR~~RBBK  bbbbbb@BBBBB  BBBBBBB+ SBBBBBBx yBBBBBB   BBBBQr;Z@BB#7.sBBBBBK.*BBBBBBBBBB'
logo27 db 'hbBBBBBBBB%YPBB9gBBBBo]BBBBQ]]QBBgjYYttttt%BBBBBCeBBBBBBBZu#BBBBBBPtpBBBBBBdtPBBBBBBP}cttiCbBBBBBBgySBBBBBBBBBB'                                                                                       

;*END - l o g o *****************************************************************
    
                

    bienvenida      db  ' Bienvenidos a Blue Amethyst!   '
    proceso         db  'Ventana de menu'
;*****************************************************
;                   MACROS                            

;*****************************************FIN MACROS**    
.code
inicio:
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
       ;CADENA_COLOR MACRO cadena,long,ren,col,pag,modo,color
        CADENA_COLOR        logo , 150,  0,  0,  0,  0,   1EH
	    CADENA_COLOR        logo1, 150,  1,  0,  0,  0,   1EH
	    CADENA_COLOR        logo2, 150,  2,  0,  0,  0,   1EH
	    CADENA_COLOR        logo3, 150,  3,  0,  0,  0,   1EH
	    CADENA_COLOR        logo4, 150,  4,  0,  0,  0,   1EH
	    CADENA_COLOR        logo5, 150,  5,  0,  0,  0,   1EH
	    CADENA_COLOR        logo6, 150,  6,  0,  0,  0,   1EH
	    CADENA_COLOR        logo7, 150,  7,  0,  0,  0,   1EH
	    CADENA_COLOR        logo8, 150,  8,  0,  0,  0,   1EH
	    CADENA_COLOR        logo9,  150,  9, 0,  0,  0,   1EH
	    CADENA_COLOR        logo10, 150,  10,  0,  0,  0, 1EH
	    CADENA_COLOR        logo11, 150,  11,  0,  0,  0, 1EH
	    CADENA_COLOR        logo12, 150,  12,  0,  0,  0, 1EH
	    CADENA_COLOR        logo13, 150,  13,  0,  0,  0, 1EH
	    CADENA_COLOR        logo14, 150,  14,  0,  0,  0, 1EH
	    CADENA_COLOR        logo15, 150,  15,  0,  0,  0, 1EH
	    CADENA_COLOR        logo16, 150,  16,  0,  0,  0, 1EH
	    CADENA_COLOR        logo17, 150,  17,  0,  0,  0, 1EH
	    CADENA_COLOR        logo18, 150,  18,  0,  0,  0, 1EH
	    CADENA_COLOR        logo19, 150,  19,  0,  0,  0, 1EH
	    CADENA_COLOR        logo20, 150,  20,  0,  0,  0, 1EH
	    CADENA_COLOR        logo21, 150,  21,  0,  0,  0, 1EH
	    CADENA_COLOR        logo22, 150,  22,  0,  0,  0, 1EH
	    CADENA_COLOR        logo23, 150,  23,  0,  0,  0, 1EH
	    CADENA_COLOR        logo24, 150,  24,  0,  0,  0, 1EH
	    CADENA_COLOR        logo25, 150,  25,  0,  0,  0, 1EH
	    CADENA_COLOR        logo26, 150,  26,  0,  0,  0, 1EH
	    CADENA_COLOR        logo27, 150,  27,  0,  0,  0, 1EH
	   
	    ;ACTIVAR PAG1
	    CALL TECLA
	        MOV AH,5
	        MOV AL,1
	        INT 10H
	    CADENA_COLOR        bienvenida,   40,  0, 40,  1,  0,   2  
	    CALL CLEAN_SCREEN
	    ;ACTIVAR PAG2
	    CALL TECLA
	        MOV AH,5
	        MOV AL,2
	        INT 10H
	    CADENA_COLOR        proceso,    40, 0,  40,    1,  0,  2
	    
	    ;-------------BIENVENIDA CON NOMBRE 
	    
	    ;Imprimir el mensaje 
         MOV AH,9
         LEA DX,msjN
         INT 21H 
         
            ;Lectura de cadena
            MOV AH,10
            LEA DX,nombre
            INT 21H
                    ;Comprueba la lectura de cadena
                    MOV AH,9
                    LEA DX,comprueba
                    INT 21H 
                        
                        ;Imprimir la cadena LEIDA
                        MOV AH,9
                        LEA DX, nombre+2 ;+2 por los byte de control
                        INT 21H
		    ;ACTIVAR PAG2
	    #start=stepper_motor.exe# 
	    ;---
        pasos = 02h ; 32 (decimal)       
datcw   db 0000_0011b
        db 0000_0110b
        db 0000_1100b
        db 0000_1001b
        
        MOV CX,pasos           ;inicializa el contador con el numero de pasos
MOTOR_INICIO: MOV BX, offset datcw ;inicializa el apuntado
        MOV SI,0             ;inicializa el contador
SIGUIENTE_PASO:
WAIT:   IN AL,07H            ;obtiene la informacion del puerto 07H
        TEST AL,10000000b
        JZ WAIT
        MOV AL, [BX][SI]
        OUT 7, AL
        INC SI
        CMP SI, 4
        JC SIGUIENTE_PASO
        MOV SI,0
        DEC CL
        JZ EscrituraReporte1
        JMP SIGUIENTE_PASO
EscrituraReporte1: ;escribir a archivo
	    ;---
	    ;MOTOR_CONTROL 15H
	    CALL TECLA
	        MOV AH,5
	        MOV AL,2
	        INT 10H
	    CADENA_COLOR        proceso,    40, 0,  40,    1,  0,  2

        ;--CREAR ARCHIVOS EN DIRECTORIO ALMACENADO EN LA VARIABLE ruta1
        
        MOV AH,39H
        LEA DX,ruta
        INT 21H 
        
        MOV AH,39H
        LEA DX,ruta1
        INT 21H
        
        jc errorCrear
        
        CADENA_SIN_COLOR msjSi

        ;--ESCRIBIR ARCHIVOS TXT 
        
        ;1. Abrir el archivo
            MOV AH,3DH    ;ABRIR ARCHIVO
            LEA DX,ruta2
            MOV AL,2  ;
            INT 21H
            MOV manejador,AX ;Recuperar ID
                
            JC errorAbrir
             
            ; Se pudo abrir: 
                
                MOV AH,40H          ;Escribir en el archivo
                MOV BX,manejador    
                MOV CX,totalEscribir 
                LEA DX,datosBlueAm  ; Escritura de datos generados por el sistema!
                INT 21H
                
            JC errorEscribir
            
                CADENA_SIN_COLOR msjSiEscribir
                CADENA_SIN_COLOR msjContinuar
                CALL TECLA
                CALL CLEAN_SCREEN
        ;--LECTURA DE ARCHIVOS TXT 
        
        ;1. Abrir el archivo
        mov ah,3dh
        lea dx,ruta2
        mov al,2  ;lectura/escritura
        int 21h
        
        mov manejador,ax 
        jc errorAbrir  
        
        ;2. Proceder a la lectura
        mov ah,3fh
        mov cx,15 ;caracteres a leer
        lea dx,leido
        mov bx,manejador    
        int 21h
        jc errorLeer 
        
        ;3. Mostrar datos en pantalla
        
        CADENA_SIN_COLOR msjSalida
        CADENA_SIN_COLOR leido
        CADENA_SIN_COLOR msjContinuar
        CALL TECLA
        CALL CLEAN_SCREEN
        jmp fin

errorCrear: 
    CADENA_SIN_COLOR msjNo
    CADENA_SIN_COLOR msjContinuar
    CALL TECLA
    CALL CLEAN_SCREEN        
errorAbrir: 
    CADENA_SIN_COLOR msjNOabrir
    jmp fin
    CADENA_SIN_COLOR msjContinuar
    CALL TECLA
    CALL CLEAN_SCREEN
    
errorEscribir:

    CADENA_SIN_COLOR msjNOEscribir      
    CADENA_SIN_COLOR msjContinuar
    CALL TECLA
    CALL CLEAN_SCREEN
errorLeer: 
    CADENA_SIN_COLOR msjNOleer
    CADENA_SIN_COLOR msjContinuar
    CALL TECLA
    CALL CLEAN_SCREEN
	
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