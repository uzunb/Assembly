; this sample shows how to access virtual ports (0 to 0FFFFh).
; these ports are emulated in this file: c:\emu8086.io

; this new technology allows to make external add-on devices
; for emu8086, such as led displays, thermostat, stepper-motor, etc...

; "devices" folder contains sample device that works with this sample.
; (with visual basic source code).

#start=Grafik.exe#

#make_bin#

name "triangle"



BASLA:
	MOV BL, 00H
	MOV AL, 00H
YUKSEK:
    PUSH AX	
    call waitport    
    POP AX
    OUT 160, AL
    INC AL
    CMP AL,0FFH         ;is AL 0FF(255)?
	JNZ YUKSEK
	MOV AL, 0FFH
    
ALCAK:  
    PUSH AX	
    call waitport    
    POP AX
    OUT 160, AL
    DEC AL
    CMP AL,0FFH

	JNZ ALCAK
	
	;JMP BASLA


hlt
    
waitport:
    wait3:           ; loop to ensure the printer
    in al, 160d     ; is ready, it clears
    or al, 0        ; the port when this is true.
    jnz wait3
    ret
