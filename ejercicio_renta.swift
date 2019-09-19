//
//  main.swift
//  ejercicio2520882015
//
//  Created by development on 9/19/19.
//  Copyright © 2019 development. All rights reserved.
//

import Foundation

//declaracion de funciones
func leerDatos() -> String {
    var entrada = NSString(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8.rawValue)! as String
    entrada = entrada.replacingOccurrences(of: "\n", with: "",options: NSString.CompareOptions.literal,range: nil)
    return entrada
}

func calcularRenta(salario : Double) -> Double {
    var renta : Double = 0.0
    if salario >= 0.01 && salario <= 472{
        renta = 0.0
    }else if salario >= 472.01 && salario <= 895.24 {
        
        renta = (salario - 472) * 0.10 + 17.67
        
        
    }else if salario >= 895.25 && salario <= 2038.10 {
        renta = (salario - 895.24) * 0.20 + 60.00
        
    }else if salario >= 2038.11 {
        
        renta = (salario - 2038.10) * 0.30 + 288.57
    }
    return renta
}

func calcularISS(salario : Double) -> Double {
    return  salario * 3.0 / 100
}

func calcularAFP(salario : Double) -> Double {
    return salario * 7.25 / 100
}

func totalDescuentos(renta : Double,iss : Double,afp : Double) -> Double {
    return renta + iss + afp
}
func calcularSalarioLiquido(salario : Double , totalDescuentos : Double ) -> Double{
    return salario - totalDescuentos
}

//declaracion de varariables y arreglos
var codigos : [String] = []
var trabajadores : [String] = []
var salarios : [Double] = []
var afp : [Double] = []
var iss : [Double] = []
var rentas : [Double] = []
var totalesDescuentos : [Double] = []
var salariosLiquidos : [Double] = []

var titulosTabla : [String] = ["Codigo","Nombre","Salario","ISS","AFP","Renta","Salario liquido"]

var continuar : Bool = true

while (continuar != false){
    print("codigo del empleado :")
    var codigo = leerDatos()
    codigos.append(codigo)
    print("nombre y apellido del empleado :")
    var nombre = leerDatos()
    
    trabajadores.append(nombre)
    print("salrio del empleado :")
    var salario = Double(leerDatos())!
    
    salarios.append(salario)
    
    var af = calcularAFP(salario: salario)
    afp.append(af)
    var  i = calcularISS(salario: salario)
    
    iss.append(i)
    
    var ren = calcularRenta(salario: salario)
    rentas.append(ren)
    
    var to = totalDescuentos(renta: ren, iss: i, afp: af)
    totalesDescuentos.append(to)
    
    var salarioLiquido = calcularSalarioLiquido(salario: salario, totalDescuentos: to)
    
    
    print("quieres agregar mas empleados ? para salir escribe \"no\" para continuar escribe \"si\" \n")
    var seguir = leerDatos()
    
    if seguir == "si" {
        continuar = true
    }else if seguir == "no" {
        continuar = false
    }
    
}

func imprimirTitulosTabla() {
    for i in 0 ..< titulosTabla.count {
        print(titulosTabla[i])
    }
}
imprimirTitulosTabla()





