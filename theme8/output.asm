	COMMON	x 32
	GLOBAL	ack
ack	push	ebp
	mov	ebp,esp
	sub	esp,0
	mov	eax,[ebp+8]
	mov	[x],eax
	mov	eax,[x]
	mov	[ebp+12],eax
	mov	eax,[ebp+12]
	jmp	Lackret
Lackret	mov	esp,ebp
	pop	ebp
	ret
