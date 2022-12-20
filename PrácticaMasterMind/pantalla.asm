pantalla:
       ld a,$00
       out($fe),a ;Ponemos el marco negro
       ld hl,$5828 ;posicion 5828 para poner el tablero en el medio
       ld b,10;bucle exterior
        ld de,$5828 ;Uso de variable de como auxiliar para guardar cada linea 
        ld hl,de
bucleext;
        ld c,15;control de bucle 1
        ld a,$09 ;color a 

bucle1: ;bucle para hacer lineas horizontales menos la ultima de todas
       
       ld(hl),a  ;cargo el color en su sitio
       inc hl; ;incremento para que haga la linea
        dec c;decremento c para que no sea bucle infinito(variable del bucle)
       jr nz, bucle1; usamos jr para que tenga como referencia el decremento de c
       ld c,17;
buclepr:
        inc hl;
        dec c;
        jr nz,buclepr
        ld c,4 ;declaramos c para el siguiente bucle 
bucleaux: ;este bucle realizará los slots.
        ld a,$09 ;cargo el color azul en a
        ld (hl),a ;lo metemos en la posición de hl para que lo pinte
        inc hl ;incremento hl para meter el siguiente color
        ld a,$01 ;cargo negro en a 
        ld(hl),a ;cargo en la posición de hl para que  lo pinte
        inc hl ; incremento hl para meter el siguiente color
        dec c ; decremento c para que haga 4 veces el bucle
        jr nz,bucleaux ;utilizo jr nz para que coja c como variable

        ld a,$09 ;Cargo el color azul otra vez para realizar la evaluación de aciertos
        ld (hl),a ;Cargo en hl,que será el borde del rectangulo
        inc hl
        ld a,$01 ;Cargo el color negro y a continuación realizo un bucle donde me pinte los 5 de color negro
        ld c,5
bucleaux2:
        ld (hl),a 
        inc hl
        dec c 
        jr nz,bucleaux2
        ld a,$09 ;Vuelvo a cargar en azul para realizar el borde
        ld (hl),a 
        ld c,18;
buclepr2:
        inc hl;
        dec c;
        jr nz,buclepr2
        djnz bucleext; Finaliza el bucle principal,donde pintará todo menos la ultima linea inferior
        ld c,15 ;Cargo 15 en c para que me haga la linea 15 pixeles
bucleinf: ;hago el bucle para que pinte las 15 lineas 
        ld(hl),a 
        inc hl
        dec c 
        jr nz,bucleinf ;finaliza el bucle de la linea inferior
        RET