Fpausa:;Función para que el programa pierda tiempo haciendo operaciones 
    push af;Guardamos los valores de af,bc
    push bc
    ld bc,$F000;cuanto mayor es el numero que contiene bc,mas tiempo va a tardar el programa 
buclePausa:;hacemos un bucle que realice operaciones y que pause el programa
    dec bc
    ld a,b 
    inc hl;incrementamos y decrementamos hl
    dec hl 

    or c ;
    jr nz,buclePausa;salta cuando es distinto a 0,por lo que para que finalice a y c deben ser 0
    
    pop bc;recuperamos los valores de af,bc
    pop af 
    RET