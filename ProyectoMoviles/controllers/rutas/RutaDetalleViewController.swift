//
//  RutaDetalleViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class RutaDetalleViewController: UIViewController {
    
    let serverData="http://199.233.252.86/201713/printf/rutaDetalle.json"
    @IBOutlet weak var nombre: UILabel!
    var name:String = "Balderas"
    var ruta:ObjectRutas!
    var auxRuta: ObjectRutas!
    var parada:ObjectParada!
    var jsonParser:JsonParser!
   
    @IBOutlet weak var rutaInicio: UILabel!
    @IBOutlet weak var rutaFin: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonParser = JsonParser(serverData: serverData)
        ruta = auxRuta == nil ? jsonParser.rutaJsonToObject() : auxRuta
        nombre.text = ruta.getNombreRuta()
        rutaInicio.text = ruta.getInicioRuta()
        rutaFin.text = ruta.getFinRuta()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func compartir(_ sender: Any) {
        
        let texto="¡Estoy en la ruta " + ruta.getNombreRuta() + "!. Sigue mi ruta en:"
        let liga="http://199.233.252.86/201713/printf/rutas.json"
        if let imagen2:UIImage=UIImage(named:"shareImage")!
        {
            let objetos:[AnyObject]=[texto as AnyObject,liga as AnyObject,imagen2]
            
            let actividad=UIActivityViewController(activityItems: objetos,applicationActivities: nil)
            
            actividad.excludedActivityTypes=[UIActivityType.mail]
            self.present(actividad,animated:true, completion:nil)
        }
        
    }
    
    

    
    
    
    
    func setRuta (ruta: ObjectRutas) {
        self.auxRuta = ruta
    }
    func setParada (parada:ObjectParada) {
        self.parada = parada
    }

}
