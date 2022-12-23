cargarPantalla:
    push bc 
    push de

    ld de,$4000
    ld bc,6912
buclepantalla:
    ldi

    ld a,b 
    or c 
    jp nz,buclepantalla
    
    pop de 
    pop bc 

    RET

