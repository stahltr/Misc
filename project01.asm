TITLE Programming Assignment #1     (project01.asm)

; Author: Trevor Stahl
; Last Modified:
; OSU email address: stahltr@oregonstate.edu
; Course number/section: CS_271_400_S2018
; Project Number: 01                Due Date: 4/15/2018
; Description: **removed to hide from google a bit**
; and some strings chaged and obscured to also hide from google** 
;not that this is not a mockable piece of code that you wouldnt want to learn from lol

; (insert constant definitions here)

.data

;strings for prompts and messages roughly in order
intro_1        BYTE "		Math in MASM by Trevor Stahl", 0
extra_credit_1 BYTE "**EC1", 0
extra_credit_2 BYTE "**EC2", 0
prompt_1       BYTE "This pro gr-am calcu la-tes the s-um, dif-ference, prod-uct, (integer) quot-ient and remainder of 2 numbers", 0
prompt_2       BYTE "Enter first number:", 0
prompt_3       BYTE "Enter second number:", 0
rmdr_1         BYTE "-!Remember - t-o enter the larger number first!-", 0
bad_inps       BYTE "Wow, The second nu mber must be less than the fir st!", 0
reRun_a        BYTE "Wanna rerun the program with new inputs?", 0
reRun_b        BYTE "If no, please enter a ny number OTHER than 1.", 0
reRun_c        BYTE "Ifso please en ter only the number 1, then press enter:", 0
goodBye        BYTE "Progr-am End--ing - Impr---essed?  Bye!", 0

;variables for the two numbers entered by user, initially = to ?
number_1 DWORD ? ;first integer to enter
number_2 DWORD ? ;second int for user to enter

;variables to hold the result of each operation
a_sum  DWORD ?
a_dif  DWORD ?
a_pro  DWORD ?
a_quo  DWORD ?
a_rem  DWORD ?

;symbols and spaces for displaying results in the form of strings ending in 0
e_sign  BYTE " = ", 0
p_sign  BYTE " + ", 0
mi_sign BYTE " - ", 0
mu_sign BYTE " x ", 0
di_sign BYTE " / ", 0
d2_sign BYTE " remainder ", 0

;variable to hold input to cmp for rerun program or not
rrv_a  DWORD ?


.code
main PROC

; First display your name and program title on the output screen.
	mov  edx, OFFSET intro_1
	call WriteString
	call CrLf
	call CrLf

; Display Extra Credit selected.
	mov  edx, OFFSET extra_credit_1
	call WriteString
	call CrLf
	mov  edx, OFFSET extra_credit_2
	call WriteString
	call CrLf
	call CrLf

theRestart:
; Display instructions for the user.
	mov  edx, OFFSET prompt_1
	call WriteString
	call CrLf
	mov  edx, OFFSET rmdr_1
	call WriteString
	call CrLf
	call CrLf

; Prompt the user to enter two numbers.
	mov	 edx, OFFSET prompt_2
	call WriteString
	call ReadInt
	mov  number_1, eax
	call CrLf

	mov	 edx, OFFSET prompt_3
	call WriteString
	call ReadInt
	mov  number_2, eax
	call CrLf

;validate that first number is bigger than second
	mov  eax, number_2
	mov  ebx, number_1
	cmp  ebx, eax
	jg   inputG

; this is skipped IF the input IS GOOD
	mov  edx, OFFSET bad_inps
	call WriteString
	call CrLf
	jmp  theEnd


inputG:
; Calculate the sum, difference, product, (integer) quotient and remainder of the two numbers.
; -sum
	mov  eax, number_1
	add  eax, number_2
	mov  a_sum, eax

; -diff
	mov  eax, number_1 
	sub  eax, number_2
	mov  a_dif, eax

; -product
	mov  eax, number_1
	mov  ebx, number_2
	mul  ebx
	mov  a_pro, eax

; -integer-quotient AND remainder
	mov  eax, number_1
	mov  ebx, number_2
	div  ebx
	mov  a_quo, eax
	mov  a_rem, edx





; Display the results.
; this displays the first line of results with the sum of the two numbers
	mov  eax, number_1
	call WriteDec

	mov  edx, OFFSET p_sign
	call WriteString

	mov  eax, number_2
	call WriteDec

	mov  edx, OFFSET e_sign
	call WriteString

	mov  eax, a_sum
	call WriteDec

	call CrLf

; this is the diff of the two numbers line
	mov  eax, number_1
	call WriteDec

	mov  edx, OFFSET mi_sign
	call WriteString

	mov  eax, number_2
	call WriteDec

	mov  edx, OFFSET e_sign
	call WriteString

	mov  eax, a_dif
	call WriteDec

	call CrLf

; this is the product line
	mov  eax, number_1
	call WriteDec

	mov  edx, OFFSET mu_sign
	call WriteString

	mov  eax, number_2
	call WriteDec

	mov  edx, OFFSET e_sign
	call WriteString

	mov  eax, a_pro
	call WriteDec

	call CrLf

; division
	mov  eax, number_1
	call WriteDec

	mov  edx, OFFSET di_sign
	call WriteString

	mov  eax, number_2
	call WriteDec

	mov  edx, OFFSET e_sign
	call WriteString

	mov  eax, a_quo
	call WriteDec

	mov  edx, OFFSET d2_sign
	call WriteString

	mov  eax, a_rem
	call WriteDec

	call CrLf

theEnd:
;First for extra credit, ask if the user wants to rerun the program
	mov  edx, OFFSET rerun_a
	call WriteString
	call CrLf
	mov  edx, OFFSET rerun_b
	call WriteString
	call CrLf
	mov  edx, OFFSET rerun_c
	call WriteString
	call ReadInt ;input is now in eax registry
	mov  ebx, 1
	call CrLf
	cmp  ebx, eax
	je   theRestart


; Finally, display a terminating message saying goodbye.
	call CrLf
	mov edx, OFFSET goodBye
	call WriteString
	call CrLf


	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main


;------------------------------------------------------------------------------------------------
