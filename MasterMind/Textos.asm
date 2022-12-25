Texto1Print:;UFV 22
    ld c,23;columna
    ld b,23;fila
    ld a,%01000110;color
    ld ix,Texto1
    call PRINTAT
    RET
Texto2Print:;NIGHT RIDERS
    ld c,10
    ld b,0
    ld a,%01000010
    ld ix,Texto2
    call PRINTAT
    RET