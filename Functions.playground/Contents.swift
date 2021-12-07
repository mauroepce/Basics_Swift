
import Foundation
import UIKit



  





// Mark : PROTOCOL

protocol Proto {
    
    var soloLectura: String { get }
    var lecturaYEscritura: Int { get set }
    var escritura: Bool { get set }
    
}

class LectorEscritor: Proto {
    
    
    var soloLectura: String = "Hola"
    var lecturaYEscritura: Int = 1
    var escritura: Bool = true
        
}
 // Protocolo polimorfismo clase

protocol Nombrable {
    
    var nombre: String {get}
    
}




class NombreAnimal: Nombrable {
    
    var nombre: String
    var nombreAnimal: String
    
    init(nombre: String, nombreAnimal: String) {
        self.nombre = nombre
        self.nombreAnimal = nombreAnimal
    }
}

let mascota = NombreAnimal(nombre: "Perro", nombreAnimal: "Perrina")
print("Cuando era niño tenía un \(mascota.nombre) que se llamaba \(mascota.nombreAnimal)")



protocol GeneradorNumeroAleatorio{
    
    func random()->Double
}

class LCG: GeneradorNumeroAleatorio {
    
    var ultimoValor: Double = 41.0
    let m = 139968.0
    let a = 3877.0
    let c = 1865.0
    
    func random() -> Double {
        ultimoValor = (ultimoValor * a + c).truncatingRemainder(dividingBy: m)
        return ultimoValor / m
    }
}

protocol Conmutable {
    mutating func conmutar()
}


enum SwitchOnOff: Conmutable{
    case encendido, apagado
    
    
    mutating func conmutar(){
        switch self {
        case .apagado: self = .encendido
        case.encendido: self = .apagado
        }
    }
}

var interruptor = SwitchOnOff.apagado
print(interruptor)
interruptor.conmutar()
print(interruptor)
interruptor.conmutar()
print(interruptor)



/// INICIALIZADOR


struct Celsius{
    
    var temperaturaEnC: Double
    
    init(desdeFahrenheit fahrenheit: Double) {
        temperaturaEnC = (fahrenheit - 32.0) / 1.8
    }

    init(desdeKelvin kelvin: Double) {
        temperaturaEnC = kelvin - 273.15
    }
    
    init(_ celsius: Double){
        temperaturaEnC = celsius
        
    }
    
}

var temperatura = Celsius(desdeKelvin: 200)
print("La temperatura es de \(temperatura)")


struct Color {
    
    var red: Int
    var green: Int
    var blue: Int
    
    
    init(red: Int, green: Int, blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}


let crearColor = Color(red: 25, green: 50, blue: 35)


struct Tamaño {
    var ancho: Double = 0.0
    var alto: Double = 0.0
    
}

struct Punto {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rectangulo{
    
    var origen =  Punto()
    var tamaño = Tamaño()
    
    init(){}
    
    init(origen: Punto, tamaño: Tamaño) {
        self.origen = origen
        self.tamaño = tamaño
    }
    
    init(centro: Punto, tamaño: Tamaño) {
        let origenX = centro.x - (tamaño.ancho / 2)
        let origenY = centro.y - (tamaño.alto / 2)
        let punto = Punto(x: origenX, y: origenY)
        self.init(origen: punto, tamaño: tamaño)
        
    }
    
}

var tamaño = Tamaño(ancho: 10, alto: 20)
var punto = Punto(x: 0, y: 0)
var medidasRectangulo = Rectangulo(origen: punto, tamaño: tamaño)
var rectangulo = Rectangulo(centro: punto, tamaño: tamaño)

print("Este rectangulo tiene un tamaño de: \(tamaño.alto) de alto y \(tamaño.ancho) de ancho. Y un punto de origen en el plano cartesiano de: \(punto.x) en el eje X y \(punto.y) en el eje Y")


///Un ejemplo de inicializador designado y conveniencia

class Vehiculo{
    
    var numeroDeRuedas: Int = 0
    
    var descripción: String {
        return("\(numeroDeRuedas) ruedas")
    }
}


class Bicicleta: Vehiculo {
    
    var tieneCanastas: Bool
    
    override init(){
        tieneCanastas = false
        super.init()
        super.numeroDeRuedas = 2
    }
    
}

var bici = Bicicleta()
print(bici.descripción)

 */
 
///inicializador comida

class Food {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    
    convenience init (){
        self.init(name: "There is no food")
    }
}

class Ingredient: Food {
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
}


class Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


class Employee: Person{
    
    var employeeId: String
    var profile: String
    
    init(name: String, id: String, profile: String) {
        self.employeeId = id
        self.profile = profile
        super.init(name: name)
        
    }
    
    override convenience init (name: String){
        self.init(name: name, id: "employeeId", profile: "profile")
        self.employeeId = "123"
        self.profile = "Developer"
        
      
    }
    
}

let worker = Employee(name: "Mauricio")
print(worker.employeeId)
print(worker.profile)

let worker1 = Employee(name: "Elizabeth", id: "0850", profile: "Accountant")
print(worker1.employeeId)




//CLASES Y ESTRUCTURAS

struct Medida {
    var alto: Double
    var ancho: Double
}


var medidas = Medida(alto: 34.5, ancho: 28.4)
print(medidas)

var medidasCaja = medidas
medidas.alto = 50

print(medidas)


// PROTOCOLS

protocol SkaterType {
    
    var skaterType: String {get set}

}

protocol SkaterCountry {
    var country: String {get set}
}

protocol Skater {
    var name: String {get set}
}


class Competitor: SkaterType, SkaterCountry, Skater {
    
    var name: String
    var country: String
    var skaterType: String
    
    init(name: String, country: String, skaterType: String) {
        self.name = name
        self.country = country
        self.skaterType = skaterType
    }
    
}


class Tournament: Competitor {
    
    var tournament: String
    
    init(skaterName: String, country: String, skaterType: String, tournament: String) {
        self.tournament = tournament
        super.init(name: skaterName, country: country, skaterType: skaterType)
    }
    
    convenience init (skaterName: String, country: String, tournament: String) {
        self.init(skaterName: skaterName, country: country, skaterType: "skaterType",tournament: tournament)
    }
    
}


var skaterCompetitor = Competitor(name: "Mauricio Patiño", country: "Ecuador", skaterType: "Street")
var tournament = Tournament(skaterName: "Carlos Guerra", country: "Ecuador", skaterType: "Street", tournament: "X Games")
var tournament2 = Tournament(skaterName: "Julio Gallardo", country: "Ecuador", tournament: "Street League")

print("The skater competitor: \(skaterCompetitor.name) from \(skaterCompetitor.country) is a \(skaterCompetitor.skaterType) skater.")
print("The skater competitor: \(tournament.name) from \(tournament.country) is a \(tournament.skaterType) skater that will be competing on the: \(tournament.tournament) tournament.")



protocol Conmutable {
    
    mutating func conmute()
    
}

enum SwitchOnOff: Conmutable {
    
    case on, off
    
    mutating func conmute() {
        switch self {
        case .off: self = .on
        case .on: self = .off
        }
    }
}

var `switch` = SwitchOnOff.off
print(`switch`)
`switch`.conmute()
print(`switch`)


//Conversor de Temperatura

protocol ConversorDeTemperatura{
    func conversor()->Double
}

class FarenheitACelsius: ConversorDeTemperatura{
    
    
    var fahrenheit: Double
    let constantA: Double = 32
    let constantB: Double = 5/9
    
    init(fahrenheit: Double) {
        self.fahrenheit = fahrenheit
    }
    
    func conversor() -> Double {
        let celsius = (fahrenheit - constantA) * constantB
        return celsius
    }
}


var gradosFarenheit = FarenheitACelsius(fahrenheit: 45.5)

print(gradosFarenheit.conversor())

 */

// Generador de Números Aleatorios

protocol GeneradorNumeroAleatorio{
    func random()->Double
}

class LCG: GeneradorNumeroAleatorio{
    
    var ultimoValor: Double = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 23573.0
    
    func random() -> Double {
        ultimoValor = (ultimoValor * a + c).truncatingRemainder(dividingBy: m)
        return ultimoValor / m
    }
}


class Dado {
    
    let ncaras: Int
    let generador: GeneradorNumeroAleatorio
    
    init(ncaras: Int, generador: GeneradorNumeroAleatorio) {
        self.ncaras = ncaras
        self.generador = generador
    }
    
    
    func tirar()->Int{
        return Int(generador.random() * Double(ncaras)) + 1
    }
}

protocol JuegoDeDados {
    
    var dado: Dado {get}
    
    func jugar()
    
}

protocol JuegoDeDadosDelegate{
    
    func juegoIniciado(_ juego: JuegoDeDados)
    func juegoTerminado(_ juego: JuegoDeDados)
    func juego(_ juego: JuegoDeDados, nuevoTurnoConNumero numero: Int)

}

class CaminoDeDados: JuegoDeDados{
    
    let longitud: Int
    var dado: Dado
    var delegado: JuegoDeDadosDelegate?
    
    init(longitud: Int, dado: Dado){
        self.longitud = longitud
        self.dado = dado
    }
    
    func jugar(){
        var conteo = 0
        delegado?.juegoIniciado(self)
        while conteo < longitud {
            let numero = dado.tirar()
            delegado?.juego(self, nuevoTurnoConNumero: numero)
            conteo += numero
        }
        delegado?.juegoTerminado(self)
    }
    
}


class ContabilizadorDeJuegoDeDados: JuegoDeDadosDelegate {
    
    var numeroDeTurnos = 0
    
    func juegoIniciado(_ juego: JuegoDeDados) {
        if juego is CaminoDeDados{
            print("Se está iniciando una partida de Camino de dados")
        }
        print("Esta partida comienza con un dado de \(juego.dado.ncaras) caras")
    }
    
    func juegoTerminado(_ juego: JuegoDeDados) {
        print("El juego termina con un total de \(numeroDeTurnos) turnos")
    }
    
    func juego(_ juego: JuegoDeDados, nuevoTurnoConNumero numero: Int) {
        print("Se está jugando un turno donde el dado vale \(numero)")
        numeroDeTurnos += 1
    }
    
}

let dado = Dado(ncaras: 6, generador: LCG())
let juego = CaminoDeDados(longitud: 17, dado: dado)
let contabilizador = ContabilizadorDeJuegoDeDados()
juego.delegado = contabilizador
juego.jugar()


protocol RepresentableConTexto{
    
    var descripciónTextual: String {get}
    
}


protocol Descriptible: class, RepresentableConTexto {
    var descripcionResumida: String {get}
    
}

extension Dado: Descriptible {
    
    var descripciónTextual: String {
        return "Un dado con \(self.ncaras) caras"
    }
    
    var descripcionResumida: String {
        return "Un dado"
    }
    
}


extension GeneradorNumeroAleatorio {
    
    func randomBool() -> Bool {
        return random() > 0.5
    }
    
}


// Ejem. de Instancia probando (Extension GeneradorNumeroAleatorio)

let aleatorio = LCG()

for _ in 1...4 {
    print(aleatorio.random())
    print(aleatorio.randomBool())
}


//Ejem de instancia con Extensión con dado

let dado6 = Dado(ncaras: 6, generador: LCG())
print(dado6.descripciónTextual)


print("----------")

//Ejem diferente con Extensión

class Hamster {
    
    var nombre: String
    
    var descripciónTextual: String {
        return "Un Hamster llamado \(self.nombre)"
    }
    
    init(nombre: String){
        self.nombre = nombre
    }
    
}

extension Hamster: Descriptible {
    
    var descripcionResumida: String{
        return "Un hamster"
    }
    
}

// Ejem. Extensión Hamster

let carlos: RepresentableConTexto = Hamster(nombre: "Carlos")
print(carlos.descripciónTextual)


extension CaminoDeDados: Descriptible {
    
    var descripciónTextual: String {
        return "Camino de dados, con \(self.dado.descripciónTextual)"
    }
    
    var descripcionResumida: String{
        return "Camino de dados"
    }
    
    
}


var cosas: [RepresentableConTexto] = [
                                        Dado(ncaras: 16, generador: LCG()),
                                        Hamster(nombre: "Oreo"),
                                        CaminoDeDados(longitud: 17, dado: Dado(ncaras: 20, generador: LCG()))
                                    ]

for cosa in cosas{
    print(cosa.descripciónTextual)
}

//Ejem.
let pepe = Hamster(nombre: "Pepe")
print(pepe.descripcionResumida)
print(pepe.descripciónTextual)



///UNA VARIABLE O UN ELEMENTO SE CONFORMA A 1 PROTOCOLO O MÁS


protocol Nombrable{
    
    var nombre: String {get set}
}

protocol conEdad {
    
    var edad: Int {get set}
}

class Persona: Nombrable, conEdad{
    
    var nombre: String
    
    var edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
}



func deseareFelizCumpleaños(a individuo: Nombrable & conEdad){
    print("Feliz Cumpleaños \(individuo.nombre), ya tienes \(individuo.edad) años")
}

let mauro = Persona(nombre: "Mauro", edad: 33)
deseareFelizCumpleaños(a: mauro)




/// PROTOCOL EXERCISE


protocol TieneArea{
    
    var area: Double {get}
    
}

class Circulo: TieneArea {
    
    let pi: Double = 3.1415927
    var radio: Double
    var area: Double{
        return pi * radio * radio
    }
    
    init(radio: Double) {
        self.radio = radio
    }
    
}


class Pais: TieneArea{
    
    var area: Double
    
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    
    var patas: Int
    
    init(patas: Int) {
        self.patas = patas
    }
    
}


let objetos: [AnyObject] = [
                            Circulo(radio: 42),
                            Pais(area: 23),
                            Animal(patas: 4)

                            ]


for object in objetos {
    if let objectWithArea = object as? TieneArea{
        print("Es un elemento con Area: \(objectWithArea.area)")
    }
    else{
        print("Es un elemento sin Area")
    }
}

/// EJERCICIO CONTADOR  FUNCIIÓN INCREMENTAL Y FUNCIÓN HACIA CERO

@objc protocol FuenteDeContador{
    
    @objc optional func incrementar(porCantidad cantidad: Int)->Int
    
    @objc optional var incrementorFijo: Int {get}
}

class Contador {
    
    var conteo:Int = 0
    var fuente: FuenteDeContador?
    
    func incremento(){
        if let cantidad = fuente?.incrementar?(porCantidad: conteo) {
            conteo += cantidad
        }
        else if let cantidad = fuente?.incrementorFijo{
            conteo += cantidad
        }
    }
    
}

class FuenteTres: NSObject, FuenteDeContador {
    
    var incrementorFijo: Int = 3
}


class HaciaCero: NSObject, FuenteDeContador {
    
    func incrementar(porCantidad cantidad: Int) -> Int {
        if cantidad < 0 {
            return cantidad + 1
        }
        else if cantidad == 0{
            return 0
        }
        else{
            return cantidad - 1
        }
    }
}


let contador = Contador()
contador.fuente = FuenteTres()

for _ in 1...4 {
    
    contador.incremento()
    print(contador.conteo)
}

print("--------")

let contador1 = Contador()
contador1.fuente = HaciaCero()
contador1.conteo = 3

for _ in 1...4 {
    contador1.incremento()
    print(contador1.conteo)
}

 
//EJERCICIOS DE PROTOCOLOS Y EXTENSIONES

protocol ConNombre {
    
    var nombre: String {get}
}

protocol Tamaño{
    
    var tamaño: Int {get}
}

struct Archivo {
    
    var nombre: String
    
    init(nombre: String) {
        self.nombre  = nombre
    }
}

extension Archivo: ConNombre, Tamaño{
    
    internal var tamaño: Int {
        get {
            return self.nombre.characters.count
        }
    }
    
}





















