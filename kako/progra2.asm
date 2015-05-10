;------------------------------------------------------------------------------------------------------------
;					TAREA PROGRAMADA ENSAMBLADOR 
;									ATOI AND ITOA 
;					  ISAAC CAMPOS MESEN 2014004626
;										ITCR 2015
;------------------------------------------------------------------------------------------------------------;

	section .bss						 ;Section containing uninitialized data

BUFLEN equ 20					;We read the file 20 bytes at a time
Buffer resb BUFLEN				;Text buffer itself

	section .data					;Section containing initialized data
	
varIntToString: db "................................................................",10
;varIntToStringLEN 	equ $ - varIntToString

entrada: db "Entrada = "
entradaLEN 	equ $ - entrada

salida: db "Salida = "
salidaLEN 	equ $ - salida

varToOperate: db "................................................................",10
varToPrint: db "................................................................",10
varSymbols : db '+', '-', '*', '/', '(', ')','^', '%',10


varSymbol : db '$',10
varInt : db '#',10

;varIntToStringLEN 	equ $ - varIntToString

varDebug: db 'ok',10

section .text						;Section containing code
global _start						;Linker needs this to find the entry point!

_start:


call read
;call atoi
;call itoa
call procesarEntrada
call printPrueba
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
		je done					 	;jump to the tag done if it is 0

	;Setup the register for later use
	mov rsi, Buffer				;place the buffer address in the rsi
	mov rdi, varIntToString	;place the Hex String address in the rdi

	xor rcx, rcx					;clear the rcx to 0
	xor rax, rax					;clear the rax to 0
ret

;------------------------------------------------------------------------------------------------------------
;													procesarEntrada 
;
;	Es el primer procedimiento llamado. Lee byte por byte la entrada y valida si es un 
;	numero o un symbolo. En caso de ser un simbolo, lo almacena en la variable toPrint
;	y en la variable toPerate, si es un numero numero, se debe transformar a int y
;	almacernarlo en la variable toOperate y el String almacenarlo en la variable ToPrint.
;
;	E: RSI la direccion del buffer
;	S: RCX almacena la cantidad de digitos transformados
;		RAX el numero convertido a int
;------------------------------------------------------------------------------------------------------------
procesarEntrada:
	xor r14, r14					;indice varToPrint
	xor r15, r15					;indice vartoOperate
	xor rax, rax
	nextChar:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]	 			;put a char/byte from the input buffer into the al. rsi = direccion buffer rcx = indice
		call isActualCharSymbol				;put in r10 1 if al is a symbol, else put 0
		cmp r10, 1
			jz addCharIntoTheVarToPrint		;if actual char is a Symbol, add the char into the varToPrint and varToOperate
			jnz addIntIntoTheVarToPrint		;else add the stringInt into the varToPrint, call ATOI and the result adds into varToOperate

		continuarProcesando:						;return point for previous jumps
		inc rcx 											;se incrementa el indice
		cmp byte[rsi + rcx], 0h 				;si no ha llegado al final continua con el siguiente char/byte
			jne next_digit 
ret

isActualCharSymbol:
	push rcx

	xor r11,r11
	xor rcx,rcx
	nextSymbol:
		cmp al, byte [varSymbols + rcx]	 ;if al is a symbol
			jz .isSymbol

		inc rcx 												;incrementa el indice dentro de la variable de simbolos para leer el siguiente
		cmp byte[varSymbols + rcx], 10	;si no ha llegado al final continua con el siguiente simbolo
			jne nextSymbol

	.isNotSymbol:											;si llego al final y no salto a ischar, entonces no es
		xor r10,r10
		jmp .exit

	.isSymbol:
		mov r10, 1

	.exit
		pop rcx
ret

addCharIntoTheVarToPrint:
	call debugS
		jmp continuarProcesando

	mov byte[varToPrint+r15], al
	inc r14										;indice varToOperate
	inc r15										;indice varToPrint
	jmp continuarProcesando
	
addIntIntoTheVarToPrint:
	call debugI
		jmp continuarProcesando

	call atoi										;el procedimiento agrega los caracteres a la variable toOperate
	call itoaP										;el procedimiento agrega los caracteres a la variable toPrint
	inc r14										;
	add r15, rcx								;se suma el indice a la cantidad de digitos agregados a a variable
	jmp continuarProcesando

;------------------------------------------------------------------------------------------------------------
;	E: RSI el la direccion de inicio del numero a transformar
;		RDI la cantidad de digitos del nuermos
;	S: RCX almacena la cantidad de digitos transformados
;		RAX el numero convertido a int
;------------------------------------------------------------------------------------------------------------
atoi:	
	xor rbx, rbx;clear the rbx to 0
	xor rax, rax				;clear the rax to 0

	next_digit:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]	 ;put a char/byte from the input buffer into the al rsi = direccion buffer rcx = indice
		;mov rbx, rax						;copy the char/byte into the rbx

		sub al,'0'							;convert from ASCII to number
		imul rbx,10
		add rbx,rax 						;rbx = rbx*10 + eax
		inc rcx 			
		;incrementa el indice dentro del string para ler el siguiente byte
		cmp byte[rsi + rcx+1], 0h 	;si no ha llegado al final continua con el siguiente numero
			jne next_digit 
	
		mov rax, rbx						;se mueve al registro rax el resultado
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
				ja itoaP_3						;el numero a convertir (AX) es 0.
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
	ret


;Write the results to the stdout
write:
	push rax
	push rdi
	push rsi
	push rdx
	
	inc rcx
	mov byte[varIntToString+rsi],10	;agregamos un cambio de linea
	
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

done:
	mov rax, 60							;sys_exit (code 60)
	mov rdi,	0								;exit_code (code 0 successful)
	syscall		  
	
resultado:
	push rax
	push rdi
	push rsi
	push rdx
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, salida							;address of the buffer to print out
	mov rdx, salidaLEN					;number of chars to print out
	syscall										;system call

	pop rdx
	pop rsi
	pop rdi
	pop rax
	ret
	
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

printPrueba:
	push rax
	push rdi
	push rsi
	push rdx
	push r15

	
	inc r15
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToPrint				;address of the buffer to print out
	mov rdx, r15								;number of chars to print out
	syscall										;system call

	pop r15
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

printR10:
	add r10, '0'
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, r10				;address of the buffer to print out
	mov rdx, 8								;number of chars to print out
	syscall										;system call
ret


debugR11:
	push rax
	push rdi
	push rsi
	push rdx

	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, [r11]				;address of the buffer to print out
	mov rdx, 1								;number of chars to print out
	syscall										;system call

	pop rdx
	pop rsi
	pop rdi
	pop rax
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
