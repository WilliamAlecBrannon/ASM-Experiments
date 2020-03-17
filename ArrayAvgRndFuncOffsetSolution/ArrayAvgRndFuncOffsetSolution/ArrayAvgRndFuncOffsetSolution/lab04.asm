.586              ;Target processor, use Pentium class machines
.MODEL FLAT, C    ;Use the flat memory model. Use C calling and return conventions

.STACK            ;Define a stack segment of 1KB (Not required for this example)
.DATA             ;Create a near data segment.  Local variables are declared here (Not required for this example)

.CODE             ;Indicates the start of a code segment.

AverageFunc PROC USES esi ecx edx ebx

   NoOfElementsDW    EQU 08
   ArrayAddrStartPtr  EQU 12
   ElementSize        EQU Type DWORD
            
   push ebp                                       ;save curent  stack frame pointer
   mov  ebp, esp                                  ;set  current stack frame pointer

   ;push esi                                       ;preserve registers for calling program, commented out because USES replaces
   ;push ecx
   ;push edx
   ;push ebx

   ;get parameters from stack using stack frame into dedicated registers 
   mov ecx, [ebp + NoOfElementsDW]     ;ecx set as NoOfElemenstsDW
   mov esi, [ebp + ArrayAddrStartPtr]  ;esi set as index pointer   
     
   ;process the array sum
   sub eax,eax                                    ;clear summer
   arrayLoop:
       add eax, [esi]          ; sum into summer 
       add esi, ElementSize  ; update index pointer to next element, im doing something silly here and i dont understand how to fix
   loop arrayLoop

   ;take average and calcuate rounding            
   sub edx,edx          ;clear upper dividend
   mov ebx, [ebp + NoOfElementsDW] ;set divisor from stackset				
   div ebx              ;edx:eax / ebx

   shl edx,1            ;multiply remainder by 2
   cmp edx, ebx         ;if 2 x remainder is greater or equal than divisor
   jb NoRound										
	inc eax              ;round quotient up to next integer
   NoRound:                                       ;endif
                                                  ;restore used registers, commented out because USES replaces
		  ;pop ebx
		  ;pop edx
		  ;pop ecx
		  ;pop esi

          pop ebp                                ;restore calling bp frame
   ret

AverageFunc ENDP

END