ORG 100h          

MAXLEN EQU 50

MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h

LEA DI, buffer

ReadLoop:
    MOV AH, 01h
    INT 21h
    CMP AL, 0Dh
    JE PrintMessage

    MOV [DI], AL
    INC DI
    CMP DI, OFFSET buffer + MAXLEN
    JB ReadLoop

PrintMessage:
    MOV BYTE PTR [DI], '$'

    MOV DX, OFFSET msg_output
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET buffer
    MOV AH, 09h
    INT 21h

EndProgram:
    MOV AH, 4Ch
    INT 21h

msg_input DB 'Enter your message: $'
msg_output DB 0Dh, 0Ah, 'You entered: $'
buffer DB MAXLEN DUP('$')

END