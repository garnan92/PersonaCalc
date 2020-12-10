//
//  SkillDelegate.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import PersonaSkill

protocol SkillDelegate : NSObjectProtocol {
    
    func LoadSkillData(_ skills : PersonaSkills)
    
}
