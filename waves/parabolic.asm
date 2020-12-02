                     ; this sample shows how to access virtual ports (0 to 0FFFFh).
; these ports are emulated in this file: c:\emu8086.io

; this new technology allows to make external add-on devices
; for emu8086, such as led displays, thermostat, stepper-motor, etc...

; "devices" folder contains sample device that works with this sample.
; (with visual basic source code).

#start=Grafik.exe#

#make_bin#
                  
name "parabolic"
;y = x*x             
       

    MOV CX,3           ;loop count
PARABOL:	
	MOV AX, 00H        ;y 
	MOV BL, 00H        ;x
UP:
    PUSH AX	           ;store AX content in stack
    call waitport
    POP AX             ;load AX content
    OUT 160, AL        ;sent AL content to 160th port
             
    INC BL             ;x++
    MOV AL, BL         ;y = x
    MUL AL             ;x*x
    
    CMP AL, 064H            
	JNZ UP             ;if non-zero, jump to YUKSEK
	
DOWN:  
    PUSH AX	
    call waitport
    POP AX
    OUT 160, AL

    DEC BL             ;x++
    MOV AL, BL         ;y = x
    MUL AL             ;x*x 
    
    CMP AL, 00H
	JNZ DOWN
	
	LOOP PARABOL        ;LOOP command decrease to CX

hlt

waitport:
    wait3:           ; loop to ensure the printer
    in al, 160d     ; is ready, it clears
    or al, 0        ; the port when this is true.
    jnz wait3
    ret