%include 'in_out.asm'

SECTION .data
msg1 db 'Введите N:',0h
SECTION .bss
    N: resb 10

SECTION .text
   Global  _start
_start:

;----- Вывод сообщения 'Введите N:'
mov eax,msg1
call sprint

;------ввод 'N'
mov ecx,N
mov edx, 10
call sread

;Преобразования'N'из символа в число
mov eax,N
call atoi
mov [N],eax

;----Организация цикла
mov ecx,[N]
label : 
push ecx
sub ecx,1
mov [N],ecx
mov eax,[N]
call iprintLF
pop ecx
loop label
call quit