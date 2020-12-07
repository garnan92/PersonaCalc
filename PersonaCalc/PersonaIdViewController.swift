//
//  PersonaIdViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit


class PersonaIdViewController : UIViewController {
    
    var id : Int?
    
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
        
    }
    
    
    
}
