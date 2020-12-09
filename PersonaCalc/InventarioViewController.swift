//
//  InventarioViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import UIKit
import PersonaId
import SDWebImage

class InventarioViewController : UIViewController {
    
    @IBOutlet weak var exTable: UITableView!
    
    var inventarioPersona : [PersonaId] = []
    
    var presenter : InventarioPresenter = InventarioPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exTable.delegate = self
        exTable.dataSource = self
        presenter.setDelegate(self)
        presenter.registerCell(exTable)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inventarioPersona = []
        presenter.LoadRestInventario()
    }
    
    
    
}

extension InventarioViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inventarioPersona.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PersonaTableViewCell = exTable.dequeueReusableCell(withIdentifier: PersonaTableViewCell.CellID, for: indexPath) as! PersonaTableViewCell
        
        cell.nameLabel.text = inventarioPersona[indexPath.row].name
        cell.raceLabel.text = inventarioPersona[indexPath.row].race?.name
        cell.levelLabel.text = "lvl \(inventarioPersona[indexPath.row].level ?? 0)"
        cell.inheritLabel.text = inventarioPersona[indexPath.row].inherit?.name
        
        cell.inheritImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/\(inventarioPersona[indexPath.row].inherit?.name ?? "").png" ), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let personaView : PersonaIdViewController = PersonaIdViewController(nibName: "PersonaIdViewController", bundle: nil)
        
        personaView.id = inventarioPersona[indexPath.row].id
        
        self.navigationController?.pushViewController(personaView, animated: true)
        
    }
    
    
    
}

extension InventarioViewController : InventarioDelegate {
    
    func LoadData(_ items: PersonaId) {
        inventarioPersona.append(items)
        exTable.reloadData()
    }
    
    
}
