
;pos inicial intento: 5849 ; +2, 3veces
;pos inicial respuesta: 5851 ; +1, 3veces

;--------------- VALIDAR -------------------------



reset_copia:
        ;COPIAR 
        LD BC, num_slots ;num_slots numero cuadrados en cada intento
        LD HL, quiz
        LD DE, copia
        LDIR ;copio BC n? de slots de HL en DE
        
        LD A,(negros)
        LD E,A
        LD IX, intento ;ix usualmente para leer db
        ;datos de entrada no deber?an tocarse
        LD IY, copia   ;iy tb


        LD B, num_slots
        LD C, 4;para que en la pasada de blancos me haga las 4 pasadas de IX nada m?s (el de copia)

B1:;COINCIDENCIAS EXACTAS
        LD A, (IX);cargo el primer elemento en a
        LD D, (IY);cargo el primer elemento en d

        CP D;comparo D con A

        JR NZ, B2; si no coincide salto a B2

        INC E;aumento contador de negros

        ;entra bien aqui solo en elementos coincidentes

        ;al coincidir se cambia pero solo se busca la primera coincidencia no las de despues
        ;creo que asi me va a leer la coincidencia en el bucle anidado a lo mejor poner IX 128 e IY a 255
        LD (IX), 128;sustituye por 128,para evitar coindicencias adicionales.
        LD (IY), 255;sustituye por 255,
B2:;PARA PASAR A LA SIGUIENTE
        INC IX;siguiente elemento de la lista
        INC IY;siguiente elemento de la lista


        DJNZ B1
; Acabo b1 y reseteo a posicion inicial IX e IY
        
        LD A, E;Negros,Guardar los aciertos exactos.
        LD (negros), A;guardo el n? negros
        LD A, (negros)
        

        ;obtengo el n? de negros y lo guardo en e
        LD A,(blancos);blancos son los aciertos no exactos.
        LD E, A;

        LD B, num_slots;reseteamos b
reset1_IXIY:     
        DEC IX
        DEC IY
        DJNZ reset1_IXIY
        
carga_pre_comp:
        LD B, num_slots

CompBlanco1:;comparo para encontrar blancos

        ;carga en a y d para que siempre tengan los ultimos valores de ix
        LD A, (IX);cargo el primer elemento en a
        LD D, (IY);cargo el primer elemento en d

        CP D;comparo D con A

        JR NZ, CompBlanco2 ;si no son iguales salto a 

        INC E;registro ? (E es para que compile) que representa los blancos
        
        ;INC IX      si encuentro coincidencia no puede haber otra con el mismo numero entonces hago salto
        LD (IX), 128;sustituye por 128
        LD (IY), 255;sustituye por 128
        


        ;esto se deberia hacer pero entonces deberia controlar el numero de pasadas que hacer de iy
        ;JR reset2_IY hago el salto porque una vez encontrdo coincidencia

CompBlanco2:;Incremento la posici?n de IY 4 veces por posicion de IX y luego aumento IX 4 veces 
        INC IY;incremento 1

        DJNZ CompBlanco1;cuando he recorrido todo IY paso al siguiente IX
        INC IX

        
        LD B, num_slots;reseteamos b
reset2_IY:
        DEC IY
        DJNZ reset2_IY
        ;aqui ya tengo la siguiente de la solucion pero para repetir necesito un registro

;------------------------- Solucionar

        ;que registro?
        ;DEC registro;aqui disminuyes un registro que guarde numero de slots contador para IX hasta pasar por todo IX
        DEC C
;------------------------        

        JR NZ, carga_pre_comp
        
        ;guardo numero de blancos en A para almacenarlo en la variable blancos
        LD A, E
        LD (blancos), A

        RET


FINJUEGOW:
        ld a,(negros)
        CP 4
        jr z,FuncionVictoria
        RET
