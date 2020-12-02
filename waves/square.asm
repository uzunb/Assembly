; this sample shows how to access virtual ports (0 to 0FFFFh).
; these ports are emulated in this file: c:\emu8086.io

; this new technology allows to make external add-on devices
; for emu8086, such as led displays, thermostat, stepper-motor, etc...

; "devices" folder contains sample device that works with this sample.
; (with visual basic source code).

#start=Grafik.exe#

#make_bin#

name "square"


    MOV CX,3           ;loop count
KARE:	
    MOV BL, 00H        ;wave per 15
	MOV AX, 01H        ;signal content
YUKSEK:
    PUSH AX	           ;store AX content in stack
    call waitport
    
    POP AX             ;load AX content
    OUT 160, AL        ;sent AL content to 160th port
    
    INC BL             ;BL increment
    CMP BL,0FH         ;is BL 0FH?
	JNZ YUKSEK         ;if non-zero, jump to YUKSEK
	
	MOV BL, 00H        ;set BL 0
	MOV AX, 0FAH       ;set AX 0FA(250)
ALCAK:  
    PUSH AX	
    call waitport
    
    POP AX
    OUT 160, AL

    INC BL
    CMP BL,0FH

	JNZ ALCAK
	
	LOOP KARE        ;LOOP command decrease to CX

hlt

waitport:
    wait3:           ; loop to ensure the printer
    in al, 160d     ; is ready, it clears
    or al, 0        ; the port when this is true.
    jnz wait3
    ret