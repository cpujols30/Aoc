PintarColor:
    ld de,$08;incremento 6 veces para llegar al espacio de validacion
    add hl,de;se lo sumo a hl 
    CALL Comprobarnegros;llamo a la función comprobar negros
    CALL ComprobarBlancos;llamos a la función comprobar blancos
    CALL FINJUEGOW
    CALL ReinicioNyB;una vez pintados, los reinicio.
    RET

Comprobarnegros:;esta función comprueba si existen negros.
   
    ld a,(negros)
    ld b,a 
    CP 0;si existen negros los pinta saltando a la función pintar negros.
    jr nz,pintarnegros
    RET
ComprobarBlancos:;está función compreuba si existen blancos.
    ld a,(blancos)
    ld b,a 
    CP 0;si existen blancos los pinta saltando a la función pintar blancos.
    jr nz,pintarBlancos
    RET


pintarnegros:
bucle:;realizo el bucle tantas veces como negros haya 
    ld (hl),$10;los pinto de rojo
    inc hl;incremento hl para ponerlos al lado.
    djnz bucle
    RET

pintarBlancos:
bucle2:;realizo el bucle tantas veces como blancos haya
    ld (hl),$38;los pintos de blanco.
    inc hl;incremento hl para ponerlos al lado.
    djnz bucle2
    RET
ReinicioNyB:;reiniciamos porque si no en la siguiente jugada se acumularía.
    ld a,0
    ld (blancos),a;ponremos blancos a 0
    ld (negros),a;ponemos negros a 0
    RET
FuncionVictoria:
    ld hl,Win
    CALL cargarPantalla
    
    CALL Fpausa
    CALL Fpausa

    CALL CLEARSCR   
    HALT
FuncionDerrota:
    ld hl,Lose
    CALL cargarPantalla
    
    CALL Fpausa
    CALL Fpausa

    CALL CLEARSCR  
    CALL Fpausa
    CALL inicio 
    HALT

