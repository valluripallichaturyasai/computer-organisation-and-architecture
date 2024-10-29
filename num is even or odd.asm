ORG 100h
; Display the message "Enter a single-digit number: "
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h
; Read the digit from the user
MOV AH, 01h
INT 21h
SUB AL, '0'         ; Convert ASCII to integer
; Check if the digit is between 0 and 9
CMP AL, 0          ; Check if less than 0
JB  invalid_input   ; If below 0, jump to invalid input
CMP AL, 9          ; Check if greater than 9
JA  invalid_input   ; If above 9, jump to invalid input
; Check if the number is odd or even
AND AL, 1          ; AND with 1 to check the least significant bit
JZ  even_number     ; If result is 0, it's even
; Display message for odd
MOV DX, OFFSET msg_odd  
MOV AH, 09h
INT 21h  
JMP end_program
even_number:
; Display message for even
MOV DX, OFFSET msg_even 
MOV AH, 09h
INT 21h
JMP end_program
invalid_input:
; Display invalid input message
MOV DX, OFFSET msg_invalid
MOV AH, 09h
INT 21h
end_program:
; Terminate the program
MOV AH, 4Ch
INT 21h
; Data section with messages
msg_input      DB 'Enter a single-digit number: $'
msg_even       DB 0Dh, 0Ah, 'The number is even.$'
msg_odd        DB 0Dh, 0Ah, 'The number is odd.$'
msg_invalid     DB 0Dh, 0Ah, 'Invalid input. Please enter a single-digit number (0-9).$'
END