//
//  ARLocationViewController.swift
//  ProyectoMoviles
//
//  Created by Alex on 26/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit
import ARCL
import CoreLocation

class ARLocationViewController: UIViewController {
    var sceneLocationView = SceneLocationView()
    var ruta:ObjectRutas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneLocationView.run()
        
        
        view.addSubview(sceneLocationView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = view.bounds
    }
    
    
    
    func setRuta(ruta : ObjectRutas) {
        self.ruta = ruta
    }

}
