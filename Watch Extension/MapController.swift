//
//  MapController.swift
//  Watch Extension
//
//  Created by Daniela Martín on 27/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import WatchKit
import Foundation

class MapController: WKInterfaceController {

    @IBOutlet var map: WKInterfaceMap!
    
    struct Location {
            let title: String
            let latitude: Double
            let longitude: Double
        }
        
        let locations = [
            Location(title: "Tacubaya",    latitude: 19.402674, longitude: -99.208836),
            Location(title: "Las Flores", latitude: 19.400265, longitude: -99.212119),
            Location(title: "Lieja",     latitude: 19.401434, longitude: -99.210173)
        ]
        
    
        var place: String = ""
        
        var location = CLLocationCoordinate2D()
        var region = MKCoordinateRegion()
        
        
    
    @IBAction func zoomSlider(_ value: Float) {
        let degrees:CLLocationDegrees = CLLocationDegrees(value)/130
        let span = MKCoordinateSpanMake(degrees, degrees)
        
        
        for l in locations {
            location = CLLocationCoordinate2D(latitude: l.latitude, longitude: l.longitude)
            region = MKCoordinateRegion(center: location, span: span)
            map.setRegion(region)
        }
    }
    
        
        override func awake(withContext context: Any?) {
            super.awake(withContext: context)
            
            setupDescription()
        }
        
        override func willActivate() {
            // This method is called when watch view controller is about to be visible to user
            super.willActivate()
        }
        
        override func didDeactivate() {
            // This method is called when watch view controller is no longer visible
            super.didDeactivate()
        }
        
        
        func setupDescription() {
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            for l in locations {
                location = CLLocationCoordinate2D(latitude: l.latitude, longitude: l.longitude)
                region = MKCoordinateRegion(center: location, span: span)
                map.setRegion(region)
                self.map.addAnnotation(location, with: .red)
                
            }
        }
        
}


