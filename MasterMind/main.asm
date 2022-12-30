        DEVICE ZXSPECTRUM48
        org $8000   
  ; Programa ubicado a partir de $8000 = 32768
 
inicio:         di              ; Deshabilitar interrupciones
                ld sp,0         ; Establecer el puntero de pila en la parte alta de la memoria
        
;-------------------------------------------------------------------------------------------------
;Código del estudiante
    ;JUEGO
    
    ld hl,Inicio
    CALL cargarPantalla;cargamos la pantalla de inicio
    CALL Fpausa;llamamos a las funcion que nos pause el programa
    
    CALL CLEARSCR;Borramos la pantalla

    CALL Dibujartablero;Dibujamos el tablero
    ld a,0
    ld (intento_actual),a;ponemos el intento actual a 0 para que no guarde el conteo de la primera partida jugada(después de 10 intentos) 
    CALL Texto1Print;Dibujamos el texto de la de abajo a la derecha UFV-22723
    CALL Texto2Print;Dibujamos el texto de la arriba en el centro.Nombre del grupo, night riders
    ld hl,$5849;pondremos hl en esa direccion para probar el funcionamiento
    ld(intento_actual+1),hl;guardaremos la posición del slot 
    ld c,10;ponemos c a 10 ya que son 10 intentos.
Juego:
   push bc;nos guardamos c ya que la vamos a usar dentro del programa
    CALL ImprimirIntento;imprimimos el texto que nos indica el numero de intenteto por el que va el usuario
   ld a,(intento_actual) 
   ld d,a;intento actual se almacena en d para saber a que slot ir
    ld b,4;declaramos el bucle de dentro
   ld hl,(intento_actual+1);metemos el slot correspondiente en hl
    ld ix,intento;apunta a intento para ir guardando los intentos.
    push de;nos guardamos el intento actual
     push hl; lo guardaremos en la pila para usarlo al  pintar la validación
BucleIntentosInt:;este bucle pasa 4 veces,lo que hace es guardar el intento del usuario
    CALL JugarSlot;llamamos a JugarSlot para que juegue en el slot 
    ld a,(hl);meto el valor de hl en a 
    ld (ix),a; meto el valor que ha introducido el usuario en intento

    inc ix; incremeto intento para que el siguiente lo meta en intento +1
    inc hl;incrementamos hl 2 veces  para que vaya al siguiente slot.
    inc hl
    dec b;decrementamos b para hacer el bucle 4 veces

    jr nz,BucleIntentosInt
   ;una vez termina el bucle llamamos a la función validación.
    CALL Validar;llamamos a la validación
    pop hl;sacamos hl para que esté en el primer slot de la fila que toca.
    CALL PintarColor;Llamamos a la función para que pinte en la validación
    pop de;sacamos d
    ld a,d;metemos a en d y la incrementamos 
    inc a 
    ld (intento_actual),a;actualizamos en  intento_actual el número de intento del usuario 
   
    CALL slot_XY;incremento hl en base al numero de intentos que hay con la función Slot_XY
    ld (intento_actual+1),hl;Metemos en intento_actual+1 la posición del slot del intento correspondiente
    pop bc;sacamos bc para poder continuar con el bucle Juego.
    dec c;decremetamos para seguir el bucle principal
   jr nz,Juego
    ;una vez realizado 10 intentos, el usuario recibira la imagen de derrota.
    CALL FuncionDerrota


;-------------------------------------------------------------------------------------------------
fin:            jr fin          ; Bucle infinito
;FIN DE JUEGO

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

Texto1: defm "UFV-22/23",0
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

;Variables del juego a utilizar
intento_actual DB 0,0;intento_actual guarda el numero de intento, intento_actual+1 guarda la posición del 1ºslot
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

