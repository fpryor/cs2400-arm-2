		;		ARM Programming Assignment #2: Writing C-strings
		;
		;		Write a program that assembles the values in chars*
		;       into a C-style string. A C-style string is an array
		;       of byte-size characters, terminated by a NULL (0x0).
		;       Write the C-string to the FILL memory at 'string'.
		;       Note: It's up to you to declare the correct number
		;       of bytes to hold the result.

		;		Your code here

main
		ADR		r0, chars0
		ADR		r1, string

		MOV		r2, #3		; countdown for 3 chars per  word,
		MOV		r3, #97		; program countdown (1 count per char)
		MOV		r4, #0		; chars index counter (+ 4)
		B		loop

loop
		LDR		r5, [r0, r4]	; load address pointer in r0 + r4, and store in r5
		STRB		r5, [r1, r2]	; store value in r5 to address pointer in r1 + r2

		SUB		r2, r2, #1	; char countdown
		ADD		r4, r4, #4	;increment chars index

		SUB		r3, r3, #1	; program countdown
		CMP		r3, #0
		BEQ		finish

		CMP		r2, #0
		BNE		loop

		B		nextchars

nextchars
		ADD		r1, r1, #4	; point to next string address
		MOV		r2, #3		; restart char countdown
		B		loop

finish
		END

chars0	DCD		'T', 'h', 'e', ' ', '2', '0', '1', '8', ' ', 'T', 'u'
chars1	DCD		'r', 'i', 'n', 'g', ' ', 'A', 'w', 'a', 'r', 'd', ' '
chars2	DCD		'w', 'a', 's', ' ', 'a', 'w', 'a', 'r', 'd', 'e', 'd'
chars3	DCD		' ', 't', 'o', ' ', 'B', 'e', 'n', 'g', 'i', 'o'
chars4	DCD		' ', 'H', 'i', 'n', 't', 'o', 'n', ' ', 'a', 'n'
chars5	DCD		'd', ' ', 'L', 'e', 'C', 'u', 'n', 'n', ' ', 'f', 'o'
chars6	DCD		'r', ' ', 't', 'h', 'e', 'i', 'r', ' ', 'w', 'o', 'r'
chars7	DCD		'k', ' ', 'o', 'n', ' ', 'n', 'e', 'u', 'r', 'a', 'l'
chars8	DCD		'n', 'e', 't', 'w', 'o', 'r', 'k', 's', '.'

string	FILL		100
