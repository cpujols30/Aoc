pause:
    ld hl,10000
pausabucle:
    dec hl
    ld a,h 
    or 0
    jp nz,pausabucle
    RET
