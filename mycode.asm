.MODEL SMALL;TINY   :data+code = 64KB    

                                ;SMALL  :data = 64KB and code = 64KB

                                ;MEDIUM :data = 64KB but no code restriction

                                ;COMPACT:code = 64KB but no data restriction

                                ;LARGE  :Single set of data can not exceed 64KB

                                ;HUGE   :No restriction

;------------------------------------------------------

                    .STACK 64   ;64 BYTES for stack      

;------------------------------------------------------                    

                    .DATA

BYTE_DATA           DB  52h          ; DB:Define Single Byte  

BYTE_DATA_MANY      DB  12h,15h,19h  ; OR multiple bytes

BYTE_STRING         DB  'I am Khaled'; Define string   
                                                                
YAString            DB  "With quotes"; Single or double qoutes

WORD_DATA           DW  1234h        ; DW:Define word

;                   ORG 50h          ; ORG: Go to memory location 50h

DOUBLE_WORD_DATA    DD  12345678h    ; DD:Define Double 

;Quad_Word_DATA     DQ  12345678H    ; DQ:define quadword (8 Bytes)

;Ten_Word_DATA      DT  1234567890H  ; DT:define TEN (10 Bytes)

data1               DB  12h          ;

data2               DB  ?            ; Reserve Location

DUMMY               DB  6 DUP(0FFH)  ; Fill six bytes with FF

DUMMY2              DB  2 DUP(3 DUP (0FFH)) ;Fill six bytes with FF 

EMPTYW              DW  10 DUP(?)    ;Reserve 10 words 

Count               EQU 25           ;Define a constant

ArrW         DW  1234h,5678h,9123h

;--------------------------------------------------------

                    .CODE                                                 

MAIN                PROC FAR        ;Procdure length (default:NEAR)

                    MOV AX,@DATA    ;WE Need to mov DS,@DATA

                    MOV DS,AX       ;But we can not do it in a single step

                    CALL SUB1

ANY_LBL_MAX_31_CHAR:MOV AL,10H      ;Comment

                    mov al,BYTE_DATA

                    mov BX,offset BYTE_DATA  

                    LEA CX,BYTE_DATA;Load effective addres

                    mov ah,[BX]

                    mov al,BYTE_DATA_MANY

                    mov bl,BYTE_DATA_MANY+1 

                    mov al,BYTE_DATA_MANY[2] 

                    XCHG al,bl      ;Xchange

                    mov AX,WORD PTR DOUBLE_WORD_DATA; WORD PTR:Get the first word

                    mov AX,WORD PTR DOUBLE_WORD_DATA+1; WORD PTR:Get the first word                                        

                    MOV CL,2H

LBL_A_Z0_9?@$:      mov AX,2098H             

                    PUSHA       ;PUSH ALL 

                    mov AX,5432H 

                    POPA        ;POP ALL (AX, CX, DX, BX, SP, BP, SI, and DI)

                    PUSHF       ;PUSH FLAGS

                    add al,20h   

                    CLC         ;Clear Carry

                    ADC AL,BL   ;Add with carry

                    POPF        ;POP FLAGS 

                    DEC CL

                    JZ NEW_JMP

                    mov Ax,ArrW+1

                    mov bx,ArrW[1]

                    JMP LBL_A_Z0_9?@$; Unconditional JMP  

NEW_JMP:            CALL SUB1   ;Call the first function

                    CALL SUB2

                    mov al,12h

                    mov cx,3

                    mov al,10h

                    SUB al,bl;  AL=AL-BL [result sign in the carry flag]

                    SBB al,bl;  AL=AL-BL-Carry [subtract with borrow]

                    MUL BL   ;  AX=AL*BL

                    MUL BX   ;  DX AX= AX*BX (For Word*Byte put AH=0)

                    DIV BH   ;  AL = AX/BH and AH=AX%BH

                   ;DIV 10   ;  Invalid MODE

                    DIV BX   ;  AX = AX/BX and DX=AX%BX

                    AND AL,BL;  AL=AL AND BL

                    OR  AL,BL;  AL=AL OR BL                    

                    XOR AL,BL;  1 for odd

                    mov CL,3 ; 

                    mov AL,11011010b

                    SHR AL,CL;  Shift right three times (right most bit go to carry- 0 added to left)  

                    SHL AL,CL;  Shift Left

                    ROR BL,CL;  Rotate Right

                    ROL BL,CL;  Rotate Left

                    RCR BL,CL;  Rotate with carry right

                    RCL BL,CL;  Rotate with carry left

                    CMP AL,BL;  Compare (change flags as SUB AL,BL without sub)

                    AND AL,AL;  Used to check for zero

                    JZ NEAR_JMP;  

NEAR_JMP:           mov al,13h   

                    LOOP NEAR_JMP; Equivalent to [DEC CX 

                                 ;                JNZ XXX]            

                    HLT

MAIN                ENDP

;-------------------------------------------------

SUB1                PROC 

                    MOV AL,0C1h ; Put 0 if Number starts with A-F

                    ;push ax

                    RET

SUB1                ENDP                    

;-------------------------------------------------

SUB2                PROC       

                    MOV BL,AL   ; Subroutine Code

                    RET

SUB2                ENDP                    

;-------------------------------------------------

                    END MAIN        ; End of the program
