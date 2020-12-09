//
//  InventarioDelegate.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import PersonaId


protocol InventarioDelegate: NSObjectProtocol  {
    func LoadData(_ items: PersonaId)
}
