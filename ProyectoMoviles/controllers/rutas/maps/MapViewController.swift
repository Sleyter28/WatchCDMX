//
//  MapViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 25/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    let serverData="http://199.233.252.86/201713/printf/rutaDetalle.json"
    var jsonParser:JsonParser!
    var indice = 0
    var ruta:ObjectRutas!
    var paradas:[ObjectParada?] = []
    var parada:ObjectParada!
    var direcciones: [ObjectDireccion?] = []
    let locationManager = CLLocationManager()
    var longitud:Double = 0.0
    var latitud:Double = 0.0
    var nombres = [String]()
    var i:Int = 0;
    var n:String = "";
    
    struct Location {
        let title: String
        let latitude: Double
        let longitude: Double
    }
    
    var locations = [Location]()
    
/*    let locations = [
        ["title": "New York, NY",    "latitude": 19.4256949, "longitude": -99.19387319],
        ["title": "Los Angeles, CA", "latitude": 19.4262732, "longitude": -99.1946177],
        ["title": "Chicago, IL",     "latitude": 19.4264827, "longitude":-99.194677]
    ]
    */
    
    override func viewDidLoad() {
    
        jsonParser = JsonParser(serverData:serverData)
        
        ruta  = jsonParser.rutaJsonToObject()
        print("------Hola-------")
        paradas = ruta.getParadasDeRuta()
        
        for p in paradas{
            direcciones += [p!.direccion]
            nombres += [p!.nombreParada]
        }
    
            for d in direcciones {
                n = nombres[i]
                locations += [Location(title: n, latitude: (d?.latitud)!, longitude: (d?.longitud)!)]
               // getLocations(t: n, lo: (d?.longitud)!, la: (d?.latitud)!)
                
                i = i+1
            }
        
        for l in locations{
            print(l.title)
        }
        
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            map.addAnnotation(annotation)
        }
            map.showsCompass=true
            map.showsScale=true
//            map.showsTraffic=true
            map.isZoomEnabled=true
        
        
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
  
      
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        //zoom
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.0045, 0.0045)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    } 
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            map.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            map.showsUserLocation = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
