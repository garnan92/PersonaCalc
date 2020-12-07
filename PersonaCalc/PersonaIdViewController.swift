//
//  PersonaIdViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaId
import PersonaResistance
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
        personaIdPresenter.LoadResistanceData(id!)
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
    
    func LoadResistance(_ resistance: PersonaResistance) {
        
        physImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/phys.png" ), completed: nil)
        physLabel.text = resistance.phys
        
        gunImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/gun.png" ), completed: nil)
        gunLabel.text = resistance.gun
        
        fireImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/fire.png" ), completed: nil)
        fireLabel.text = resistance.fire
        
        iceImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/ice.png" ), completed: nil)
        iceLabel.text = resistance.ice
        
        elecImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/elec.png" ), completed: nil)
        elecLabel.text = resistance.ice
        
        windImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/wind.png" ), completed: nil)
        windLabel.text = resistance.wind
        
        psyImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/psy.png" ), completed: nil)
        psyLabel.text = resistance.psy
        
        nukeImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/nuke.png" ), completed: nil)
        nukeLabel.text = resistance.nuke
        
        blessImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/bless.png" ), completed: nil)
        blessLabel.text = resistance.bless
        
        curseImage.sd_setImage(with: URL(string: "https://aqiu384.github.io/megaten-fusion-tool/assets/images/p5/curse.png" ), completed: nil)
        curseLabel.text = resistance.curse
        
    }
    
    func LoadFusiones(_ fusiones: [Fusione]) {
        self.fusiones = fusiones
        exTable.reloadData()
    }
    
    
    
    
}