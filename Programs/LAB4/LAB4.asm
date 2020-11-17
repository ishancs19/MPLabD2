.MODEL SMALL
DISPLAY MACRO MSG
      LEA DX, MSG
      MOV AH, 09H
      INT 21H
ENDM

.DATA
      MSG1 DB 0DH, 0AH, "ENTER A STRING: $"
      MSG2 DB 0DH, 0AH, "ENTERED STRING IS PALINDROME $"
      MSG3 DB 0DH, 0AH, "ENTERED STRING IS NOT A PALINDROME $"
      STR DB 10H DUP(0)
      REVSTR DB 10H DUP(0)
      LEN DW 0

.CODE
      MOV AX, @DATA
      MOV DS, AX

      DISPLAY MSG1
      MOV SI, 00H

BACK1:
      MOV AH, 01H
      INT 21H

      CMP AL, 0DH
      JZ NEXT

      MOV STR[SI], AL
      INC SI
      INC LEN
      JMP BACK1

NEXT:
      MOV SI, 00H
      MOV DI, 00H
      ADD DI, LEN
      DEC DI
      MOV CX, LEN
      
BACK2:
      MOV AL, STR[SI]
      MOV REVSTR[DI], AL
      INC SI
      DEC DI
      LOOP BACK2
      
      MOV CX, LEN
      MOV SI, 00H
      MOV DI, 00H
      CLD
      
BACK3:
      MOV BL, STR[SI]
      CMP BL, REVSTR[DI]
      JNZ NOTPALI
      LOOP BACK3
      DISPLAY MSG2
      JMP LAST
      
NOTPALI:
      DISPLAY MSG3
      
LAST:
    MOV AH, 4CH
    INT 21H
    END
