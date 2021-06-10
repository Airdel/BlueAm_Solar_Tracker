.model
.stack
.data 

    nombre    db 16,0,16 dup ('$')
    msjN      db 'Ingresa tu nombre: $'
    comprueba db 10,13,'Bienvenido a Blue Ametyst: $'
    

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
CADENA_COLOR MACRO cadena,long,ren,col,pag,modo,color
        MOV AH,19
        LEA BP,cadena   ;Cadena
        MOV CX,long     ;longitud de cadena
        MOV DH,ren      ;Renglon
        MOV DL,col      ;columna
        MOV BH,pag      ;pagina
        MOV AL,modo     ;modo
        MOV BL,color    ;Atributo (Color)
        INT 10H
CADENA COLOR ENDM

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