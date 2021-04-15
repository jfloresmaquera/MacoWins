object macowins {
	const ventas = []

	method venderPrenda(unaVenta){
		ventas.add(unaVenta)
	}

	method ventasSegunDia(unaFecha) = ventas.filter({unaVenta => unaVenta.tieneFechaVendida(unaFecha)})

	method gananciaSegunFecha(unaFecha) = self.ventasSegunDia(unaFecha).sum({ventaDelDia=>ventaDelDia.gananciaVenta()})

}


class Venta {
	const fechaVenta
	const metodoPago
	const prendasVendidas = []
	
	method tieneFechaVendida(unaFecha) = unaFecha == fechaVenta
	method precioPrendasVendidas() = prendasVendidas.sum({prenda=>prenda.precioPrendas()})
	method gananciaVenta() = metodoPago.precioFinal(self)
	method calcularValorFraccionPrendas(fraccion) = prendasVendidas.sum({prenda=>prenda.fraccionDePrecio(fraccion)})
}
//para mi tiene sentido que cada Venta sepa cuanto es la precio total de sus prendas vendidas,
//y que el precio final si lo calcule cada metodo de pago


class Prendas {
	const precioBase
	const estadoPrenda
	var property tipo
	const cantidad

	method precioPrendas() = cantidad * estadoPrenda.precioModificado(precioBase)
	method fraccionDePrecio(fraccion) = cantidad * fraccion * precioBase
}

/*class Saco inherits Prenda {
	
}

class Pantalon inherits Prenda {
	
}

class Camisa inherits Prenda {
	
}*/
//siento que con poner una variable prenda es suficiente para saber que tipo de prenda es, ya que esto no afecta
//o aporta algun otro dato

object nueva {
	method precioModificado(precioBase) = precioBase
}

class Promocion{
	const descuentoFijo

	method precioModificado(precioBase) = precioBase-descuentoFijo
}

object liquidacion{
	method precioModificado(precioBase) = precioBase*0.5
}

class Efectivo{
	method precioFinal(venta) = venta.precioPrendasVendidas()
}

class Tarjeta inherits Efectivo{
	const cuotas
	const coeficienteFijo
	
	override method precioFinal(venta) = super(venta) + self.intereses(venta)
	method intereses(venta) = cuotas * coeficienteFijo + venta.calcularValorFraccionPrendas(0.01)
}