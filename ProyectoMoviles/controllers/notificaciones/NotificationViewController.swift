//
//  NotificationViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class NotificationViewController: UITableViewController {
        
        let serverData="http://199.233.252.86/201713/printf/notificacion.json"
        
        var dataArray:[Any]?
    
        let decoder = JSONDecoder()
    
        struct DetailNotification:Codable {
            let id:Int
            let hora:String
            let descripcion:String
        }
    
    struct Notification:Codable {
        let detail:DetailNotification
    }
    
    
        
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
            let datosJSON = try! Data(contentsOf: url!)
            dataArray = try! JSONSerialization.jsonObject(with: datosJSON) as? [Any]
         
            
            //let url = URL(string: serverData)
            //let datosJSON = try! Data(contentsOf: url!, options : [])
            

            
            
            print(dataArray)
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
            // #warning Incomplete implementation, return the number of rows
            return (dataArray?.count)!
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EntradaRuta", for: indexPath)
            
            let notificacion = dataArray?[indexPath.row] as! [String: AnyObject]
            
            let hora:String = notificacion["hora"] as! String
            let descripcion:String = notificacion["descripcion"] as! String
            
            print(notificacion)
            print(hora)
            cell.textLabel?.text = "     "+hora+" "+descripcion
            
            return cell
        }
}

