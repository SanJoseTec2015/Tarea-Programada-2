; CIS-77
; ATOI_ITOA_DEMO.ASM
; ATOI and ITOA usage demo program

.386                ; Tells MASM to use Intel 80386 instruction set.
.MODEL FLAT         ; Flat memory model
option casemap:none ; Treat labels as case-sensitive

INCLUDE IO.H        ; header file for input/output

.CONST          ; Constant data segment
    TXTPROMPT   BYTE    "Please enter a number between -32768 and +32767: ", 0
    TXTENTERED  BYTE    "You've entered: ", 0
    ENDL        BYTE    13, 10, 0
    OVERFLOW    BYTE    "*** Bad number, please try again!", 0

.STACK 100h     ; (default is 1-kilobyte stack)

.DATA           ; Begin initialized data segment
    buffer      BYTE    8 DUP (?)

.CODE           ; Begin code segment
_main PROC      ; Beginning of code

@@:
    output  TXTPROMPT        ; Please enter a number...
    input   buffer, 8        ; Read zero to 6 ASCII characters
    atoi    buffer           ; Convert string to 2's complement number
    jno     @F               ; Check the overflow flag
    ; Handle input error:
    output  OVERFLOW         ; print error message
    output  ENDL             ; print new line
    jmp     @B               ; back to the prompt
@@:
    ; Success: result of conversion is in AX
    itoa    buffer, ax       ; Convert 16-bit signed integer to string
    output  TXTENTERED       ; You've entered...
    output  buffer           ; print result
    output  ENDL             ; print new line
 
    ret
    
_main ENDP
END _main        ; Marks the end of the module and sets the program entry point label
