import mensajeros.*
import paquetes.*

object empresa {
    const mensajeros = []

    method mensajeros() = mensajeros
    method contratarUnMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }
    method despedirUnMensajero(unMensajero) {
        mensajeros.remove(unMensajero)
    }
    method despedirATodos(){
        mensajeros.clear()
    }
    method esGrande() {
        return mensajeros.size() > 2
    }
    method puedeSerEntregadoPorElUltimoMensajero(unPaquete) {
        return unPaquete.puedeSerEntregado(mensajeros.first())
    }
    method pesoDelUltimoMensajero() {
        return self.ultimoEmpleado().pesoTotal()
    }
    method ultimoEmpleado() = mensajeros.last()
}