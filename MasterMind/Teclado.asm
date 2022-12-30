JugarSlot:;función que nos jugará un slot.
        ld e,$00;funcion que usaremos para que nos almacene cada color
bucleteclas:
    CALL EsperarSoltar;llamamos a la funcion EsperarSoltar
    CALL EsperarPulsar
    
    
    cp $01;Si a se pone a $01 se termina el bucle
    jr nz,bucleteclas;
        RET
EsperarSoltar:;se comprueba si la tecla q es pulsada
        ld a,$fb       
        in a,($fe)
        cp $FF   ;comprobamos si toda la fila está pulsada
        jr nz,EsperarSoltar;el bucle sigue hasta que se dejen de pulsar las teclas
        RET

EsperarPulsar:
        ld a,$fb       
        in a,($fe)
        bit 0,a;Tecla Q
        jr z,TeclaQPulsada;comprobamos que la tecla q está pulsada,si pulsa salta a la función
        ld a,$fb       
        in a,($fe)
        bit 1,a;tecla W
        jr z,TeclaWPulsada;comprobamos que la tecla w está pulsada,si pulsa salta a la función
        ld a,$fb       
        in a,($fe)
        bit 4,a;Tecla T
        jr z,TeclaTPulsada; comprobamos que la tecla t está pulsada,si pulsa salta a la función
        jr EsperarPulsar; el bucle no para hasta pulsar una tecla

TeclaQPulsada:;entra aqui si esta pulsando una tecla q
        ld a,e
        cp $40; si pasa el ultimo color salta al ReinicioColor1 que pone el color de e al primer color 
       jr z,ReinicioColor1
       add $08;sumamos el color a e
        ld(hl),a
        ld e,a
    
        RET

TeclaWPulsada:
        ld a,e
        cp $00; si llega al primero,reiniciamos el color para que llegue al último 
        jr z,ReinicioColor2
        sub $08;al pusar la tecla w,restamos el color a e
        ld(hl),a 
        ld e,a

        RET
TeclaTPulsada:;si pulsa la tecla t a=1,lo usaremos para finalizar el programa
        ld a,1
        RET

ReinicioColor1:;Esta tecla pone el color e al principio
        ld e,$00
        ld a,e
        ld (hl),a
        jr z,EsperarPulsar
ReinicioColor2:;Esta tecla pone el color e al final
        ld e,$38
         ld a,e
        ld (hl),a
        jr z,EsperarPulsar   