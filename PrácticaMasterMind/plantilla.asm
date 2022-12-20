        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
inicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante

    CALL pantalla
    CALL pruebac
    ld b,4
     ld hl,$5849;pondremos hl en esa direccion para probar el funcionamiento
BucleIntentos:
    CALL JugarSlot
        inc hl
        inc hl
        dec b
    jr nz,BucleIntentos

  

;-------------------------------------------------------------------------------------------------
fin:            jr fin          ; Bucle infinito

        include "pantalla.asm"
        include "Teclado.asm"
        include "printat.asm"
        include "Intento.asm"

Texto1: defm "N Intento",0
intento_actual DB 0,0,0;se guarda en el primer 0 el intento(ld(intento),a->numero de intentos,se saca ld a ,(intento),el segundo 0 es la posicion del primer slot,el tercer 0 es la posición del espacio de validación)
  
slot_XY:
        ld hl,$5849
        ld a,(NumeroIntento);mete el numero de intento en a 
        ld b,a
        ld de,$40
BucleFila:
        add hl,de
        djnz BucleFila
        RET
