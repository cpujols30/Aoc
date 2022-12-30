cargarPantalla:;usaremos esta función para cargar las iamgenes correspondientes
    push bc ;guardamos en la pila bc y de
    push de

    ld de,$4000
    ld bc,6912
buclepantalla:
    ldi

    ld a,b 
    or c 
    jp nz,buclepantalla
    
    pop de ;sacamos de la pila de y bc
    pop bc 

    RET

