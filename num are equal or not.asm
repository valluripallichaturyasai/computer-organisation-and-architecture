ORG 100h         
; Display the message "Enter the first digit: "
MOV DX, OFFSET msg_input1 
MOV AH, 09h       
INT 21h            
; Read the first digit from the user
MOV AH, 01h       
INT 21h            
SUB AL, '0'        ; Convert ASCII to integer
MOV BL, AL         ; Store the first digit in BL
; Display the message "Enter the second digit: "
MOV DX, OFFSET msg_input2 
MOV AH, 09h        
INT 21h           
; Read the second digit from the user
MOV AH, 01h        
INT 21h           
SUB AL, '0'        ; Convert ASCII to integer
MOV CL, AL         ; Store the second digit in CL
; Compare the two digits
CMP BL, CL         ; Compare the two digits
JE digits_equal     ; Jump if equal
; Display message for not equal
MOV DX, OFFSET msg_not_equal  
MOV AH, 09h       
INT 21h            
JMP end_program
digits_equal:
; Display message for equal
MOV DX, OFFSET msg_equal  
MOV AH, 09h       
INT 21h            
end_program:
; Terminate the program
MOV AH, 4Ch        
INT 21h          
; Data section with messages
msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_equal   DB 0Dh, 0Ah, 'The digits are equal.$'
msg_not_equal DB 0Dh, 0Ah, 'The digits are not equal.$'
END