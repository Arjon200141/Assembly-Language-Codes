.model small
.stack 100h
.data
x db ?
y db ?
z db ?
msg db 10,13,'Please enter a number: $'
msg2 db 10,13,'The Sum is : $'
.code
main proc
mov ax,@data
mov ds,ax

mov ah,9h
lea dx,msg
int 21h

mov ah,1h
int 21h
sub al,'0'
mov x, al

mov ah,9h
lea dx,msg
int 21h

mov ah,1h
int 21h
sub al,'0'
mov y,al

mov ah,9h
lea dx,msg
int 21h

mov ah,1h
int 21h
sub al,'0'
mov z,al

mov ah,9h
lea dx,msg2
int 21h

mov al,x
ADD al,y
ADD al,z
ADD AL,'0'
mov dl,al
mov ah,2h
int 21h

mov ah,04ch
int 21h
main endp
end main