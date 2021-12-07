BITS 64

%define SYS_Read   0
%define SYS_Write  1
%define SYS_Open   2
%define SYS_Exit  60
; Syscall registers: rax, rdi, rsi, rdx, r10, r8, r9

%define Stdout 1
%define O_ReadOnly 0

section .text
global _start

_start:
	; check if user provided filename
	pop rax
	test rax, 1
	jne not_enough_arguments

	; open file
	pop rdi ; skip program name
	pop rdi
	mov rsi, O_ReadOnly
	mov rax, SYS_Open
	syscall
	cmp rax, 0
	jl failed_to_open_file

	; read file
	mov rdi, rax ; fd
	mov rsi, file
	mov rdx, 1024
	mov rax, SYS_Read
	syscall
	mov [file_size], rax

initialize_fishes:
	xor rax, rax
	mov al, [file]
	cmp rax, 0
	jz .end

	sub rax, '0'
	lea rbx, [fish+8*rax]
	inc qword [rbx]

	add byte [file], 2
	jmp initialize_fishes
.end:


	mov rdi, 0
	mov rax, SYS_Exit
	syscall

failed_to_open_file:
	mov rdx, 26
	mov rsi, error_failed_to_open_file
	mov rdi, Stdout
	mov rax, SYS_Write
	syscall
	jmp fail

not_enough_arguments:
	mov rdx, 20
	mov rsi, error_not_enough_arguments
	mov rdi, Stdout
	mov rax, SYS_Write
	syscall
	jmp fail

fail:
	mov rdi, 1
	mov rax, SYS_Exit
	syscall

section .bss
fd: resq 1
file: resb 1024
file_size: resq 1

fish: resq 9

section .rodata
error_not_enough_arguments: db "usage: a <filename>", 10
error_failed_to_open_file: db "Cannot open provided file", 10
