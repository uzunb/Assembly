.code
find proc
	
	push r10
	push r11
	push rsi
	
	xor r10, r10 ; i	 = 0
	xor r11, r11 ; j	 = 0
	xor rsi, rsi ; i + j = 0

L1: 

	cmp dword ptr[rcx + r10], 0
	je NOTFOUND



L2:

	cmp dword ptr[rdx + r11], 0
	je SUCCESS
	

CONTROL:
	xor rax, rax
	mov rax, r10
	add rax, r11

	mov esi, dword ptr[rdx + r11]
	cmp dword ptr[rcx + rax], esi
	je INC_R11


INC_R10:
	inc r10
	xor r11, r11
	jmp L1
	



SUCCESS:
	mov rax, r10
	shr rax, 2
	jmp FINISH



INC_R11:
	inc r11
	jmp L2



NOTFOUND:
	mov rax, -1


FINISH:
	pop rsi
	pop r11
	pop r10
	ret
find endp
end