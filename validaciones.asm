;------------------------------------------------------------------------------------------------------------
;					TAREA PROGRAMADA ENSAMBLADOR 
;									ATOI AND ITOA 
;					  ISAAC CAMPOS MESEN 2014004626
;										ITCR 2015
;------------------------------------------------------------------------------------------------------------;

	section .bss						 ;Section containing uninitialized data

	section .data						;Section containing initialized data

	section .text						;Section containing code


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
