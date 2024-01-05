.486

CODE	SEGMENT USE16
	ASSUME CS:CODE, DS:CODE

	ORG	0100h

START:
	push	cs
	pop	ds

	mov	ah, 9
	mov	dx, offset MES
	int	21h

	invd
	mov	eax, para_1a
	mov	edx, para_1b
	mov	ecx, 1001h
	DB	0Fh, 30h
	mov	eax, para_0a
	mov	ecx, 1000h
	DB	0Fh, 30h
	mov	eax, 20000000h
	mov	ecx, 1004h
	DB	0Fh, 30h
	mov	eax, para_2a
	xor	edx, edx
	mov	ecx, 1002h
	DB	0Fh, 30h
	invd

	mov	ax, 4C00h
	int	21h

MES	DB	'PK-X486S50 Cache on', 0Dh, 0Ah,'$'

para_0a	DWORD	00001492h
para_1a	DWORD	000000FFh
para_1b	DWORD	000000D0h
para_2a	DWORD	03000000h

CODE	ENDS

	END START
