//
//  ObjectEventos.swift
//  ProyectoMoviles
//
//  Created by Alex on 01/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import Foundation


class ObjectEvento {
    
    var id:Int
    var tipo:String
    var coleccionDetalleEventos:[ObjectDetalleEvento]
    
    init(evento: JsonParser.Evento, detalleEvento: [ObjectDetalleEvento]) {
        id = evento.id
        tipo = evento.tipo
        coleccionDetalleEventos = detalleEvento
    }
    
    
    
}
