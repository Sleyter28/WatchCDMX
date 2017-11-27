//
//  InterfaceControllerEvents.swift
//  Watch Extension
//
//  Created by Sleyter Angulo on 11/27/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceControllerEvents: WKInterfaceController {
    
    
    @IBOutlet var tableEvents: WKInterfaceTable!
    
    let serverData="http://199.233.252.86/201713/printf/envetos2.json"
    var jsonParser:JsonParser!
    var eventos:[ObjectEvento]!
    var dictionary:[String:ObjectEvento]! = [:]
    var sectionsNameVector:[String]!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        jsonParser = JsonParser(serverData: serverData)
        eventos = jsonParser.eventosJsonToObject()
        
        let count = eventos.count
        
        self.tableEvents.setNumberOfRows(count, withRowType: "reglonesEvents")
        let rowCount = self.tableEvents.numberOfRows
        
        // Iterate over the rows and set the label and image for each one.
        for i in 0 ..< rowCount {
            // Set the values for the row controller
            let row = self.tableEvents.rowController(at: i) as! ReglonControllerEvents?
            //print(eventos[i].coleccionDetalleEventos[0].hora)
            row?.lblMotivo.setText(eventos[i].coleccionDetalleEventos[0].motivo)
            row?.lblFecha.setText(eventos[i].coleccionDetalleEventos[0].hora)
        }
        
        
        
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
