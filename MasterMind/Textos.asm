Texto1Print:;Pintará UFV 22
    ld c,23;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto1
    call PRINTAT
    RET
Texto2Print:;Pintará NIGHT RIDERS
    ld c,10
    ld b,0
    ld a,%01000010
    ld ix,Texto2
    call PRINTAT
    RET
ImprimirIntento:;Comprobará en que intento se encuentra el usuario  y dependiendo de este, Imprimirá el número de intento en pantalla.
    CP 0
   jr z,ImprimirIntento1
    CP 1
   jr z, ImprimirIntento2
   CP 2
   jr z, ImprimirIntento3
   CP 3
   jr z, ImprimirIntento4
   CP 4
   jr z, ImprimirIntento5
   CP 5
   jr z, ImprimirIntento6
    CP 6
   jr z,ImprimirIntento7
    CP 7
   jr z, ImprimirIntento8
   CP 8
   jr z, ImprimirIntento9
   CP 9
   jr z, ImprimirIntento10
    RET

;A continuación,se encuentran las variables que pinten cada uno de los intentos.
ImprimirIntento1:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto3
    call PRINTAT
    RET
ImprimirIntento2:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto4
    call PRINTAT
    RET
ImprimirIntento3:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto5
    call PRINTAT
    RET
ImprimirIntento4:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto6
    call PRINTAT
    RET
ImprimirIntento5:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto7
    call PRINTAT
    RET
ImprimirIntento6:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto8
    call PRINTAT
    RET
ImprimirIntento7:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto9
    call PRINTAT
    RET
ImprimirIntento8:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto10
    call PRINTAT
    RET
ImprimirIntento9:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto11
    call PRINTAT
    RET
ImprimirIntento10:
    ld c,0;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto12
    call PRINTAT
    RET