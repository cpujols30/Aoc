        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
inicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante

    CALL pantalla
    CALL JugarSlot
    ld a,e 
    ld (intento),a
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
        include "Teclado.asm"
   
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
