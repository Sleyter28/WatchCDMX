//
//  ObjectDetalleEvento.swift
//  ProyectoMoviles
//
//  Created by Alex on 01/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import Foundation


class ObjectDetalleEvento {
    var id:Int
    var hora:String
    var motivo:String
    
    init(detalleEvento:JsonParser.DetalleEvento) {
        id = detalleEvento.id
        hora = detalleEvento.hora
        motivo = detalleEvento.motivo
    }
    
}
