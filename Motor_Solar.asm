; suponiendo una entrada de datos al puerto 07H obtenidos de un convertidor analogo-digital
; se obtienen los siguientes datos referidos al movimiento necesario para el ajuste del motor
; entonces, haciendo uso del ensamblador, codificamos un bloque necesario
; para la activación y ejecución del motor que dirigue el panel para girarlo 180°
 
        #start=stepper_motor.exe#
steps = 02h ; 32 (decimal)       
datcw   db 0000_0011b
        db 0000_0110b
        db 0000_1100b
        db 0000_1001b
        
        MOV CX,steps           ;inicializa el contador con el numero de pasos
INICIO: MOV BX, offset datcw ;inicializa el apuntado
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
        JZ LOOP1
        JMP SIGUIENTE_PASO
LOOP1: HLT