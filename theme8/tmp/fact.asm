		GLOBAL	fact
fact	push	ebp
		mov		ebp,esp
		sub		esp,4
		mov		eax,[ebp+8]
		imul	eax,[ebp+8]
		mov		esp,ebp
		pop		ebp
		ret
