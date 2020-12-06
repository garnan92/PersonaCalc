//
//  PersonaTableViewCell.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 15/11/20.
//

import Foundation
import UIKit

class PersonaTableViewCell : UITableViewCell {
    
    static let CellID = "personaTableCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var inheritImage: UIImageView!
    @IBOutlet weak var inheritLabel: UILabel!
    
}
