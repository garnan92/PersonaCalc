//
//  SkillCellView.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import UIKit

class SkillCellView: UITableViewCell {
    
    static let CellID = "SkillCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    
}
