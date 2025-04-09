object luke {
    var recuerdo = 'No tengo un recuerdo aún'

    var cantidadDeViajes = 0

    var vehiculoActual = alambiqueVeloz

    method cuantosViajes() = cantidadDeViajes

    method visitar(lugarAVisitar) {
        if (lugarAVisitar.requerimientoDeviaje()) {
        vehiculoActual.viajar()
        cantidadDeViajes += 1
        recuerdo = lugarAVisitar.recuerdoTipico()
        }
    }

    method cambiarDeVehiculo(nuevoVehiculo){
        vehiculoActual = nuevoVehiculo
    }

    method vehiculoActual() = vehiculoActual

    method ultimoRecuerdo() = recuerdo
}

object paris {
    method recuerdoTipico() = 'Llavero Torre Eiffel'

    method requerimientoDeViaje() = luke.vehiculoActual().tieneCombustible()

}

object buenosAires {
    var esTemporadaDeHierbas = false

    method cambiarSiEsTemporadaDeMateONo() {
      esTemporadaDeHierbas = not esTemporadaDeHierbas
    }

    method requerimientoDeViaje() = luke.vehiculoActual().esVeloz()

    method recuerdoTipico(){
        if (esTemporadaDeHierbas) {
            return 'Mate de Hierbas'
        }

        else {
            return 'Mate' 
        }
    }
}

object bagdad {
    var recuerdoTipico = 'Bidón de Petróleo'

    method recuerdoTipico() = recuerdoTipico

    method cambiarRecuerdoTipico(nuevoRecuerdo){
        recuerdoTipico = nuevoRecuerdo
    }

    method requerimientoDeViaje() = true
}

object lasVegas {
    var ciudadALaQueHomenajea = null

    method ciudadALaQueHomenajea() = ciudadALaQueHomenajea

    method cambiarCiudadALaQueHomenajeaA_(ciudadAHomenajear) {
        ciudadALaQueHomenajea = ciudadAHomenajear
    }

    method recuerdoTipico() = ciudadALaQueHomenajea.recuerdoTipico()

    method requerimientoDeViaje() = ciudadALaQueHomenajea.requerimientoDeViaje()
}

// Vehículos
object alambiqueVeloz {
    var esVeloz = true

    var combustible = 100

    var tieneCombustible = true

    method consumirCombustible() {
        combustible -= 10
    }

    method cambiarSiEsVeloz(){
        esVeloz = not esVeloz
    }

    method viajar() {
        self.consumirCombustible()
        tieneCombustible = combustible >= 10
    }

    method recargarCombustible() {
        combustible = 100
        tieneCombustible = true
    }

    method combustible() = combustible

    method tieneCombustible() = tieneCombustible
    
    method esVeloz() = esVeloz
}

object superChatarraEspecial {
    var misilesCargados = 10

    var municionDisponible = 100

    method viajar() {
        
    }

    method esVeloz() = true

    method tieneCombustible() = (misilesCargados * 10) +
        (municionDisponible) >= 50
}

object antiguallaBlindada {
    var esVeloz = false

    var tieneCombustible = true

    var cantidadDeGangsters = 4

    method cambiarCantidadDeGangsters(nuevaCantidad) {
        cantidadDeGangsters = nuevaCantidad
        tieneCombustible = cantidadDeGangsters > 0
        if (cantidadDeGangsters <= 2) {
            esVeloz = true
        }
    }

    method viajar() {
        /*Observación: Los gangsters viajan, siempre que llegan
        a un destino, uno se baja.*/
        if(tieneCombustible) {
            self.cambiarCantidadDeGangsters(cantidadDeGangsters - 1)
        }
    }

    method esVeloz() = esVeloz

    method tieneCombustible() = tieneCombustible
}



