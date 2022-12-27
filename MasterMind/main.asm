        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
inicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante
    ;PANTALLA DE INICIO
    
    ld hl,Inicio
    CALL cargarPantalla
    CALL Fpausa;llamamos a las funciones que nos pausen el programa
    CALL Fpausa
    
    CALL CLEARSCR;Borramos la pantalla

    CALL Dibujartablero;Dibujamos el tablero
    CALL Texto1Print;Dibujamos el texto de la de abajo a la derecha UFV-2022
    CALL Texto2Print;Dibujamos el texto de la arriba en el centro.Nombre del grupo, night riders
    ld hl,$5849;pondremos hl en esa direccion para probar el funcionamiento
    ld(intento_actual+1),hl
    ld c,10;ponemos c a 10 ya que son 10 intentos.
Juego:
   push bc;nos guardamos c ya que la vamos a usar dentro del programa
    CALL ImprimirIntento;imprimimos el texto que nos indica el numero de intenteto por el que va el usuario
   ld a,(intento_actual) 
   ld d,a;intento actual se almacena en d para saber a que slot ir
    ld b,4
   ld hl,(intento_actual+1)
    ld ix,intento;apunta a intento para ir guardando los intentos.
    push de;nos guardamos el intento actual
     push hl;nos guardamos la posición del slot primero en la pila
BucleIntentosInt:;este bucle pasa 4 veces,que son el número de slot
    CALL JugarSlot;llamamos a JugarSlot para que juegue en el slot 
    ld a,(hl);meto el valor de hl en a 
    ld (ix),a; meto el valor que ha introducido el usuario en intento

    inc ix; incremeto intento para que el siguiente lo meta en intento +1
    inc hl;incrementamos hl 2 veces  para que vaya al siguiente slot.
    inc hl
    dec b;decrementamos b para hacer el bucle 2 veces

    jr nz,BucleIntentosInt
   ;una vez termina el bucle llamamos a la función validación.
    CALL reset_copia;validación
    pop hl;sacamos hl para que esté en el primer slot de la fila que toca.
    CALL PintarColor;Llamamos a la función para que pinte en la validación
    pop de;sacamos d
    ld a,d;metemos a en d y la incrementamos 
    inc a 
    ld (intento_actual),a
   
    CALL slot_XY;incremento hl en base al numero de intentos que hay
    ld (intento_actual+1),hl
    pop bc;sacamos bc para poder continuar con el bucle Juego.
    dec c;decremetamos para seguir el bucle principal
   jr nz,Juego
    ;una vez realizado 10 intentos, el usuario recibira la imagen de derrota.
    CALL FuncionDerrota


;-------------------------------------------------------------------------------------------------
fin:            jr fin          ; Bucle infinito
;incluimos las rutinas externas
        include "tablero.asm"
        include "Teclado.asm"
        include "printat.asm"
        include "Textos.asm"
        include "validacion.asm"
        include "PintarValidacion.asm"
        include "SlotXY.asm"
        include "Imagen.asm"
        include "pausa.asm"
;Declaramos las variables y el texto a utilizar.
Texto1: defm "UFV-2022",0
Texto2: defm "Night riders",0

Texto3: defm "Intento:1",0
Texto4: defm "Intento:2",0
Texto5: defm "Intento:3",0
Texto6: defm "Intento:4",0
Texto7: defm "Intento:5",0
Texto8: defm "Intento:6",0
Texto9: defm "Intento:7",0
Texto10: defm "Intento:8",0
Texto11: defm "Intento:9",0
Texto12: defm "Intento:10",0

intento_actual DB 0,0;guarda el número de intento del jugador.
intento DB 0, 0, 0, 0;Intento jugador
quiz DB $20, $28, $30, $10;Combinacion ganadora,(verde claro,azul claro,amarillo,rojo)

copia DB 0, 0, 0, 0;copia quiz
negros DB 0;aciertos
blancos DB 0;color pero no la posicion

num_slots EQU 4;variable


;Variables de las imagenes
Inicio: INCBIN ImagenInicio.scr
Win: INCBIN ImagenVictoria.scr
Lose: INCBIN ImagenGameOver.scr

