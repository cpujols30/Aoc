JugarSlot:
        ld b,$00
        ld e,$00
bucleteclas:
    ld hl,$5849
  
    CALL EsperarSoltar
    CALL EsperarPulsar
    
    
    cp $01
    jr nz,bucleteclas;salta cuando está a 0
        RET
EsperarSoltar:;se comprueba si la tecla q es pulsada
        ld a,$fb       
        in a,($fe)
        cp $FF   
        jr nz,EsperarSoltar
        RET

EsperarPulsar:
        ld a,$fb       
        in a,($fe)
        bit 0,a;con el bit se cambia de tecla,tecla q 
        jr z,TeclaQPulsada
        ld a,$fb       
        in a,($fe)
        bit 1,a;con el bit se cambia de tecla,tecla w 
        jr z,TeclaWPulsada
        ld a,$fb       
        in a,($fe)
        bit 4,a;con el bit se cambia de tecla,tecla t 
        jr z,TeclaTPulsada
        jr EsperarPulsar;si pulsa Salta 

TeclaQPulsada:;entra aqui si esta pulsando una tecla
        ld a,e
       add $08
        ld(hl),a
        ld e,a
       cp $40
       jr z,ReinicioColor1
        RET

TeclaWPulsada:
        ld a,e
        sub $08
        ld(hl),a 
        ld e,a
        cp $00
        jr z,ReinicioColor2
        RET
TeclaTPulsada:
        ld a,1
        RET

ReinicioColor1:
        ld e,$00
        jr z,EsperarPulsar
ReinicioColor2:
        ld e,$32
        jr z,EsperarPulsar   