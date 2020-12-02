                ; this sample shows how to access virtual ports (0 to 0FFFFh).
; these ports are emulated in this file: c:\emu8086.io

; this new technology allows to make external add-on devices
; for emu8086, such as led displays, thermostat, stepper-motor, etc...

; "devices" folder contains sample device that works with this sample.
; (with visual basic source code).

#start=Grafik.exe#

#make_bin#

name "sawtooth"  


    MOV CX,3           ;loop count
SAWTOOTH:	 
	MOV AX, 00H 
YUKSEK:
    PUSH AX	           ;store AX content in stack
    call waitport
    POP AX             ;load AX content
    OUT 160, AL        ;sent AL content to 160th port
    
    INC AL             ;AL increment
    CMP AL,0FFH         ;is AL 0FFH(255)?
	JNZ YUKSEK         ;if non-zero, jump to YUKSEK

	
	LOOP SAWTOOTH        ;LOOP command decrease to CX

hlt

waitport:
    wait3:           ; loop to ensure the printer
    in al, 160d     ; is ready, it clears
    or al, 0        ; the port when this is true.
    jnz wait3
    ret