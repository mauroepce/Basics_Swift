import UIKit




//SOME FUNCTIONS EXERCISES


///For bucles

var alumno: (String, Int) = ("Mauricio", 33)
var (nombreAlumno, edadAlumno) = alumno

print(alumno.0)



var lista = ["Pedro", "Juan", "Mauricio"]

for repeticion in lista {
    print(repeticion)
}



var tipoDeNotebook = ["MacbookPro": 2012, "Macbook air": 2018, "iMAC": 2020]


for busqueda in tipoDeNotebook{
    
    print(busqueda)
    
}

tipoDeNotebook.forEach { (key, value) in
    print("\(key):\(value)")
}

//WHILE EXERCISES


var myNumberArray: [Int] = []

for index in 1...20 {
    myNumberArray.append(index)
}

print(myNumberArray)


var index = 0

var newNumberArray: [Int] = []

while index < 10 {
    newNumberArray.append(index)
    index += 1
}

print(newNumberArray)


//REPEAT WHILE EXERCISE

index = 0

repeat {
    print(newNumberArray[index])
    index += 1
}while index < 10


//DICTIONARY EXERCISES

let directorio: [String: Int] = ["Daniela": 30, "Andrea": 30, "Gati": 28]

for nombre in directorio.keys.sorted(){
    let edad: Int = directorio[nombre]!
    print("\(nombre) tiene \(edad) años")
}

var base: Int = 3
var exponente: Int = 2
var resultado: Int = 1

for _ in 0..<exponente{
    resultado *= base
}

print("Si la base es \(base) y es elevada a \(exponente), el restulado será \(resultado)")



var diccionario: Dictionary<Int, String> = [1: "Pedro", 2:"Mauricio"]

let nombreClave = diccionario[1]!

print(diccionario.count)
print(diccionario.isEmpty)
print(nombreClave)


//FUNC EXERCISES

//EXERCISE 1
func nombresPerfectos(nombreUno nombre: String, nombreDos nombre2: String){
    print("Este es el nombre 1:\(nombre), y este el nombre 2:\(nombre2)")
}

var imprimirNombres: () = nombresPerfectos(nombreUno: "Mauro", nombreDos: "Pepe")

//EXERCISE 2
func minMax(lista: [Int]) -> (minimo: Int, maximo: Int) {
    
    var minimo = lista[0]
    var maximo = lista[0]
    for elemento in lista{
        if elemento < minimo {
            minimo = elemento
        }
        if elemento > maximo {
            maximo = elemento
        }
    }
    return (minimo, maximo)
        
}


//EXERCISE 3

func salute(x persona: String, deNuevo: Bool) {
    var saludo: String = "Hola " + persona
    if deNuevo{
        saludo += ", gusto en verte de nuevo!"
    }
    print(saludo)
}

salute(x: "Mauro", deNuevo: true)

//EXERCISE 4

func prom(_ lista: Float...) -> Float{
    var valoresTotales: Float = 0
    for v in lista{
        valoresTotales += v
    }
    return valoresTotales / Float(lista.count)
}


