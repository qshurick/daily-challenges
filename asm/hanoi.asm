SYS_BRK equ 12
SYS_EXIT equ 60
SYS_WRITE equ 1

section .data
    size db 5 ; hardcoded number of disks 
    src_cur db 0
    dst_cur db 0
    aux_cur db 0
    count   db 0

section .bss
    src_ptr resq 1
    dst_ptr resq 1
    aux_ptr resq 1

section .text
    global _start

_start:
    ; get current heap address
    mov rax, SYS_BRK
    mov rdi, 0
    syscall

    ; store current pointer for source stack
    mov [src_ptr], rax
    mov rdi, rax

    ; calculate require space
    xor rax, rax
    mov al, [size]
    inc al
    mov bl, 3
    mul bl
    add rax, [src_ptr]

    ; allocate memory for 3 stacks
    mov rdi, rax
    mov rax, SYS_BRK
    syscall
    ; stop if allocation failed
    cmp rax, 0
    jl fail

    ; calculate pointers for all tree stacks
    mov rdi, qword [src_ptr]
    ; destenation stack
    xor rax, rax
    mov al, [size]
    add rdi, rax
    inc rdi
    mov [dst_ptr], rdi
    ; auxiliar stack
    xor rax, rax
    mov al, [size]
    add rdi, rax
    inc rdi
    mov [aux_ptr], rdi

    ; fill source stack
    xor rcx, rcx
    mov cl, byte [size]
loop:
    mov rdi, [src_ptr]
    mov rsi, src_cur
    mov rdx, rcx
    call push

    dec cl
    jnz loop

    ; call hanoi routine witn (n, source, destination, auxiliar)
    xor rax, rax
    mov al, [size]
    mov rdi, rax
    mov rsi, [src_ptr]
    mov rdx, src_cur
    mov r8, [dst_ptr]
    mov r9,  dst_cur
    mov r10,  [aux_ptr]
    mov r11,  aux_cur
    call hanoi

    ; output resulted count
    mov rax, SYS_WRITE
    mov rdi, 1
    lea rsi, count
    mov rdx, 1
    syscall

    jmp exit

hanoi:
    cmp rdi, 0 ;stop when reach 0
    jnz hanoi_recursion
    
    ret

hanoi_recursion:
    push rdi ; remember origin n

    ; recursively call hanoi with (n-1, source, auxiliar, destination)
    dec rdi
    ; swap aux and dest
    push r8
    mov r8, r10
    pop r10

    push r9
    mov r9, r11
    pop r11

    call hanoi

    pop rdi

    ; here we move the disk from current source to current destination
    push rdi
    push rsi
    push rdx

    mov rdi, rsi
    mov rsi, rdx
    call pop

    mov rdi, r10
    mov rsi, r11
    mov rdx, rax

    call push

    pop rdx
    pop rsi
    pop rdi

    ; and count the move
    inc byte [count]


    ; recursivily call hanoi with (n-1, auxiliar, destination, source)
    push rdi ; remember origin n

    ; n-1
    dec rdi
    ; swap 
    push rsi
    push rdx
    mov rsi, r8
    mov rdx, r9
    mov r8, r10
    mov r9, r11
    pop r11
    pop r10

    call hanoi

    ; restore initial order of pillars before return
    pop rdi

    push rsi
    mov rsi, r10
    pop r10
    push rdx
    mov rdx, r11
    pop r11

    ret

; push (stack{pointer,offset}, value)
push:
    xor rax, rax
    mov al, [rsi]
    inc al
    mov [rsi], al
    add rdi, rax
    mov al, dl
    mov byte [rdi], al

    ret

; pop (stack{pointer,offset}) to rax
pop:
    xor rax, rax
    mov al, [rsi]
    add rdi, rax
    ; decrement pointer
    dec al
    mov [rsi], al

    ; move value to output
    mov rax, [rdi]
    mov byte [rdi], 0

    ret

exit:
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall

fail:
    mov rax, SYS_EXIT
    mov rdi, 1
    syscall
