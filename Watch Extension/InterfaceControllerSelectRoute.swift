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
        tableResponse.setNumberOfRows(count, withRowType: "reglones")
        
        for indice in 0 ..< count {
            let elReglon = tableResponse!.rowController(at: indice) as! ReglonController?
            var string = coleccionRutasObject[indice].getNombreRuta()
            print("Route: "+string)
            elReglon?.lblResponseRoute.setText(string)
        }
        //print(ruta!.getRuta().count)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
