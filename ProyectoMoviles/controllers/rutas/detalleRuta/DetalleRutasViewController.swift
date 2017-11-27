//
//  DetalleRutasViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit



class DetalleRutasViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let serverData="http://199.233.252.86/201713/printf/rutaDetalle.json"
    let textCellIdentifier = "textCell"
    var jsonParser:JsonParser!
    var indice = 0
    var nombre:String = "placeholder"
    var ruta:ObjectRutas!
    var cambioRuta:ObjectRutas!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rutaName: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonParser = JsonParser(serverData:serverData)
        tableView.delegate = self
        tableView.dataSource = self
        ruta = cambioRuta == nil ? jsonParser.rutaJsonToObject() : cambioRuta
        rutaName.text = ruta.getNombreRuta()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ruta.getParadasDeRuta().count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! DetalleRutasCellViewController
        let parada = self.ruta.getParadasDeRuta()[indexPath.row]
        
        cell.numBus.text = parada.noAutobus
        cell.nombreParada.text = parada.nombreParada
        cell.ocupacionParada.text = parada.capacidadMaxima.description
        cell.tiempoParada.text = "2 min"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indice = indexPath.row
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "perfil" {
            var sigVista=segue.destination as! UserViewController
            
        }
        if segue.identifier == "notificaciones" {
            
        }
        if segue.identifier == "detalleParada" {
            var sigVista=segue.destination as! ParadaViewController
            sigVista.setRuta(ruta: ruta)
            sigVista.setParada(parada: ruta.getParadasDeRuta()[tableView.indexPathForSelectedRow!.row])
        }
        if segue.identifier == "ARControllerSegue" {
            var sigVista = segue.destination as! ARLocationViewController
            
            
        }
        
        //let nombre:String = rutas.rutas[tableView.indexPathForSelectedRow!.row].nombre
        
        print(indice)
        //sigVista.setRuta(objectRuta: self.ruta.getParadasDeRuta()[tableView.indexPathForSelectedRow!.row])
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setNombre(name:String) {
        nombre = name
    }
    
    func setRuta(objectRuta:ObjectRutas) {
        self.cambioRuta = objectRuta
        
    }
    
}
