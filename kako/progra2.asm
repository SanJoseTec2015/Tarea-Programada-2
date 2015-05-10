;------------------------------------------------------------------------------------------------------------
;	
;						TAREA PROGRAMADA ENSAMBLADOR 
;										ATOI AND ITOA 
;						  ISAAC CAMPOS MESEN 2014004626
;											 ITCR 2015
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

varToOperate: db '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'

varToPrint: db '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'

varSymbols : db "+-*/()",0h
;varIntToStringLEN 	equ $ - varIntToString

section .text						;Section containing code
global _start						;Linker needs this to find the entry point!

_start:

call read
;call atoi
;call itoa
call procesarEntrada
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

procesarEntrada:
	xor r15, r15					;indice varToPrint
	xor r14, r14					;indice vartoOperate
	nextChar:
		;Get a char from the buffer and put it in RAX
		mov al, byte [rsi + rcx]	 ;put a char/byte from the input buffer into the al rsi = direccion buffer rcx = indice
		;mov rbx, rax						;copy the char/byte into the rbx
		call isActualCharSymbol
		cmp rsp, 1
			jz addCharInTheVarToPrint		; if actual char is a Symbol, add the char in the varToPrint
			jnz addIntInTheVarToPrint			;else call atoi
			;jz	addCharInTheVarToOperate	; if actual char is a Symbol, add the char in the varToPrint
		.procesarEntrada:
		inc rcx 			
		;incrementa el indice dentro del string para ler el siguiente byte
		cmp byte[rsi + rcx], 0h 	;si no ha llegado al final continua con el siguiente numero
			jne next_digit 
		jmp prueba
ret

isActualCharSymbol:
	push rbx
	push rcx
	
	xor rcx,rcx
	nextSymbol:
		cmp al, byte [varSymbols + rcx]	 ;put a char/byte from the varSymbols into the bl, RCX = indice
			jz .isSymbol
		
		inc rcx 												;incrementa el indice dentro de la variable de simbolos para leer el siguiente

		cmp byte[varSymbols + rcx], 0h 	;si no ha llegado al final continua con el siguiente simbolo
			jne nextSymbol

	.isNotSymbol:											;si llego al final y no salto a ischar, entonces no es
		pop rcx
		pop rbx
		mov rsp, 0
	ret
		
	.isSymbol:
		pop rcx
		pop rbx
		mov rsp, 1
ret

addCharInTheVarToPrint:
	mov byte[varToPrint+r15], al
	inc r15
	jmp procesarEntrada

addIntInTheVarToPrint:
	call atoi
	call itoa										;el llamado a este procedimiento agrega los caracteres a la variable
	add r15, rcx								;se suma el indice a la cantidad de digitos agregados a a variable
	jmp procesarEntrada

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

		sub al,'0'								;convert from ASCII to number
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
			mov [varIntToString+rsi],al		;lo guardamos en la cadena final
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
			mov byte [varToPrint], al	;no guarda valores en el stack y
			 ;put the char into varIntToString result
			inc rsi
			inc rcx
			jmp salirItoa							;CX tiene el valor 0

		itoaP_3:
			pop rax							;Extraemos los numero del stack
			add rax,'0'						;lo pasamos a su valor ascii
			mov [varToPrint+rsi],al		;lo guardamos en la cadena final
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

prueba:
	push rax
	push rdi
	push rsi
	push rdx
	
	mov rax, 1								;sys_write (code 1)
	mov rdi, 1								;file_descriptor (code 1 stdout)
	mov rsi, varToPrint				;address of the buffer to print out
	mov rdx, r15								;number of chars to print out
	syscall										;system call
	jmp done
	
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
