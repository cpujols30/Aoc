        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
inicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante

    CALL pantalla
    CALL pruebac

     ld hl,$5849;pondremos hl en esa direccion para probar el funcionamiento
    ld c,10

Juego:
   push bc
   ld a,(intento_actual)
   ld d,a
    ld b,4
   
    ld ix,intento;apunta a intento
BucleIntentosInt:;este bucle pasa 
    CALL JugarSlot
     ld a ,(hl);meto el valor de hl en a 
     ld (ix),a; meto el valor en intento
  
        inc ix; incremeto intento para que el siguiente lo meta en intento +1
        
        inc hl
        inc hl
        dec b
    jr nz,BucleIntentosInt
    ld a,d
    inc a 
    ld d,a
     ld (intento_actual),a

    CALL reset_copia
    CALL slot_XY
    pop bc
    dec c
   jr nz,Juego


;-------------------------------------------------------------------------------------------------
fin:            jr fin          ; Bucle infinito

        include "pantalla.asm"
        include "Teclado.asm"
        include "printat.asm"
        include "Intento.asm"
        include "validacion.asm"

Texto1: defm "N Intento",0

intento_actual DB 0,0,0;se guarda en el primer 0 el intento(ld(intento),a->numero de intentos,se saca ld a ,(intento),el segundo 0 es la posicion del primer slot,el tercer 0 es la posición del espacio de validación)
intento DB 8, 0, 0, 0, 0;Intento jugador
quiz DB 8, 8, 4, 5, 0;Combinacion ganadora


copia DB 0, 0, 0, 0, 0;copia quiz
negros DB 4;aciertos
blancos DB 0;color pero no la posicion

num_slots EQU 4;variable
slot_XY:
        ld hl,$5849;slot1
        ld a,(intento_actual);mete el numero de intento en a 
       
        ld de,$40; de lo uso para sumar 
         ld b,a;b es igual a 
BucleFila:
        add hl,de
        djnz BucleFila
        RET
