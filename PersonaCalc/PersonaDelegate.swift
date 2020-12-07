//
//  PersonaDelegate.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import PersonaList

protocol PersonaDelegate: NSObjectProtocol  {
    func LoadData(_ items: PersonaList)
}
