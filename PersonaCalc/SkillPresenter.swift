//
//  SkillPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import Alamofire
import PersonaSkill

class SkillPresenter {
    
    weak var skillDelegate : SkillDelegate?
    
    func setDelegate(_ delegate : SkillDelegate)
    {
        self.skillDelegate = delegate
    }
    
    func loadSkillRest(_ id : Int){
        guard let uri : URL = URL(string: "http://localhost:8000/persona/\(id)/skills") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
            
                let personaSkills = try! PersonaSkills(data)
                
                self.skillDelegate?.LoadSkillData(personaSkills)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
    }
    
}
