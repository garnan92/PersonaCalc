//
//  PersonaViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaList
import SDWebImage

class PersonaViewController : UIViewController {
    
    var personaPresenter: PersonaPresenter = PersonaPresenter()
    
    @IBOutlet weak var exTable: UITableView!
    
    private var items : PersonaList = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personaPresenter.setDelegate(self)
        personaPresenter.setController(self)
        personaPresenter.registerCell(exTable)
        exTable.delegate = self
        exTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        personaPresenter.RestData()
    }
    
}

extension PersonaViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PersonaTableViewCell = exTable.dequeueReusableCell(withIdentifier: PersonaTableViewCell.CellID, for: indexPath) as! PersonaTableViewCell
        
        cell.nameLabel.text = items[indexPath.row].name
        cell.raceLabel.text = items[indexPath.row].race?.name
        cell.levelLabel.text = "lvl \(items[indexPath.row].level ?? 0)"
        cell.inheritLabel.text = items[indexPath.row].inherit?.name
        
        cell.inheritImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/\(items[indexPath.row].inherit?.name ?? "").png" ), completed: nil)
        
        return cell
    }
    
    
    
}

extension PersonaViewController : PersonaDelegate {
    
    func LoadData(_ items: PersonaList) {
        self.items = items
        self.exTable.reloadData()
    }
    
}
