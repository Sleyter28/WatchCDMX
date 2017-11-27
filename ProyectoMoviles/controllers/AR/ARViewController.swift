//
//  ViewController.swift
//  PruebaAR
//
//  Created by Alex on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import CoreLocation
import MapKit






class ARViewController: UIViewController, ARSCNViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var ruta:ObjectRutas!
    let locationManager = CLLocationManager()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1000.0
        locationManager.requestWhenInUseAuthorization()
        
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.showsStatistics = true
        

        let scene = SCNScene()
        let position = SCNVector3Make(0, -0.3,-1.5)
        let textPos = textFunc(position: position)
        scene.rootNode.addChildNode(textPos)
        sceneView.scene = scene
        
    }
    
    func textFunc (position: SCNVector3) -> SCNNode {
        let text = SCNText (string: "Info", extrusionDepth : 0)
        text.firstMaterial?.diffuse.contents = UIColor.white
        text.font = UIFont(name: "Helvetica", size: 0.2)
        let textNode = SCNNode.init(geometry : text)
        
        return textNode
    }
    
    func showMarker () {
        let placeMark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: ruta.getParadasDeRuta()[0].direccion.latitud, longitude: ruta.getParadasDeRuta()[0].direccion.longitud))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    func setRuta(ruta : ObjectRutas) {
        self.ruta = ruta
    }
    
    
}
