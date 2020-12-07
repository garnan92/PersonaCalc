//
//  PersonaIdPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaId
import Alamofire

class PersonaIdPresenter {
    
    weak var personaIdDelegate : PersonaIdDelegate?
    
    func setDelegate(_ delegate : PersonaIdDelegate){
        self.personaIdDelegate = delegate
    }
    
    func LoadRestData(_ id : Int){
        
        guard let uri : URL = URL(string: "http://localhost:8000/persona/\(id)") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
            
                let valePersonaId = try! PersonaId(data)
                
                self.personaIdDelegate?.LoadName(valePersonaId.name!)
                self.personaIdDelegate?.LoadRace(valePersonaId.race!)
                self.personaIdDelegate?.LoadLevel(valePersonaId.level!)
                self.personaIdDelegate?.LoadPrice(valePersonaId.price!)
                self.personaIdDelegate?.LoadInherit(valePersonaId.inherit!)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
        
    }
    
    func LoadResistanceData(_ id:Int){
        
        guard let uri : URL = URL(string: "http://localhost:8000/persona/\(id)/resistance") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
            
                let valePersonaId = 5
                
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
        
    }
    
}
