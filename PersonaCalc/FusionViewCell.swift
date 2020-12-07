//
//  FusionViewCell.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit


class FusionViewCell : UITableViewCell {
    
    static let CellID = "fusionViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var ingrediente1Label: UILabel!
    @IBOutlet weak var ingrediente2Label: UILabel!
    
    
    
}
