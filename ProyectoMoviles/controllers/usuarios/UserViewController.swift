//
//  UserViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var ineLabel: UILabel!
    @IBOutlet weak var idControlador: UILabel!
    @IBOutlet weak var fechaNac: UILabel!
    
    let serverData="http://199.233.252.86/201713/printf/controlador.json"
    
    var dataArray:[String: AnyObject]?
    
    // funcion que convierte de JSON a Array
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            do{
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                print("error")
            }
        }
        return [AnyObject]()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: serverData)
        let datosJSON = try? Data(contentsOf: url!)
        dataArray = try! JSONSerialization.jsonObject(with: datosJSON!) as? [String: AnyObject]
        

        let nombre = dataArray!["nombre"] as! String
        let apellidos = dataArray!["apellidos"] as! String
        let ineData = dataArray!["INE"] as! String
        let noControlador = dataArray!["noControlador"] as! String
        let fecha = dataArray!["fechaNacimiento"] as! String
  
        nameLabel.text = nombre
        lastName.text = apellidos
        ineLabel.text = ineData
        fechaNac.text = fecha
        idControlador.text = noControlador
     
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
