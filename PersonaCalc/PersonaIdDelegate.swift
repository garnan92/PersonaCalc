//
//  PersonaIdDelegate.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation

protocol PersonaIdDelegate : NSObjectProtocol {
    
    func LoadName(_ name : String)
    func LoadLevel(_ level : Int)
    func LoadPrice(_ price : Int)
    
}
