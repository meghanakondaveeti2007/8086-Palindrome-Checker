org 100h

lea dx, prompt
mov ah, 09h
int 21h

lea dx, buf
mov ah, 0Ah
int 21h

xor cx, cx
mov cl, [buf+1]
lea si, buf+2
mov di, si
add di, cx
dec di

lea dx, yesmsg
shr cx, 1
jcxz display

check:
    mov al, [si]
    cmp al, [di]
    jne not_pal
    inc si
    dec di
    loop check
    jmp display

not_pal:
    lea dx, nomsg

display:
    mov ah, 09h
    int 21h
    ret

prompt db 'Enter a word: $'
yesmsg db 13,10,'Palindrome$'
nomsg db 13,10,'Not a palindrome$'
buf db 50,0,50 dup(0)
