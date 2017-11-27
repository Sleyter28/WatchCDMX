//
//  RoutesViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class RoutesViewController: UITableViewController, UISearchResultsUpdating {
    
    let serverData="http://199.233.252.86/201713/printf/rutas.json"
    
   // var dataArray:[Any]?
    var datosFiltrados = [Any]()
    let searchController = UISearchController(searchResultsController: nil)
    var indice = 0
    var objetoRuta = [String:Any]()
    var nombreRuta = String()
    let decoder = JSONDecoder()
    var rutas:Rutas!
    var algo:String = "AAA"

    
    struct Direccion:Codable {
        let calle:String
        let colonia:String
        let delegacion:String
        let ciudad:String
        let cp:String
        let latitud:Double
        let longitud:Double
    }
    
    struct Parada:Codable {
        let id:Int
        let linea:String
        let inicio:String
        let nombreParada:String
        let noAutobus:String
        let direccion:Direccion
        let capacidadMax:Int
        
    }
    
    struct Ruta:Codable {
        let id:Int
        let ruta:String
        let nombre:String
        let paradas:[Parada]
    }
    
    struct Rutas:Codable {
        let rutas:[Ruta]
    }
    
    //UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        
        // si la caja de búsuqeda es vacía, entonces mostrar todos los resultados
        if searchController.searchBar.text! == "" {
            //datosFiltrados = dataArray!
            datosFiltrados = rutas.rutas;
        } else {

            datosFiltrados = rutas.rutas.filter {
                let nombreRuta=$0.nombre;
                return(nombreRuta.lowercased().contains(searchController.searchBar.text!.lowercased()))
            }
        
        self.tableView.reloadData()
    }
        /*
    // funcion que convierte de JSON a Array
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: serverData)
        let datosJSON = try! Data(contentsOf: url!, options : [])
        //let datastring = NSString(data: datosJSON, encoding: String.Encoding.utf8.rawValue)
        //print(datastring)
        
      
        rutas = try! decoder.decode(Rutas.self, from:datosJSON)
        print(rutas)
 
        
        
        
        
       // dataArray = try! JSONSerialization.jsonObject(with: datosJSON) as? [Any]
       // datosFiltrados = dataArray!
        
        //usar la vista actual para presentar los resultados de la búsqueda
        searchController.searchResultsUpdater = self
        
        //controlar el background de los datos al momento de hacer la búsqueda
        searchController.dimsBackgroundDuringPresentation = false
        
        //manejar la barra de navegación durante la busuqeda
        searchController.hidesNavigationBarDuringPresentation = false
        
        //Definir el contexto de la búsqueda
        definesPresentationContext = true
        
        //Instalar la barra de búsqueda en la cabecera de la tabla
        tableView.tableHeaderView = searchController.searchBar
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // remplazar el uso de nuevoArray por datosFiltrados
        return (rutas.rutas.count)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntradaRuta", for: indexPath)
        
        //let ruta = datosFiltrados[indexPath.row] as! [String: AnyObject]
        let ruta = rutas.rutas[indexPath.row]
      
       // let sN:String = ruta["ruta"] as! String
       // let s:String = ruta["nombre"] as! String
        
        
        cell.textLabel?.text = "     "+ruta.ruta+" "+ruta.nombre
        
        return cell
    }
    
    /*
     Obtiene la row seleccionada
     
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //Verificar si la vista actual es la de búsqueda
        if (self.searchController.isActive) {
            indice = indexPath.row
            objetoRuta = datosFiltrados[indice] as! [String: Any]
            //print(objetoRuta["nombre"] as! String)
            //self.nombreRuta = objetoRuta as! String
        }
            //sino utilizar la vista sin filtro
        else {
            indice = indexPath.row
            //objetoRuta = dataArray![indice] as! [String: Any]
            objetoRuta = datosFiltrados[indice] as! [String:Any]
            //self.nombreRuta = objetoRuta["nombre"] as! String
        }
        
        
    }
     override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let sigVista=segue.destination as! DetalleRutasViewController
        
        
        
        
        print(nombreRuta)
        sigVista.setNombre(name: nombreRuta)
    }
    
    
}


