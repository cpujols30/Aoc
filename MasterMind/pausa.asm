Fpausa:;Función para que el programa pierda tiempo haciendo operaciones 
    push af;Guardamos los valores de af,bc
    push bc
    ld bc,$A000
buclePausa:;hacemos un bucle que realice operaciones y que pause el programa
    dec bc
    ld a,b 
    inc hl;incrementamos y decrementamos hl
    dec hl 
    or c ;
    jr nz,buclePausa
    
    pop bc;recuperamos los valores de af,bc
    pop af 
    RET