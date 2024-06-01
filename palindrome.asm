.MODEL SMALL
.DATA
        STR1    DB      5   DUP(' '),'$'
        NL      DB      0DH,0AH,'$'
        PRINTPAL DB 0DH,0AH,"PALINDROME$"
        PRINTNOTPAL DB 0DH,0AH,"NOT PALINDROME$"
        OKAY DB 0DH,0AH,"MATCH FOUND$"
.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX

        LEA SI,STR1
        LEA DI,STR1

        MOV AH,01H
TAKEINPUT:
        INT 21H
        CMP AL,0DH
        JE  TERMINATE

        MOV [SI],AL
        INC SI
        JMP TAKEINPUT
TERMINATE:
        MOV AL,'$'
        MOV [SI],AL

        MOV AH,09H
        LEA DX,NL
        INT 21H

        MOV CX,LENGTH STR1
        ;ADD CX,1
DOTHIS:
        DEC SI
        MOV AL,[SI]

        CMP [DI],AL
        JNE NOTPALINDROME

        MOV AH,09H
        LEA DX,OKAY
        INT 21H

        INC DI

        CMP DI,SI
        JL DOTHIS
        ;LOOP DOTHIS

PALINDROME:
		MOV AH,09H
		LEA DX,PRINTPAL
		INT 21H

		JMP THEENDBEGINS

NOTPALINDROME:
		MOV AH,09H
		LEA DX,PRINTNOTPAL
		INT 21H

THEENDBEGINS:
        MOV AH,4CH
        INT 21H

MAIN    ENDP
END   MAIN
