;*********************************************************************
;   Fecha: 13 Mayo 2021 
;*********************************************************************

.model
.stack
.data

;* B N L - l o g o-- *********************************************************************
                                                                                       
    logo1   db 'MMMMMMMMMMMMMMMMMWWNK0kdolc:;;,,,,,,,,,,;;:clodkOKNWWMMMMMMMMMMMMMMMMM'
    logo2   db 'MMMMMMMMMMMMMWNXOxoc;,,,,,,,,,,,,,,,,,,,,,*,,,,,,;coxOXWWMMMMMMMMMMMMM'
    logo3   db 'MMMMMMMMMMWN0xo:,,,,,*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:oxKNWMMMMMMMMMM'
    logo4   db 'MMMMMMMMWKxl;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;lkKWMMMMMMMM'
    logo5   db 'MMMMMMN0d:,,,,,;oxxxxxxxxxxxxxxxxxxxxdl:,,,,,,:dxxxxxxxxxo;,:d0NMMMMMM'
    logo6   db 'MMMMWKd;,,,,,,,lXWWMMMMMMMMMMMMMMMMMMWNKxc,,,;kWMMMMMMMMNk;,,,:dKWMMMM'
    logo7   db 'MMWXx:,,,,,,*,;kWMMMMMMMMMMMMMMMMMMMMMMMW0l,,lKWMMMMMMMMKl,,,,,,:xXWMM'
    logo8   db 'MWKo;,,,,,,,,,oXMMMMMMMMMWWWWWMMMMMMMMMMMW0:;kWMMMMMMMMWx;,,,,,,,;oKWM'
    logo9   db 'W0l,,,,,,,,,,:kWMMMMMMMMNkooooONMMMMMWXKKKkclXWMMMMMMMWKl,,,,,,,,,,l0W'
    logo10  db 'Ko,,,,,,,,,,,oXWMMMMMMMWO:,,,,c0WNOxdc;,,,,,;oONMMMMMMNx;,,,,,,,,,,,oK'
    logo11  db 'd;,,,,,,,,,,:OWMMMMMMMMXo,,,,ckXOc,.,cllc.,clox0WMMMWKc,,,,,,,,,,,,;d'
    logo12  db ':,,,,,,,,,,,oXMMMMMMMMMNOxxkOXNx,.''oXWWWOcxNWNx:xWMMNx;,,,,,,,,,,,,,:'
    logo13  db ',,,,,,,,,,,:OWMMMMMMMMMMMMMMMM0:..;oOMMMMWXNMMKc.:0MW0c,,,,,,,,,,,,,,,'
    logo14  db ',,,,,,,,,,,dNMMMMMMMMMWWWWWMMWk,..dKNMMMMMMMMWx,.,OWNd;,,,,,,,,,,,,,,,'
    logo15  db ',,,,,,,,,,c0WMMMMMMMMXkooddkXW0:.:0MMMNKNMMMMKc..:0W0c,,,,,,,,,,,,,,,,'
    logo16  db ';,,,,,,,,,dNMMMMMMMMWk;,,,,,lKNk:dXWWNx:xXNNNd..;kWNd,,,*,,,,,,,,,,,,;'
    logo17  db 'l,,,,,,,,c0WMMMMMMMWKl,,,.,;oXMW0xlcc:,.,::c:,,l0WMNkooooooooool;,,,,l'
    logo18  db 'O:,,,*,,;dNMMMMMMMMW0olllodONWMMMN0kdl:,,,;:lx0NMMMMMWWWWWWWWWNO:,,,:O'
    logo19  db 'Nk;,,,,,c0WMMMMMMMMMWWWWWWWMMMMMMMMMWNkk0KXNWMMMMMMMMMMMMMMMMMXo,*,:kN'
    logo20  db 'MNk:,,,;xNMMMMMMMMMMMMMMMMMMMMMMMMNX0oo0WMMMMMMMMMMMMMMMMMMMMWO:,,:kNM'
    logo21  db 'MMNOc,,lKWMMMMMMMMMMMMMMMMMMMWWNKkl:;;xNMMMMMMMMMMMMMMMMMMMMWXo,,cONMM'
    logo22  db 'MMMWKd:lkOOOOOOOOOOOOOOOOOkkkxoc;,,,,;dOOOOOOOOOOOOOOOOOOOOOOd::dKWMMM'
    logo23  db 'MMMMMW0d:,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,:o0NMMMMM'
    logo24  db 'MMMMMMMWKdc,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,cdKNMMMMMMM'
    logo25  db 'MMMMMMMMMWXOdc;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;cdOXWMMMMMMMMM'
    logo26  db 'MMMMMMMMMMMMWXOxl:;,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;:lxOXWMMMMMMMMMMMM'
    logo27  db 'MMMMMMMMMMMMMMMWWX0kdlc:;,,,,,,,,,,,,,,,,,,,,;:cldk0XWWMMMMMMMMMMMMMMM'
    logo28  db 'MMMMMMMMMMMMMMMMMMMMWNX0kdlc:;,,,,,,,,,;;:cldk0XNWMMMMMMMMMMMMMMMMMMMM'                                                                                       

;*END B N L - l o g o *****************************************************************
    
                

    bienvenida      db  ' Bienvenidos a BnL Systems!   '
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
        CADENA_COLOR        logo1, 70,  0,  0,  0,  0,   1EH
	    CADENA_COLOR        logo2, 70,  1,  0,  0,  0,   1EH
	    CADENA_COLOR        logo3, 70,  2,  0,  0,  0,   1EH
	    CADENA_COLOR        logo4, 70,  3,  0,  0,  0,   1EH
	    CADENA_COLOR        logo5, 70,  4,  0,  0,  0,   1EH
	    CADENA_COLOR        logo6, 70,  5,  0,  0,  0,   1EH
	    CADENA_COLOR        logo7, 70,  6,  0,  0,  0,   1EH
	    CADENA_COLOR        logo8, 70,  7,  0,  0,  0,   1EH
	    CADENA_COLOR        logo9, 70,  8,  0,  0,  0,   1EH
	    CADENA_COLOR        logo10, 70,  9, 0,  0,  0,   1EH
	    CADENA_COLOR        logo11, 70,  10,  0,  0,  0, 1EH
	    CADENA_COLOR        logo12, 70,  11,  0,  0,  0, 1EH
	    CADENA_COLOR        logo13, 70,  12,  0,  0,  0, 1EH
	    CADENA_COLOR        logo14, 70,  13,  0,  0,  0, 1EH
	    CADENA_COLOR        logo15, 70,  14,  0,  0,  0, 1EH
	    CADENA_COLOR        logo16, 70,  15,  0,  0,  0, 1EH
	    CADENA_COLOR        logo17, 70,  16,  0,  0,  0, 1EH
	    CADENA_COLOR        logo18, 70,  17,  0,  0,  0, 1EH
	    CADENA_COLOR        logo19, 70,  18,  0,  0,  0, 1EH
	    CADENA_COLOR        logo20, 70,  19,  0,  0,  0, 1EH
	    CADENA_COLOR        logo21, 70,  20,  0,  0,  0, 1EH
	    CADENA_COLOR        logo22, 70,  21,  0,  0,  0, 1EH
	    CADENA_COLOR        logo23, 70,  22,  0,  0,  0, 1EH
	    CADENA_COLOR        logo24, 70,  23,  0,  0,  0, 1EH
	    CADENA_COLOR        logo25, 70,  24,  0,  0,  0, 1EH
	    CADENA_COLOR        logo26, 70,  25,  0,  0,  0, 1EH
	    CADENA_COLOR        logo27, 70,  26,  0,  0,  0, 1EH
	    CADENA_COLOR        logo28, 70,  27,  0,  0,  0, 1EH
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