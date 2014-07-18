EXTERN chk
	GLOBAL	binsearch
binsearch	push	ebp
	mov	ebp,esp
	sub	esp,24
	mov	eax,0
	mov	[ebp-4],eax
	mov	eax,[ebp+12]
	sub	eax,1
	mov	[ebp-8],eax
	L2:
	cmp	eax,0
	je	L3
	mov	eax,2
	mov	[ebp-16],eax
	mov	eax,[ebp-4]
	add	eax,[ebp-8]
	mov	eax,[ebp-16]
	cdq
	idiv	dword	[ebp-16]
	mov	[ebp-12],eax
	mov	eax,[ebp+8]
	mov	[ebp-16],eax
	push	eax
	call	v
	add	esp,0
	add	esp,4
	cmp	[ebp-16],eax
	setl	al
	movzx	eax,al
	cmp	eax,0 ;この上が条件式
	je	L4;ここからIF
	mov	eax,[ebp-20]
	sub	eax,1
	mov	[ebp-8],eax
	jmp	L5
	L4:	;ここからelse
	mov	eax,[ebp+8]
	mov	[ebp-20],eax
	push	eax
	call	v
	add	esp,0
	add	esp,4
	cmp	[ebp-20],eax
	setg	al
	movzx	eax,al
	cmp	eax,0 ;この上が条件式
	je	L6;ここからIF
	mov	eax,[ebp-24]
	add	eax,1
	mov	[ebp-4],eax
	jmp	L7
	L6:	;ここからelse
	mov	eax,[ebp-24]
	jmp	Lbinsearchret
	L7:
	L5:
	jmp	L2
	L3:
	mov	eax,1
	imul	eax,-1
	jmp	Lbinsearchret
Lbinsearchret	mov	esp,ebp
	pop	ebp
	ret
	GLOBAL	swap
swap	push	ebp
	mov	ebp,esp
	sub	esp,24
	mov	eax,[ebp+8]
	push	eax
	call	v
	add	esp,0
	add	esp,4
	mov	[ebp-16],eax
	mov	eax,[ebp+12]
	push	eax
	call	v
	add	esp,0
	add	esp,4
	push	eax
	mov	eax,[ebp+8]
	push	eax
	call	set_v
	add	esp,0
	add	esp,8
	push	eax
	mov	eax,[ebp+12]
	push	eax
	call	set_v
	add	esp,0
	add	esp,8
Lswapret	mov	esp,ebp
	pop	ebp
	ret
	GLOBAL	myqsort
myqsort	push	ebp
	mov	ebp,esp
	sub	esp,40
	cmp	eax,0 ;この上が条件式
	je	L8
	mov	eax,0
	jmp	Lmyqsortret
	L8:
	mov	eax,2
	mov	[ebp-24],eax
	mov	eax,[ebp+8]
	add	eax,[ebp+12]
	mov	eax,[ebp-24]
	cdq
	idiv	dword	[ebp-24]
	push	eax
	mov	eax,[ebp+8]
	push	eax
	call	swap
	add	esp,0
	add	esp,8
	mov	eax,[ebp+8]
	mov	[ebp-20],eax
	mov	eax,[ebp+8]
	add	eax,1
	mov	[ebp-16],eax
	L9:
	cmp	eax,0
	je	L10
	push	eax
	call	v
	add	esp,0
	add	esp,4
	mov	[ebp-24],eax
	mov	eax,[ebp+8]
	push	eax
	call	v
	add	esp,0
	add	esp,4
	cmp	[ebp-24],eax
	setl	al
	movzx	eax,al
	cmp	eax,0 ;この上が条件式
	je	L11
	mov	eax,[ebp-20]
	add	eax,1
	mov	[ebp-20],eax
	push	eax
	push	eax
	call	swap
	add	esp,0
	add	esp,8
	L11:
	mov	eax,[ebp-28]
	add	eax,1
	mov	[ebp-28],eax
	jmp	L9
	L10:
	push	eax
	mov	eax,[ebp+8]
	push	eax
	call	swap
	add	esp,0
	add	esp,8
	mov	eax,[ebp-36]
	sub	eax,1
	push	eax
	mov	eax,[ebp+8]
	push	eax
	call	myqsort
	add	esp,0
	add	esp,8
	mov	eax,[ebp+12]
	push	eax
	mov	eax,[ebp-36]
	add	eax,1
	push	eax
	call	myqsort
	add	esp,0
	add	esp,8
Lmyqsortret	mov	esp,ebp
	pop	ebp
	ret
	GLOBAL	main
main	push	ebp
	mov	ebp,esp
	sub	esp,40
	mov	eax,9
	push	eax
	mov	eax,0
	push	eax
	call	myqsort
	add	esp,0
	add	esp,8
	mov	eax,6
	push	eax
	mov	eax,10
	push	eax
	mov	eax,7
	push	eax
	call	binsearch
	add	esp,0
	add	esp,8
	push	eax
	call	chk
	add	esp,0
	add	esp,8
Lmainret	mov	esp,ebp
	pop	ebp
	ret
