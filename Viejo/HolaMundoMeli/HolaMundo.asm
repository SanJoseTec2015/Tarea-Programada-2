;Melissa Molina Corrales
;Carné: 2013006074

section.data
holaMundo db "Hello World!!",10,0

section.text
  global _start
  
  _start:
    mov rdi, dword holaMundo
    mov rcx, dword -1
    xor al,al
    cld
    repnz scasb
    
    mov rdx, dword -2
    sub rdx,rcx
    
    mov rsi, dword holaMundo
    push 0x1
    pop rax
    mov rdi,rax
    syscall
    
    xor rdi,rdi
    push 0x3c
    pop rax
    syscall
    
   