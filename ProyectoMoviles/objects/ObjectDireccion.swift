//
//  ObjectDireccion.swift
//  ProyectoMoviles
//
//  Created by Alex on 30/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import Foundation


class ObjectDireccion {
    
    var calle:String
    var colonia:String
    var delegacion:String
    var ciudad:String
    var cp:String
    var latitud:Double
    var longitud:Double
    

    
    init(direccion : JsonParser.Direccion) {
        self.calle = direccion.calle
        self.colonia = direccion.colonia
        self.delegacion = direccion.delegacion
        self.ciudad = direccion.ciudad
        self.cp = direccion.cp
        self.latitud = direccion.latitud
        self.longitud = direccion.longitud
        
    }
    
    
}
