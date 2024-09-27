ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter your character: "
MOV DX, OFFSET msg_prompt  ; Load the address of the input prompt message into DX
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read a single character from user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character from input
INT 21h            ; Call DOS interrupt to get the character
MOV BL, AL ; Store the entered character into memory location "entered_char"

; Display message "The entered character is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message into DX
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Print the same entered character on screen
MOV DL, BL ; Load the previously entered character from memory into DL
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the character

; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_prompt DB 'Enter your character: $'          ; Define the input prompt message
msg_output DB 0Dh, 0Ah, 'The entered character is: $'  ; Define the output message with newline


END                ; End of program