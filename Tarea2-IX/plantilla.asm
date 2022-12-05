        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
qinicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante

    CALL pantalla
    CALL EsperarSoltar

    CALL slot_XY
    CALL Intento
        

;-------------------------------------------------------------------------------------------------
fin:            jr fin          ; Bucle infinito
intento_actual DB 0,0,0;se guarda en el primer 0 el intento(ld(intento),a->numero de intentos,se saca ld a ,(intento),el segundo 0 es la posicion del primer slot,el tercer 0 es la posición del espacio de validación)
;validación,slot,intento
espacioV DB 0;//Espacios de validacion
intento DB 0,0,0,0;//variable de intentos del usuario
clave DB 9,0,0,0;
claveTemp DB 0,0,0,0;
        include "pantalla.asm"

EsperarSoltar:;se comprueba si la tecla q es pulsada
        ld d,$00
        ld a,$fb       
        in a,($fe)
        bit $00,a;con el bit se cambia de tecla,tecla q
        jr z,EsperarSoltar;si pulsa Salta 
        inc d
        ld a,$fb   
        in a,($fe)
        bit $01,a;tecla w
        jr z,EsperarSoltar;si no pulsa Salta 
        inc d
        ld a,$fb
        in a,($fe)
        bit $02,a;tecla e
        jr z,EsperarSoltar
        inc d 
        ld a,$fb
        in a,($fe)
        bit $03,a;tecla r
        jr z,EsperarSoltar
        inc d 
        ld a,$fb
        in a,($fe)
        bit $03,a;tecla r
        jr z,EsperarSoltar
        inc d
        ld a,$fb
        in a,($fe)
        bit $04,a;tecla t
        jr z,EsperarSoltar
        inc d
        ld a,d 
        and $06;2 en a significa que no están pulsadas.
        jr nz,prueba1;entra cuando es 1 el and(cuando las teclas no están pulsadas)
        RET
prueba1:
        ld a,$19
        ld hl,$5830
        ld(hl),a
        RET
Prueba:;entra aqui si esta pulsando una tecla
        ld a,$12
        ld hl,$5830
        ld(hl),a
        RET

slot_XY:
        ld a,1
        ld (intento_actual),a; 
        ld hl,$5849
        ld (intento_actual+1),hl;slot primero,cada 40
        RET

validacionXY:
        ld hl,$5851
    ld (intento_actual+2),hl;slot de validación
        inc hl
     ld (espacioV),hl;
        RET
Intento:
        ld c,4
buclecopia:
        ld hl,(clave)
        ld a,(hl)
        ld b,(claveTemp)
        ld b,a 
        inc hl
        inc b
        dec c 
        jr nz,buclecopia;
        
        ld c,0;contador 
        ld a,(clave)
        ld b,(claveTemp)

        cp b
   
        RET
