import mensajeros.*
import destinos.*

object paquete {
    var estaPago = false
    var destino = brooklyn

    method estaPago() = estaPago
    method registrarPago() {estaPago = true}
    method cancelarPago() {estaPago = false}
    method puedeSerEntregado(unMensajero) {
        return estaPago and destino.dejaPasar(unMensajero)
    }
}

object paquetito {
    method estaPago() = true
    method puedeSerEntregado(unMensajero) = true
}

object paqueton {
    const destinos = []
    var importePagado = 0

    method precioTotal() = destinos.size() * 100
    method pagoParcial(unValor){
        importePagado = (importePagado + unValor).min(self.precioTotal())
    }
    method estaPago() = importePagado == self.precioTotal()
    method puedeSerEntregado(unMensajero) {
        return self.estaPago() and destinos.all({d => d.dejaPasar(unMensajero)})
    }
}
