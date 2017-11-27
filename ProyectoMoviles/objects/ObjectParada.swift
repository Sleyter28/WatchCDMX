//
//  ObjectParada.swift
//  ProyectoMoviles
//
//  Created by Alex on 30/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import Foundation


class ObjectParada {
    
    var id:Int
    var linea:String
    var inicio:String
    var nombreParada:String
    var noAutobus:String
    var direccion:ObjectDireccion
    var capacidadMaxima:Int
    
    
    
    
    init(parada : JsonParser.Parada, direccion: ObjectDireccion) {
        id = parada.id
        linea = parada.linea
        inicio = parada.inicio
        nombreParada = parada.nombreParada
        noAutobus = parada.noAutobus
        capacidadMaxima = parada.capacidadMax
        self.direccion = direccion
    }
 
    
    
    
    
}
