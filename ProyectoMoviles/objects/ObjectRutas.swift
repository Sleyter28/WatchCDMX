//
//  Rutas.swift
//  ProyectoMoviles
//
//  Created by Alex on 30/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import Foundation


class ObjectRutas {
    
    var id:Int
    var ruta:String
    var nombre:String
    var paradas:[ObjectParada]
    var inicio:String
    var fin:String
    

    
    init(ruta: JsonParser.Ruta, paradas: [ObjectParada]) {
        id = ruta.id
        self.ruta = ruta.ruta
        nombre = ruta.nombre
        self.paradas = paradas
        self.inicio = ruta.inicio
        self.fin = ruta.fin
    }
    
    func getRuta() -> String {
        return ruta
    }
    
    func getNombreRuta() -> String {
        return nombre
    }
    
    func getInicioRuta() -> String {
        return inicio
    }
    
    func getFinRuta() -> String {
        return fin
        
    }
    
    func getIdRuta() -> Int {
        return id
    }
    
    func getParadasDeRuta() -> [ObjectParada] {
        return paradas
    }
    
    
}



