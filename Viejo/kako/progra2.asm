;------------------------------------------------------------------------------------------------------------
;					TAREA PROGRAMADA ENSAMBLADOR 
;									ATOI AND ITOA 
;					  ISAAC CAMPOS MESEN 2014004626
;										ITCR 2015
;------------------------------------------------------------------------------------------------------------;

	section .bss						 ;Section containing uninitialized data

BUFLEN equ 1024					;We read the file 1024 bytes at a time
Buffer resb BUFLEN				;Text buffer itself

	section .data						;Section containing initialized data
	
varIntToString: db "................................................................",10
;varIntToStringLEN 	equ $ - varIntToString

entrada: db "Entrada = "
entradaLEN 	equ $ - entrada

salida: db "Salida = "
salidaLEN 	equ $ - salida

varToOperate: db '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 10 

varToPrint: db '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', 10

varSymbols : db '+', '-', '*', '/', '(', ')','^', '%',10

varSymbol : db '$',10


varInt : db '#',10

;varIntToStringLEN 	equ $ - varIntToString

varDebug: db 'ok',10

section .text						;Section containing code
global _start						;Linker needs this to find the entry point!

_start:

call read

;mov rcx, 0
;mov r15, 0
;call atoi
;call itoaP

;mov r15, 4
call procesarEntrada

call printVarToPrint
call printVarToOperate
;call ponerAsteriscos

;call validarParentesisSobrantes

call procesarVarToOperate

call printVarToPrint
;call printVarToPrint
jmp done
;call write



;Read a buffer full of text from stdin:
read:
	call intronum

	mov rax, 0						;sys_read (code 0)
	mov rdi, 0						;file_descriptor (code 0 stdin)
	mov rsi, Buffer				;address to the buffer to read into
	mov rdx, BUFLEN			;maximun number of bytes to read
	syscall							 ;system call

	mov rbp, rax					;save the number of bytes read
	cmp rax, 0					 	;test if the number of bytes read is 0
		jz done					 	;jump to the tag done if it is 0

	;Setup the register for later use
	mov rsi, Buffer				;place the buffer address in the rsi
	xor rcx, rcx					;clear the rcx to 0
	xor rax, rax					;clear the rax to 0
ret

;------------------------------------------------------------------------------------------------------------
;											procesarEntrada 
;
;	Es el primer procedimiento llamado. recorre byte por byte la entrada y
;	valida si es un numero o un simbolo. En caso de ser un caracter no
;	numerico, lo almacena en la variable toPrint y en la variable toOperate
;	si es un numero numero, se debe transformar a int y almacernarlo en 
;	la variable toOperate y el String almacenarlo en la variable ToPrint.
;
;	E: RSI la direccion del buffer
;	S: RCX la poscion de inicio de las variables a leer
;	M: R14, R15, RCX
;------------------------------------------------------------------------------------------------------------
procesarEntrada:
	xor r14, r14					;indice vartoOperate 
	xor r15, r15					;indice varToPrint
	xor rax, rax
	nextChar:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]	 			;put a char/byte from the input buffer into the al. rsi = direccion buffer rcx = indice
		call isActualCharNumber				;put in r10 1 if al is a symbol, else put 0
		cmp r10, 1
			jz addIntIntoTheVar		;if actual char is a Number, add the char into the varToPrint and varToOperate
			jnz addCharIntoTheVar		;else add the stringInt into the varToPrint, call ATOI and the result adds into varToOperate
			;en ambos se casos se esta incrementando el indice de acuerdo a los bytes transformados

	continuarProcesando:						;return point for previous jumps
	cmp byte[rsi + rcx], ',' 				;si no ha llegado al final continua con el siguiente char/byte
		jnz nextChar 
			
		
ret

;------------------------------------------------------------------------------------------------------------
;											addCharIntoTheVar 
;
;	Agrega en las variables, toOperate y toPrint el caracter de en RAX
;	E: AL el byte a insertar
;------------------------------------------------------------------------------------------------------------
addCharIntoTheVar:
	mov byte[varToPrint+r15], al
	mov qword[varToOperate+r14], rax
	add r14, 8								;indice varToOperatem ;add 8byte=64bits
	inc r15										;indice varToPrint
	inc rcx										;indice del buffer
jmp continuarProcesando

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
	add r14,8									;add 8byte=64bits
	
	call itoaP										;el procedimiento agrega los caracteres a la variable toPrint
	add r15, rcx								;se suma el indice a la cantidad de digitos agregados a a variable
	
	mov rbx, rcx							;guardamos el numero de digitos
	
	pop rcx									;se regresa el indice del buffer
	add rcx, rbx							;se le suma la cantidad de digitos leidos.
	pop rbx
jmp continuarProcesando


procesarVarToOperate:

	push r14 
	
	xor r14, r14					;indice vartoOperate
	xor r15, r15					;indice varToPrint
	xor rax, rax
	
	.nextChar:
		;call printVarToPrint
		;Get a char from the buffer and put it in RAX
		mov rax , qword [varToOperate + r14]	 			;put a char/byte from the input buffer into the al. rsi = direccion buffer rcx = indice
		call isActualCharSymbol				;put in r10 1 if al is a symbol, else put 0
		cmp r10, 1
			jz .addCharIntoTheVar 		;if actual char is a Number, add the char into the varToPrint and varToOperate
			jnz .addIntIntoTheVar		;else add the stringInt into the varToPrint, call ATOI and the result adds into varToOperate
			;en ambos se casos se esta incrementando el indice de acuerdo a los bytes transformados
			
	.addCharIntoTheVar:
		mov byte[varToPrint+r15], al
		inc r15										;indice varToPrint
		jmp .continuarProcesando
		
	.addIntIntoTheVar:
		push rcx										;se guarda el indice del buffer
		
		call itoaP										;el procedimiento agrega los caracteres a la variable toPrint
		add r15, rcx								;se suma el indice a la cantidad de digitos agregados a a variable

		pop rcx									;se regresa el indice del buffer

	.continuarProcesando:						;return point for previous jumps

		add r14,8									;add 8byte=64bits

		cmp qword[varToOperate + r14], 0				;si no ha llegado al final continua con el siguiente char/byte
			jnz .nextChar 

	pop r14
ret

;------------------------------------------------------------------------------------------------------------
;											isActualCharNumber 
;
;	E: AL el byte a validar
;	S: R10 1 si es un numero, 0 si no.
;	M: R10
;------------------------------------------------------------------------------------------------------------
isActualCharNumber:	
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
;											isActualCharSymbol 
;
;	E: AL el byte a validar
;	S: R10 1 si es un symbolo matematico, 0 si no.
;	M: R10
;------------------------------------------------------------------------------------------------------------
isActualCharSymbol:
	push rcx

	xor rcx,rcx
	nextSymbol:
		cmp al, byte [varSymbols + rcx]	 ;if al is a symbol
			jz .isSymbol

		inc rcx 												;incrementa el indice dentro de la variable de simbolos para leer el siguiente
		cmp byte[varSymbols + rcx], 10	;si no ha llegado al final continua con el siguiente simbolo
			jnz nextSymbol

	.isNotSymbol:											;si llego al final y no salto a ischar, entonces no es
		xor r10,r10
		jmp .exit

	.isSymbol:
		mov r10, 1

	.exit
		call isVariable
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

;------------------------------------------------------------------------------------------------------------
;	E: RSI el la direccion de inicio del numero a transformar
;		RDI la cantidad de digitos del nuermos
;	S: RCX almacena la cantidad de digitos transformados
;		RAX el numero convertido a int
;------------------------------------------------------------------------------------------------------------
atoi:	
	push rbx
	push rcx
	push r10

	xor rbx, rbx;clear the rbx to 0
	xor rax, rax				;clear the rax to 0

	next_digit:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]	;put a char/byte from the input buffer into the al rsi = direccion buffer rcx = indice desde el byte actual del buffer
		sub al,'0'							;convert from ASCII to number
		imul rbx,10
		add rbx,rax 					;rbx = rbx*10 + eax
		inc rcx 			
		;incrementa el indice dentro del string para ler el siguiente byte
		;cmp byte[rsi + rcx+1], 0h 	;si no ha llegado al final continua con el siguiente numero
		mov al, byte[rsi + rcx] 
		call isActualCharNumber
		cmp r10, 1
			jz next_digit
		;cmp byte[rsi + rcx +1] , 0h
			;jnz next_digit

	.exit:
	mov rax, rbx						;se mueve al registro rax el resultado
	
	pop r10
	pop rcx
	pop rbx
ret

;------------------------------------------------------------------------------------------------------------
;	E: RAX el numero a convertir
;	S: RCX almacena la cantidad de digitos transformados
;------------------------------------------------------------------------------------------------------------
	itoa:	
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
			cmp rax,0						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoa_2
				je itoa_2						;
			xor rdx,rdx						;se limpia la parte alta del divisor
			mov rbx,10
			div rbx							;RDX:RAX / RBX
			push rdx							;Guardamos en la pila el resultado
			inc rcx								;CX contiene el numero de digitos
			jmp itoa_1				 

		itoa_2:
			cmp cx,0							;Esta seccion maneja el caso cuando
				ja itoa_3						;el numero a convertir (AX) es 0.
			mov ax,'0'  						;En este caso, el ciclo anterior
			mov byte [varIntToString], al	;no guarda valores en el stack y
			 ;put the char into varIntToString result
			inc rsi
			inc rcx
			jmp write							;CX tiene el valor 0

		itoa_3:
			pop rax							;Extraemos los numero del stack
			add rax,'0'						;lo pasamos a su valor ascii
			mov [varIntToString+r15+rsi],al		;lo guardamos en la cadena final
			inc rsi								;incrementamos el indice
			cmp rsi,rcx						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoa_2
				je write			
			jmp itoa_3
	ret

	itoaP:	
	
		push rbx
		push rdx
		push rsi
		;El ciclo itoaP_1 extrae los digitos del menos al mas significativo de AX y los
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

		itoaP_1:
			cmp rax,0						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoaP_2
				je itoaP_2						;
			xor rdx,rdx						;se limpia la parte alta del divisor
			mov rbx,10
			div rbx							;RDX:RAX / RBX
			push rdx							;Guardamos en la pila el resultado
			inc rcx								;CX contiene el numero de digitos
			jmp itoaP_1				 

		itoaP_2:
			cmp cx,0							;Esta seccion maneja el caso cuando
				ja itoaP_3	;if CX > 0				;el numero a convertir (AX) es 0.
			mov ax,'0'  						;En este caso, el ciclo anterior
			mov byte [varToPrint+r15+rsi], al	;no guarda valores en el stack y
			 ;put the char into varIntToString result
			inc rsi
			inc rcx
			jmp salirItoa							;CX tiene el valor 0

		itoaP_3:
			pop rax							;Extraemos los numero del stack
			add rax,'0'						;lo pasamos a su valor ascii
			mov [varToPrint+r15+rsi],al		;lo guardamos en la cadena final
			inc rsi								;incrementamos el indice
			cmp rsi,rcx						;si ya se procesaron todos los digitos del numero o el numero de RAX es un O, salta a itoaP_2
				je salirItoa			
			jmp itoaP_3
			salirItoa:
		
		pop rsi
		pop rdx
		pop rbx
		
	ret

ponerAsteriscos:

ret

;Write the results to the stdout
write:
	push rax
	push rdi
	push rsi
	push rdx

	mov byte[varIntToString+rcx],10	;agregamos un cambio de linea al final
	inc rcx

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								 ;file_descriptor (code 1 stdout)
	mov rsi, varIntToString			;address of the buffer to print out
	mov rdx, rcx							;number of chars to print out
	call resultado

	syscall										;system call
	;Jump to read the next bytes
	pop rdx
	pop rsi
	pop rdi
	pop rax
	jmp done
ret

;******************************************************************************
;						OPERACIONES DE VALIDACION

validarParentesisSobrantes:
	push rax
	push rbx
	push rcx
	
	mov rbx, r14		;almacenamos la cantidad de bytes de la variable

	xor rcx,rcx 		;reiniciamos el contador
	.nextChar:
		mov rax, qword [varToOperate + rcx]
		cmp rax, '('	 ;if al is a symbol
			jz validarCierre

		add rcx, 8						;incrementa el indice dentro de la variable de simbolos para leer el siguiente
		cmp rcx, rbx	;si no ha llegado al final continua con el siguiente simbolo
			jnz nextChar
			jz .exit
			
	removerParentesis:
		call ProcRemoverParentesis
		jmp nextChar
		
	ProcRemoverParentesis:
		push rcx
		push rax
			mov rax, [varToOperate + rcx + 8]			;se mueve el siguiente caracter
			mov qword [varToOperate + rcx], rax		;sobreescribo el caracter actual con el siguiente
			add rcx, 8
			recorrer:
				mov rax, [varToOperate + rcx + 8]			;se mueve el siguiente caracter
				mov qword [varToOperate + rcx], rax		;sobreescribo el caracter actual con el siguiente
				add rcx, 8
				cmp rcx, rbx							;si no ha llegado al final continua con el siguiente simbolo
					ja recorrer
		pop rax
		pop rcx
	ret
	
	validarCierre:
		
		cmp [rcx + 16], rbx	;si no ha llegado al final continua con el siguiente simbolo
			jb validarParentesisSobrantes.exit
			
		mov rax, ')'
		cmp rax, qword [varToOperate + rcx + 16]	 ;(x) compara el caracter actual con dos caracteres siguientes
			jz removerParentesis

	validarParentesisSobrantes.exit
		pop rcx
		pop rbx
		pop rax
ret
	



;******************************************************************************
	

;******************************************************************************
;						OPERACIONES ARITMETICAS
sumar:
	add rax, rbx
ret

restar:
	sub rax, rbx
ret

multiplicar:
	push rdx
	
	xor rdx, rdx 
	imul rbx
	
	pop rdx
ret

dividir:
	push rdx

	div rbx ;RDX:RAX / RBX
	
	pop rdx
ret
;******************************************************************************


done:
	mov rax, 60							;sys_exit (code 60)
	mov rdi,	0								;exit_code (code 0 successful)
	syscall		  
	
intronum:
	push rax
	push rdi
	push rsi
	push rdx
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, entrada						;address of the buffer to print out
	mov rdx, entradaLEN				 ;number of chars to print out
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
	
	mov byte[varToPrint+r15],10	;agregamos un cambio de linea
	inc r15

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToPrint;varToOperate;				;address of the buffer to print out
	mov rdx, r15						;number of chars to print out
	syscall										;system call

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
	push r14
	
	mov qword[varToOperate+r14],10	;agregamos un cambio de linea
	add r14, 8

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToOperate;varToOperate;				;address of the buffer to print out
	mov rdx, r14						;number of chars to print out
	syscall										;system call
	
	pop r14
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret
	
debug:
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varSymbols				;address of the buffer to print out
	mov rdx, 1								;number of chars to print out
	syscall										;system call
ret


debugS:
	push rax
	push rdi
	push rsi
	push rdx
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varSymbol				;address of the buffer to print out
	mov rdx, 2								;number of chars to print out
	syscall										;system call
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret


debugI:
	push rax
	push rdi
	push rsi
	push rdx
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varInt				;address of the buffer to print out
	mov rdx, 2								;number of chars to print out
	syscall										;system call
	
	pop rdx
	pop rsi
	pop rdi
	pop rax
ret

;- movzx: la etiqueta mov permite mover la información de un;registro o buffer a otro registro siempre y cuando fueran del;mismo;tamaño tanto como en el que envía como el que recibe, ahora movzx permite que mover la información de uno más pequeño a otro más;grande en este caso mueve un byte(8 bits) a un registro de 32 bits (En 64 bits tengo entendido que NO se puede mover de 8bits a;64bits, solo de 16bits y 32bits a 64bits)
;-inc: incrementar
;-sub: resta
;-imul: multiplicacion con signo
;-add: suma
;-cmp: compara
