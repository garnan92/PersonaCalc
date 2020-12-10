//
//  PersonaIdDelegate.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import PersonaId
import PersonaResistance
import PersonaFusion

protocol PersonaIdDelegate : NSObjectProtocol {
    
    func LoadName(_ name : String)
    func LoadLevel(_ level : Int)
    func LoadPrice(_ price : Int)
    func LoadRace(_ race: Game)
    func LoadInherit(_ inherit : Game)
    func LoadResistance(_ resistance: PersonaResistance)
    func LoadFusiones(_ fusiones: PersonaFusion)
}
