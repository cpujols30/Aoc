slot_XY:
        ld hl,$5849;slot1
        ld a,(intento_actual);mete el numero de intento en a 
       
        ld de,$40; de lo uso para sumar 
         ld b,a;b es igual a 
BucleFila:
        add hl,de
        djnz BucleFila
        RET
