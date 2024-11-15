SECTION .data ; Секция инициированных данных
msg: DB 'Введите строку:', 10
msgLen: EQU $-msg ; Длина переменной 'msg'
SECTION .bss ; Секция не инициированных данных
buf1: RESB 80 ; Буфер размером 80 байт
SECTION .text ; Koд пporpaммы
GLOBAL _start ; Начало пporpaммы
_start: ; Точка входа в программу
mov eax,4 ; Системный вызов для записи (sys_write)
mov ebx,1 ; Описатель файла 1 - стандартный вывод
mov ecx,msg ; Адрес строки 'msg' в "ecx'
mov edx, msgLen ; Pasmep стpoки 'msg' в 'edx'
int 80h ; Вызов ядpa
mov eax, 3 ; Системный вызов для чтения (sys_read)
mov ebx, 0 ; Дескриптор файла 0 - стандартный ввод
mov ecx, buf1 ; Адрес буфера под вводимую строку
mov edx, 80 ; Длина вводимой строки
int 80h ; Вызов ядра
mov eax,4 ; Системный вызов для записи (sys_write)
mov ebx,1 ; Описатель файла "1" - стандартный вывод
mov ecx, buf1 ; Aдpec строки 'buf1' в 'ecx'
mov edx, buf1 ; Paзмер строки buf1
int 80h ; Вызов ядра
mov eax,1 ; Системный вызов для выхода (sys_exit)
mov ebx,0 ; Выход с кодом возврата 0 (без ошибок)
int 80h ; Bызoв ядра
