pruebac:
    ld c,0
    ld b,0
    ld a,%00000110
    ld ix,Texto1
    call PRINTAT
    ld c,0
    ld b,0
    ld a,%00000110
    ld ix,Texto1
    RET