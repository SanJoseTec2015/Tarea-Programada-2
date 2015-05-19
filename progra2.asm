;------------------------------------------------------------------------------------------------------------
;					2 TAREA PROGRAMADA ENSAMBLADOR
;				EVALUADOR DE EXPRESIONES MATEMATICAS
;					ISAAC CAMPOS MESEN 2014004626
;					
;					
;										ITCR 2015
;------------------------------------------------------------------------------------------------------------;

	section .bss							;Section containing uninitialized data

BUFLEN equ 1024					;We read the file 1024 bytes at a time
Buffer resb BUFLEN					;Text buffer itself

	section .data						;Section containing initialized data

;varIntToStringLEN	equ $ - varIntToString

entrada: db "Entrada = "
entradaLEN	equ $ - entrada

salida: db "Salida = "
salidaLEN equ $ - salida

varToOperate: db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 10

varToPrint: db 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 10

varOperadores : db '^', '%', '/', '*', '+', '-', 0h

varSymbol : db '$', 10

varInt : db '#', 10
;varIntToStringLEN	equ $ - varIntToString
varDebug: db 'ok', 10
varDebug2: db 'ok2', 10

	section .text						;Section containing code

global _start						;Linker needs this to find the entry point!

_start:

	call read

	call procesarEntrada

	call printVarToOperate

	call ponerAsteriscos

	call printVarToOperate

	call cambiarVariables

	call printVarToOperate

	call quitarParentesisSobrantes
	
	mov rsi, OperarParentesis
	call CicloPrincipal
	
	mov rsi, Operar
	call CicloPrincipal

	jmp done

;Read a buffer full of text from stdin:
read:
	call intronum

	mov rax, 0						;sys_read (code 0)
	mov rdi, 0						;file_descriptor (code 0 stdin)
	mov rsi, Buffer				;address to the buffer to read into
	mov rdx, BUFLEN			;maximun number of bytes to read
	syscall								;system call

	mov rbp, rax					;save the number of bytes read
	cmp rax, 0						;test if the number of bytes read is 0
		jz done							;jump to the tag done if it is 0

	;Setup the register for later use
	mov rsi, Buffer				;place the buffer address in the rsi
	xor rcx, rcx					;clear the rcx to 0
ret

;------------------------------------------------------------------------------------------------------------
;											procesarEntrada
;
;	Es el primer procedimiento llamado. recorre byte por byte la entrada
;	hasta la primer coma y lo almacena en el buffer varToOperate
;
;	E: RSI la direccion del buffer de entrada
;	S: RCX la poscion de inicio de las variables a leer
;	M: R14, RCX
;------------------------------------------------------------------------------------------------------------
procesarEntrada:
	xor r14, r14					;indice vartoOperate
	.nextChar:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]				;put a char/byte from the input buffer into the al. rsi = direccion buffer rcx = indice
		mov byte[varToOperate+r14], al
		inc r14										;indice varToOperate
		inc rcx											;indice buffer
		cmp byte[rsi + rcx], ','				;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
ret

;------------------------------------------------------------------------------------------------------------
;											ponerAsteriscos
;
;	recorre el buffer varToOperate y pone un asterisco en el lugar debido
;	ejemplo 3x-> 3*x, 3(2+2) -> 3*(2+2)
;------------------------------------------------------------------------------------------------------------
ponerAsteriscos:
	push rcx
	xor rcx, rcx
	.nextChar:
		mov al, byte [varToOperate + rcx]		;put a char/byte from the buffer into the al, rcx = indice
		call isOperador
		cmp r10, 0											;si no es un operador, salta a validar si debe poner asterisco
			jz validarPonerAsteriscos

		.continuar:											;punto de retorno del salto anterior anterior
		inc rcx													;indice
		cmp byte [varToOperate + rcx], 0h		;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
	pop rcx
ret

;------------------------------------------------------------------------------------------------------------
;											validarPonerAsteriscos
;
;	valida los casos donde no es necesario poner asteriscos, en caso de ser
;	necesario los agrega.
;	Usado por: ponerAsteriscos
;------------------------------------------------------------------------------------------------------------
validarPonerAsteriscos:
	push r8
	push rax

	cmp al, '('
		jz .exit

	cmp al, 0h
		jz .exit

	call isDigit
	mov r8, r10
	mov al, byte [varToOperate + rcx+1]
	call isDigit
	and r8, r10
	cmp r8, 1
		jz .exit													;en el caso en que el char actual y el siguiente es un numero, no hay que poner asteriscos

	call isOperador
	cmp r10, 1
		jz .exit

	cmp al, 0h												;validacion extra
		jz .exit

	cmp al, ')'
		jz .exit

	cmp al, ','
		jz .exit

	;se procede a poner el asterisco
	mov rdx, rcx											;parametro del procedimiento, el lugar al que hay que dejar libre
	call liberarByteVarToOperate
	inc rcx
	mov byte [varToOperate + rcx], '*'

	.exit:
		pop rax
		pop r8
jmp ponerAsteriscos.continuar

quitarParentesisSobrantes:
	push rcx

	xor rcx, rcx
	.nextChar:
		cmp byte [varToOperate + rcx], '('
			jz validarCierreParentesis

		.continuar:
		inc rcx													;indice
		cmp byte [varToOperate + rcx], 0h		;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
	.exit
	pop rcx
ret

validarCierreParentesis
	mov rdx, rcx
	cmp byte [varToOperate + rdx+1], '-'
		jnz .nextChar
		inc rdx											;me salto el signo negarivo

	.nextChar:
		inc rdx											;indice
		cmp byte [varToOperate + rdx], ')'
			jz .quitarParentesis

		mov al, byte [varToOperate + rdx]
		call isDigit
		cmp r10, 1										;si no ha llegado al final continua con el siguiente char/byte
			jz .nextChar
		.exit:
			jmp quitarParentesisSobrantes.continuar

	.quitarParentesis:
		call removeChar								;remueve el caracter actual (el cierre en la pos RDX del procedimiento anterior)
		mov rdx, rcx									;le pasamos el indice del parentesis que abre (RCX indice del parentesis)
		call removeChar								;lo borramos
		call printVarToOperate
jmp quitarParentesisSobrantes.continuar

;											/procesarEntrada
;------------------------------------------------------------------------------------------------------------

;------------------------------------------------------------------------------------------------------------
;											validarPonerAsteriscos
;
;	Sobrescribe el caracter a borrar en la posicion rdx en el buffer varToOperate
;------------------------------------------------------------------------------------------------------------
removeChar:
	push rax
	push r8
	mov r8, rdx
	.nextChar:
		mov al, byte [varToOperate + r8 + 1]
		mov [varToOperate + r8], al
		inc r8							;indice
		cmp byte [varToOperate + r8], 0h	;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
	dec r14
	pop r8
	pop rax
ret

;------------------------------------------------------------------------------------------------------------------
;Copia byte por byte lo que esta en varToPrint a varToOperate
;------------------------------------------------------------------------------------------------------------------
moverVarToPrintToVarToOperate:
	 xor r14,r14
	 xor r15,r15

	 .next_byte:
		mov al, byte[varToPrint + r15]
		mov byte[varToOperate + r14], al
		inc r14
		inc r15
		cmp byte [varToPrint + r15], 0h
			jnz .next_byte
ret

;-----------------------------------------------------------------------------------------------------------------------------------------
; Este procedimiento recorre varToOperate y revisa si solo quedan digitos, si es asi quiere decir que ya no hay operaciones por resolver.
; Deja en r10 un  1 si en varToOperate solo hay digitos.
;-----------------------------------------------------------------------------------------------------------------------------------------
 revisarDigitosInVarToOperate:
	push r14
	xor r14,r14
	xor r10, r10	;pone un 0
	nextByte:
		mov al,byte [varToOperate + r14]
		call isDigit
		cmp r10,0
			jz salir ; si no es digito no  modifica el r10 y se sale

		inc r14
		cmp byte [varToOperate + r14],0h ; si no ha llegado al final de varToOperate, entonces continua revisando si hay digitos
			jnz nextByte
		; si ya llego al final, quiere decir que solo habia digitos y deja en r10 un 1
	modificar_r10:
		mov r10,1
		salir:
	pop r14
ret

;------------------------------------------------------------------------------------------------------------
;											cambiarVariables
;
;	E: RCX la posicion de inicio de las variables del buffer de entrada
;------------------------------------------------------------------------------------------------------------
cambiarVariables:
	.nextChar:
		mov al, byte [rsi + rcx]
		call isVariable								;put in r10 1 if al is a symbol, else put 0
		cmp r10, 1
			jz cambiarVariable					;if actual char is a variable, add the char into the varTvariables

		.continuar
		inc rcx
		cmp byte[rsi + rcx], 0h				;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
ret

;------------------------------------------------------------------------------------------------------------
;											cambiarVariable
;
;	Itera la variable to operate y sustitute los las variables con el valor correspondiente
;	E: RCX la posicion de variable para sustituir en el buffer
;------------------------------------------------------------------------------------------------------------
cambiarVariable:
	call getPosVar										;devuelve la posicion en RDX
	cmp rdx, -1										;si llego al final y no la encontro retorna un -1 en rdx
		jz cambiarVariables.continuar			;se sale del ciclo y regresa a validar las siguientes variables, hasta que haya modificado todas las de la expresion

	call getPosValue									;devuelve la posicion en R8
	call movValue										;mueve a RDX los valores numericos iniciando en la posicion R8 del buffer
jmp cambiarVariable

;------------------------------------------------------------------------------------------------------------
;											getPosVar
;	E: AL el byte con la variable a buscar
;	S: RDX indice dentro de varToPos con la varible
;		Si la variable no exite RDX = -1
;------------------------------------------------------------------------------------------------------------
getPosVar:
	push rbx

	xor rdx, rdx
	.nextChar:
		mov bl, byte [varToOperate + rdx]
		cmp al, bl
			jz .exit
		inc rdx
		cmp byte[rsi + rdx], 0h					;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar								;si llega al final y no encontro la variable devuelve un -1
		mov rdx, -1

	.exit
	pop rbx
ret

;------------------------------------------------------------------------------------------------------------
;											getPosValue
;	R8 almacena el indice de inicio del valor de la variable en el buffer
;	M: R8
;------------------------------------------------------------------------------------------------------------
getPosValue:
	push rax
	mov r8, rcx				;movem al indice de la operacion actual el indice de donde comienza la variable
	.nextChar:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + r8]	;put a char/byte from the input buffer into the al. rsi = direccion buffer r8 = indice
		call isDigit
		cmp r10, 1
			jz .exit			;if actual char is an number, add the char into the varTvariables
		inc r8
		mov al, byte[rsi + r8]
		call isVariable
			jnz .nextChar
		; TODO ELSE: ENVIAR ERROR DE VARIABLE NO DEFINIDA
	.exit:
	pop rax
ret

;------------------------------------------------------------------------------------------------------------
;											movValue
;	Siempre que los bytes siguientes sean numeros los va insertando
;	E: R8 el indiice dentro del buffer con el inicio del valor de la variable
;		RDX la posicion de la variable donde se va a insertar el valor
;------------------------------------------------------------------------------------------------------------
movValue:
	push rax

	mov al, byte [rsi + r8]				;put a char/byte from the input buffer into the al. rsi = direccion buffer r8 = indice
	mov  byte [varToOperate + rdx], al

	.nextDigit:
		inc r8
		mov al, byte [rsi + r8]				;put a char/byte from the input buffer into the al. rsi = direccion buffer r8 = indice
		call isDigit
		cmp r10, 1
			jnz .exit
		call liberarByteVarToOperate
		inc rdx

		mov  byte [varToOperate + rdx], al
	jmp .nextDigit
	.exit:
	pop rax
ret

liberarByteVarToOperate:
	push r9
	push rbx
	push rdx

	mov r9, r14											;guardamos en r9 el indice final del varToPrint
	.PrevChar:
		dec r9

		mov bl, byte [varToOperate + r9]		;se mueve el ultimo caracter de la variable
		mov byte [varToOperate + r9+1], bl	;se mueve el ultimo caracter una posicion a la derecha

		cmp rdx, r9										;si no ha llegado al final continua con el siguiente char/byte
			jnz .PrevChar
		inc r14

	pop rdx
	pop rbx
	pop r9
ret

;------------------------------------------------------------------------------------------------------------
;											addIntIntoTheVar
;
;	Agrega en las variables, toPrint el numero completo desde el byte actual
;	hasta el final del numero y en toOperate el numero convertido a entero
;	E: RSI el buffer
;		RCX	indice dentro del buffer
;	M: RCX lo deja en la posicion del siguiente caracter
;------------------------------------------------------------------------------------------------------------
addIntIntoTheVar:
	push rbx
	push rcx										;se guarda el indice del buffer

	call atoi										;el procedimiento deja en RAX el numero transformado
	mov qword[varToOperate+r14], rax
	add r14, 8									;add 8byte=64bits

	call itoa										;el procedimiento agrega los caracteres a la variable toPrint
	add r15, rcx								;se suma el indice a la cantidad de digitos agregados a a variable

	mov rbx, rcx							;guardamos el numero de digitos

	pop rcx									;se regresa el indice del buffer
	add rcx, rbx							;se le suma la cantidad de digitos leidos.
	pop rbx
ret

;------------------------------------------------------------------------------------------------------------
;											isDigit
;
;	E: AL el byte a validar
;	S: R10 1 si es un numero, 0 si no.
;	M: R10
;------------------------------------------------------------------------------------------------------------
isDigit:
	xor r10, r10

	validarMenorA0:
		cmp al, '0'				; test the actual read char against '0'
			jb exit			; if < 0

	validarMayorA9:
		cmp al, '9'				; test the read char against '9'
			ja exit			; if > 9

	validarNULL:
		cmp al, 0h				; test the actual read char against 'null'
			jz exit			; if == null

	isNumber:
		inc r10

	exit:
ret

;------------------------------------------------------------------------------------------------------------
;											isOperador
;
;	E: AL el byte a validar
;	S: R10 1 si es un symbolo matematico, 0 si no.
;	M: R10
;------------------------------------------------------------------------------------------------------------
isOperador:
	push rcx

	xor rcx, rcx
	nextSymbol:
		cmp al, byte [varOperadores + rcx]	;if al is a symbol
			jz .isSymbol

		inc rcx												;incrementa el indice dentro de la variable de simbolos para leer el siguiente
		cmp byte[varOperadores + rcx], 10	;si no ha llegado al final continua con el siguiente simbolo
			jnz nextSymbol

	.isNotSymbol:											;si llego al final y no salto a ischar, entonces no es
		xor r10, r10
		jmp .exit

	.isSymbol:
		mov r10, 1

	.exit
		pop rcx
ret

;------------------------------------------------------------------------------------------------------------
;											isVariable
;
;	E: AL el byte a validar
;	S: R10 1 si es una variable, 0 si no.
;	M: R10
;------------------------------------------------------------------------------------------------------------
isVariable:
	xor r10, r10

	validarMenorAA:
		cmp al, 'A'				; test the actual read char against 'A'
			jb exit			; if < 0

	validarMayorAz:
		cmp al, 'z'				; test the read char against 'z'
			ja exit			; if > z

	validarMenorAZ
		cmp al, 'Z'				; test the actual read char against 'Z'
			jbe isVar			; if <= Z
	validarMayorAA:
		cmp al, 'A'				; test the read char against 'A'
			jae isVar			; if >= A
	.exit:
	ret

	isVar:
	inc r10
ret

;Limpiar variables---------------------------------------------------------------------------------------------
;r14 indice de varToOperate
;r15 indice de varToPrint
;--------------------------------------------------------------------------------------------------------------
LimpiarVarToOperate:
	xor r14, r14
	limpiarOperate:
		mov byte [varToOperate + r14], 0h
		inc r14
		cmp byte[varToOperate + r14], 0h				;si no ha llegado al final continua con el siguiente char/byte
			jnz limpiarOperate
	xor r14, r14
ret

LimpiarVarToPrint:
	xor r15, r15
	limpiarPrint:
		mov byte [varToPrint + r15], 0h
		inc r15
		cmp byte[varToPrint + r15], 0h				;si no ha llegado al final continua con el siguiente char/byte
			jnz limpiarPrint
	xor r15, r15
 ret

CicloPrincipal:
	push rcx

	xor rcx, rcx
	.nextSymbol:
		mov r9b, byte [varOperadores + rcx]
		push rcx
		call rsi
		pop rcx
		inc rcx													;incrementa el indice dentro de la variable de simbolos para leer el siguiente
		cmp byte[varOperadores + rcx], 0h	;si no ha llegado al final continua con el siguiente simbolo
			jnz .nextSymbol
	.exit:
	pop rcx
ret

OperarParentesis:
	call LimpiarVarToPrint
	call buscarOperacionParentesis
	cmp r10, -1
		jz OperarParentesis.exit
	call realizarOperacion
	call ajustarVariableToPrint
	call printVarToPrint
	call LimpiarVarToOperate
	call moverVarToPrintToVarToOperate
	call quitarParentesisSobrantes
jmp OperarParentesis
	.exit
ret


;------------------------------------------------------------------------------------------------------------------------------------------------
;	Llama a buscarOperacion para obtener la direccion de inicio del primer operando y luego a 
;	obtenerOperandos para poder pasar los operandos a los registros rax y rbx.
;-------------------------------------------------------------------------------------------------------------------------------------------------

Operar:
	call LimpiarVarToPrint
	call buscarOperacion
	cmp r10, -1
		jz Operar.exit
	call realizarOperacion
	call ajustarVariableToPrint
	call printVarToPrint
	call LimpiarVarToOperate
	call moverVarToPrintToVarToOperate
jmp Operar
	.exit
ret

realizarOperacion:
	
	cmp r9b, '+'
		jz sumar
		
	cmp r9b, '-'
		jz restar
		
	cmp r9b, '*'
		jz multiplicar
		
	cmp r9b, '/'
		jz dividir

	cmp r9, '^'
		jz pow

	cmp r9b, '%'
		jz mod
ret

ajustarVariableToPrint:
	call itoa
	add r15, rcx
	.nextChar:

		mov al, byte[varToOperate+r14]
		call addCharVarToPrint
		
		inc r14

		cmp byte[varToOperate+r14], 0h				;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar
ret

addCharVarToPrint:
	mov byte[varToPrint+r15], al
	inc r15
ret
;-------------------------------------------------------------------------------------------------------------------------------------------------
;Busca el inicio del primer operando, va incrementando hasta encontrarse con un operador, para luego llamar a ObtenerOperandos y decrementar hasta
;encontrar el inicio del primer operando.
;-------------------------------------------------------------------------------------------------------------------------------------------------
buscarOperacion:
	xor r14, r14
	xor rax, rax
	cmp r11, 0
		jz .exit
	.nextOperando:
		mov al, byte[varToOperate +r14]
		call addCharVarToPrint
		cmp al, r9b										;Si el char actual es un operador entonces llama al procedimiento ObtenerOperandos para buscar el inicio del primer operando
			jz ObtenerOperandos
		.continuar:
		inc r14
		cmp byte[varToOperate + r14], 0h	;si no ha llegado al final continua
			jnz .nextOperando
	.exit:
	mov r10, -1 ;TO DO SI LLEGO ACA YA NO HAY OPERACIONES PENDIENTES
ret

;------------------------------------------------------------------------------------------------------------------------------------------
;Decrementa el indice r14 desde el operador para buscar el inicio del primer operando, hasta toparse con otro operador o llegar al inicio
; de varToOperate
;------------------------------------------------------------------------------------------------------------------------------------------
ObtenerOperandos:
	cmp byte[varToOperate +r14+1], '-'
		jz IraInicio

	mov al, byte[varToOperate +r14+1]
	call isDigit
	cmp r10, 0
		jz buscarOperacion.continuar

	mov al, byte[varToOperate +r14-1]
	call isDigit
	cmp r10, 0
		jz buscarOperacion.continuar

;OBTENER EL INDICE DEL PRIMER OPERANDO
	IraInicio:
		dec r14
			jz .guardarDireccion ;Al decrementar , si r14 es 0 quiere decir que es el inicio de varToOperate y por lo tanto no va a encontrar un operador antes
		mov al, byte[varToOperate +r14-1]
		call isDigit
		cmp r10, 1 				; si es digito sigue decrementando hasta encontrar el inicio
			jz IraInicio
		
	.guardarDireccion:
	mov r15, r14										; se mueve al r15 la direccion de inicio de la operacion
;/OBTENER EL INDICE DEL PRIMER OPERANDO
	obtenerOperandos:
	push rcx
		mov r12, 1										;bandera de primer operando
		call atoi											;Obtiene primer operando y se guarda en rax
		mov rdx, rax									;se guarda el primer operando en RDX
		inc r14												;se incrementa para pasar a el siguiente operando
		cmp byte[varToOperate+r14] , '-'
			jnz segundoOperando
			inc r14											;si el segundo operando es negativo, se salta el signo
			mov r8, 1
		segundoOperando:
		mov r12, 0										;bandera de primer operando
		call atoi											;Obtiene segudo operando y se guarda en rbx
		mov rbx, rax
		mov rax, rdx
	pop rcx
ret

;----------------------------------------------------------------------------------------------------------------------------------
;Este procedimiento va a iterar varToOperate hasta encontrar el primer ')'
;----------------------------------------------------------------------------------------------------------------------------------
buscarOperacionParentesis:
	xor r14,r14
	.nextParentesis:
		mov al, byte[varToOperate +r14]
		call addCharVarToPrint
		cmp al, ')'
			jz .buscarOperador
		inc r14
		cmp byte[varToOperate + r14], 0h	;si no ha llegado al final continua
			jnz .nextParentesis
			
		jmp .exit
	
	.buscarOperador:
		.IraOperador:
			mov al, byte[varToOperate +r14]
			cmp al, r9b
				jz ObtenerOperandos
			dec r14
			jnz .IraOperador
		;TO DO MENSAJE DE ERROR DE PARENTESIS
	.exit
	mov r10, -1
ret
;--------------------------------------------------------------------------------------------------------------
;Va decrementando el r14 despues del primer ')' hasta encontrar el operador que sea igual a r9b, el cual seria
;la operación actual
;--------------------------------------------------------------------------------------------------------------


;------------------------------------------------------------------------------------------------------------
;	E: RSI el la direccion de inicio del numero a transformar
;	S: RAX el numero convertido a int
;------------------------------------------------------------------------------------------------------------
atoi:
	push rbx
	push r10
	push r11
	
	mov r11, r14							;guardamos la posicion de inicio del del numero

	xor rbx, rbx;clear the rbx to 0
	next_digit:

		;Get a char from the buffer and put it in RAX
		mov al, byte [varToOperate + r14]	;put a char/byte from the input buffer into the al rsi = direccion buffer rcx = indice desde el byte actual del buffer
		sub al, '0'						;convert from ASCII to number
		imul rbx, 10
		add rbx, rax					;rbx = rbx*10 + eax
		inc r14 							;incrementa el indice dentro del string para ler el siguiente byte
		mov al, byte[varToOperate + r14]
		call isDigit
		cmp r10, 1
			jz next_digit

	cmp r11, 0
		jz .exit
		
	cmp r12, 1
		jz .exit
		
	.validarNegarNumero:

		cmp byte [varToOperate + r11-1], '-'		;si el numero transformado tenia un signo de resta, se niega
			jnz .exit
		neg rbx
		mov r10, 1
	.exit:
	mov rax, rbx						;se mueve al registro rax el resultado
	
	pop r11
	pop r10
	pop rbx
ret

;------------------------------------------------------------------------------------------------------------
;	E: RAX el numero a convertir
;	S: RCX almacena la cantidad de digitos transformados
;------------------------------------------------------------------------------------------------------------
	itoa:
		push rbx
		push rdx
		push rsi
		;El ciclo itoa_1 extrae los digitos del menos al mas significativo de AX y los
		;guarda en el stack. Al finalizar el ciclo el digito mas significativo esta
		;arriba del stack.

		;Si el divisor es de 8 bits se toma como dividendo el registro de 16 bits AX
		;si el divisor es de 16 bits se tomara como dividendo el registro par DX:AX, 
		;tomando como palabra alta DX y como baja AX, 
		;si el divisor es de 64 bits se tomara como dividendo el registro par RDX:RAX, 
		;tomando como palabra alta RDX y como baja RAX.
		;El resultado de la operacion se guarda en el RAX y el residuo en el RDX

		xor rcx, rcx ;clear the rcx to 0;contiene el numero de digitos
		xor rsi, rsi ;clear the rsi to 0

		itoa_1:
			cmp rax, 0						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoa_2
				je itoa_2						;
			xor rdx, rdx						;se limpia la parte alta del divisor
			mov rbx, 10
			div rbx							;RDX:RAX / RBX
			push rdx							;Guardamos en la pila el resultado
			inc rcx								;CX contiene el numero de digitos
			jmp itoa_1

		itoa_2:
			cmp cx, 0							;Esta seccion maneja el caso cuando
				ja itoa_3	;if CX > 0				;el numero a convertir (AX) es 0.
			mov ax, '0'					;En este caso, el ciclo anterior
			mov byte [varToPrint+r15], al	;no guarda valores en el stack y
			;put the char into varIntToString result
			inc rsi
			inc rcx
			jmp salirItoa							;CX tiene el valor 0

		itoa_3:
			pop rax							;Extraemos los numero del stack
			add rax, '0'						;lo pasamos a su valor ascii
			mov byte[varToPrint+r15+rsi], al		;lo guardamos en la cadena final
			inc rsi								;incrementamos el indice
			cmp rsi, rcx						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoa_2
				je salirItoa
			jmp itoa_3
			salirItoa:

		pop rsi
		pop rdx
		pop rbx
	ret

;******************************************************************************
;						OPERACIONES ARITMETICAS

sumar:
	add rax, rbx		;si el numero es resta el segundo numero previamente, se nego,
	js ponerSigno
ret

restar:
	cmp r8, 1
		jnz .op
	neg rbx
	.op	
	add rax, rbx		;si el numero es resta el segundo numero previamente, se nego,
	js ponerSigno
ret

ponerSigno:
	neg rax
	mov byte [varToPrint+r15], '-'
	inc r15
ret

multiplicar:
	push rdx

	xor rdx, rdx
	imul rbx

	pop rdx
	js ponerSigno
ret

dividir:
	push rdx

	xor rdx, rdx
	div rbx ;RDX:RAX / RBX
	;TO DO si rbx es 0 lanzar error de calculo
	pop rdx
	js ponerSigno
ret

mod:
	push rdx

	xor rdx, rdx
	div rbx ;RDX:RAX / RBX
	;TO DO si rbx es 0 lanzar error de calculo
	mov rax, rdx
	pop rdx
	js ponerSigno

ret

pow
	cmp rbx, 0
		jz casoPow0
	cmp rbx, 1
		jz casoPow1
	
	dec rbx
	mov rcx, rbx
	push rdx
	powloop:
		xor rdx,rdx
		imul rbx
		dec rcx
		jnz powloop
	cmp rdx, 0
		;jnz	;TO DO error overflow
	pop rdx
	js ponerSigno

ret

casoPow0:
	mov rax, 1
ret

casoPow1:
ret
;						/OPERACIONES ARITMETICAS
;******************************************************************************

done:
	mov rax, 60							;sys_exit (code 60)
	mov rdi, 	0								;exit_code (code 0 successful)
	syscall

intronum:
	push rax
	push rdi
	push rsi
	push rdx

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, entrada						;address of the buffer to print out
	mov rdx, entradaLEN				;number of chars to print out
	syscall										;system call

	pop rdx
	pop rsi
	pop rdi
	pop rax
	ret

printVarToPrint:
	push rax
	push rdi
	push rsi
	push rdx
	push r15

	mov byte[varToPrint+r15], 10	;agregamos un cambio de linea
	inc r15

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToPrint					;address of the buffer to print out
	mov rdx, r15							;number of chars to print out
	syscall										;system call

	dec r15
	mov byte[varToPrint+r15], 0h	;volvemos a insertar el caracter null al final

	pop r15
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret

printVarToOperate:
	push rax
	push rdi
	push rsi
	push rdx
	push rcx

	mov byte[varToOperate+r14], 10	;agregamos un cambio de linea
	inc r14

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToOperate				;address of the buffer to print out
	mov rdx, r14							;number of chars to print out
	syscall										;system call

	dec r14
	mov byte[varToOperate+r14], 0h	;volvemos a insertar el caracter null al final

	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret

debug:
	push rax
	push rdi
	push rsi
	push rdx
	push rcx

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varDebug					;address of the buffer to print out
	mov rdx, 3								;number of chars to print out
	syscall										;system call

	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret

debug2:
	push rax
	push rdi
	push rsi
	push rdx
	push rcx

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varDebug2				;address of the buffer to print out
	mov rdx, 4								;number of chars to print out
	syscall										;system call

	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret