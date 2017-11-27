//
//  EventoViewController.swift
//  ProyectoMoviles
//
//  Created by Daniela Martín on 29/10/17.
//  Copyright © 2017 alejandroCortizoFranza. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {
    

    let textCellIdentifier = "cellText"
    let serverData="http://199.233.252.86/201713/printf/envetos2.json"
    var jsonParser:JsonParser!
    var eventos:[ObjectEvento]!
    var dictionary:[String:ObjectEvento]! = [:]
    var sectionsNameVector:[String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParser = JsonParser(serverData: serverData)
        eventos = jsonParser.eventosJsonToObject()
        
        dictionary = ["Culturales" : eventos[0], "Sociales" : eventos[1], "Deportivos" : eventos[2]]
        sectionsNameVector = ["Culturales","Sociales","Deportivos"]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView,titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Culturales"
        case 1: return "Sociales"
        case 2: return "Deportivos"
        default :return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return dictionary["Culturales"]!.coleccionDetalleEventos.count
        case 1: return dictionary["Sociales"]!.coleccionDetalleEventos.count
        case 2: return dictionary["Deportivos"]!.coleccionDetalleEventos.count
        default : return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! EventoCellViewController
        let evento = self.eventos[indexPath.section]
        let detalleEvento = evento.coleccionDetalleEventos[indexPath.row]
        
        cell.hora.text = detalleEvento.hora
        cell.motivo.text = detalleEvento.motivo
    

        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
