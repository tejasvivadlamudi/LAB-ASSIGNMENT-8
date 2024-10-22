ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter first digit: "
MOV DX, OFFSET msg_input1  ; Load the address of the first input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read first digit from user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer
MOV BL, AL         ; Store the first digit in BL

; Display message "Enter second digit: "
MOV DX, OFFSET msg_input2  ; Load the address of the second input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read second digit from user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer
MOV BH, AL         ; Store the second digit in BH

; Perform addition
ADD BL, BH         ; Add the two digits in BL and BH (result in BL)

; Convert the result to ASCII for display
ADD BL, '0'        ; Convert the result to ASCII

; Display the message "The result is: "
MOV DX, OFFSET msg_output  ; Load the address of the result message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the result message

; Print the result of addition
MOV DL, BL         ; Move the result into DL for printing
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the result

; End the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input1  DB 'Enter first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter second digit: $'
msg_output  DB 0Dh, 0Ah, 'The result is: $'

END                ; End of program
