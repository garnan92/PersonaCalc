//
//  PersonaIdViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaId
import SDWebImage

class PersonaIdViewController : UIViewController {
    
    var id : Int?
    var fusiones : [Fusione] = []
    
    var personaIdPresenter : PersonaIdPresenter = PersonaIdPresenter()
    
    //MARK: - Componentes de la vista
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var RaceLabel: UILabel!
    
    @IBOutlet weak var inheritImage: UIImageView!
    @IBOutlet weak var inheritLabel: UILabel!
    
    @IBOutlet weak var physImage: UIImageView!
    @IBOutlet weak var physLabel: UILabel!
    
    @IBOutlet weak var gunImage: UIImageView!
    @IBOutlet weak var gunLabel: UILabel!
    
    @IBOutlet weak var fireImage: UIImageView!
    @IBOutlet weak var fireLabel: UILabel!
    
    @IBOutlet weak var iceImage: UIImageView!
    @IBOutlet weak var iceLabel: UILabel!
    
    @IBOutlet weak var elecImage: UIImageView!
    @IBOutlet weak var elecLabel: UILabel!
    
    @IBOutlet weak var windImage: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var psyImage: UIImageView!
    @IBOutlet weak var psyLabel: UILabel!
    
    @IBOutlet weak var nukeImage: UIImageView!
    @IBOutlet weak var nukeLabel: UILabel!
    
    @IBOutlet weak var blessImage: UIImageView!
    @IBOutlet weak var blessLabel: UILabel!
    
    @IBOutlet weak var curseImage: UIImageView!
    @IBOutlet weak var curseLabel: UILabel!
    
    @IBOutlet weak var exTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personaIdPresenter.setDelegate(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        personaIdPresenter.LoadRestData(id!)
        personaIdPresenter.LoadRestData(id!)
    }
    
}

extension PersonaIdViewController : PersonaIdDelegate {
    
    func LoadName(_ name: String) {
        nameLabel.text = name
    }
    
    func LoadLevel(_ level: Int) {
        levelLabel.text = "lvl \(level)"
    }
    
    func LoadPrice(_ price: Int) {
        priceLabel.text = "Precio: \(price) ¥"
    }
    
    func LoadRace(_ race: Game) {
        RaceLabel.text = race.name
    }
    
    func LoadInherit(_ inherit: Game) {
        inheritLabel.text = inherit.name
        inheritImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/\(inherit.name ?? "").png" ), completed: nil)
    }
    
    func LoadResistance(_ resistance: Resistance) {
        
        physImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/phys.png" ), completed: nil)
        physLabel.text = resistance.phys
        
    }
    
    func LoadFusiones(_ fusiones: [Fusione]) {
        self.fusiones = fusiones
        exTable.reloadData()
    }
    
    
    
    
}
