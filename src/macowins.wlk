object macowins {
	const ventas = []

	method venderPrenda(unaVenta){
		ventas.add(unaVenta)
	}

	method ventasSegunDia(unaFecha) = ventas.filter(unaVenta => unaVenta.tieneFechaVendida(unaFecha))

	method gananciaSegunFecha(unaFecha) = self.ventasSegunDia(unaFecha).sum{ventaDelDia=>ventaDelDia.XXXXXXXXXX()}

}


class Venta {
	const fechaVenta
	const metodoPago
	const prendasVendidas = []
	
	method cantidadPrendasVendidas() = prendasVendidas.size()
	method tieneFechaVendida(unaFecha) = unaFecha == fechaVenta
}


class Prenda {
	const precioBase
	const estadoPrenda

	method precioPrenda() = estadoPrenda.precioModificado(precioBase)
}

class Saco inherits Prenda {
	
}

class Pantalon inherits Prenda {
	
}

class Camisa inherits Prenda {
	
}

object nueva {
	method precioModificado(precioBase) = precioBase
}

class Promocion{
	const descuentoFijo

	method precioModificado(precioBase) = precioBase - descuentoFijo
}

object liquidacion{
	method precioModificado(precioBase) = * 0.5
}
