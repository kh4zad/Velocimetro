//: Adrián Rodríguez Castro. Velocímetro

import UIKit

enum Velocidades: Int {
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init (velocidadInicial : Velocidades) {
        self = velocidadInicial
    }
    
    func descripcionVelocidad() -> String {
        var descripcion: String = ""
        
        switch self{
        case .Apagado:
            descripcion = "Apagado"
        case .VelocidadBaja:
            descripcion = "Velocidad Baja"
        case .VelocidadMedia:
            descripcion = "Velocidad Media"
        case .VelocidadAlta:
            descripcion = "Velocidad Alta"
        }
        
        return descripcion
    }
}


class Auto {
    var velocidad: Velocidades
    
    init () {
        self.velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    
    func cambioDeVelocidad() -> ( actual : Int, velocidadEnCadena: String) {
        
        let velocidadActual: Velocidades = self.velocidad
        
        switch self.velocidad {
        case Velocidades.Apagado:
            self.velocidad = Velocidades.VelocidadBaja
        case Velocidades.VelocidadBaja:
            self.velocidad = Velocidades.VelocidadMedia
        case Velocidades.VelocidadMedia:
            self.velocidad = Velocidades.VelocidadAlta
        case Velocidades.VelocidadAlta:
            self.velocidad = Velocidades.VelocidadMedia
        }
        
        return (velocidadActual.rawValue, velocidadActual.descripcionVelocidad())
    }
}


var auto: Auto = Auto()

for var i in 0..<20 {
    var velocidadActual = auto.cambioDeVelocidad()
    print("\(velocidadActual.actual), \(velocidadActual.velocidadEnCadena)")
}
