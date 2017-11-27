//
//  ParadaViewController.swift
//  ProyectoMoviles
//
//  Created by Alex on 01/11/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class ParadaViewController: UIViewController {

    @IBOutlet weak var numBus: UILabel!
    @IBOutlet weak var nombreParada: UILabel!
    var ruta:ObjectRutas!
    var parada:ObjectParada!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numBus.text = parada.noAutobus
        nombreParada.text = parada.nombreParada
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setRuta (ruta: ObjectRutas) {
        self.ruta = ruta
    }
    func setParada (parada:ObjectParada) {
        self.parada = parada
    }
  

}
