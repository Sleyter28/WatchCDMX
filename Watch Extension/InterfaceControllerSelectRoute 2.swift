//
//  InterfaceControllerSelectRoute.swift
//  ProyectoMoviles
//
//  Created by Sleyter Angulo on 11/26/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceControllerSelectRoute: WKInterfaceController {

    @IBOutlet var tableResponse: WKInterfaceTable!
    
    let serverData="http://199.233.252.86/201713/printf/rutas.json"
    var ruta: ObjectRutas!
    var jsonParser: JsonParser!
    
    var coleccionRutasObject:[ObjectRutas] = [ObjectRutas]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        jsonParser = JsonParser(serverData: serverData)
        //jsonParser.rutasJsonToObject()
        coleccionRutasObject = jsonParser.rutasJsonToObject()
        let count = coleccionRutasObject.count ;
        print("Count: "+String(count))
        self.tableResponse.setNumberOfRows(count, withRowType: "reglones")
        let rowCount = self.tableResponse.numberOfRows
        
        for  i in 0 ..< rowCount {
            // Set the values for the row controller
            let row = self.tableResponse.rowController(at: i) as! ReglonController
            
            row.lblResponseRoute.setText(coleccionRutasObject[i].getNombreRuta())
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
