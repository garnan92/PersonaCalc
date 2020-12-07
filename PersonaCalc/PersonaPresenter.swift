//
//  PersonaPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaList
import Alamofire

class PersonaPresenter {
    
    weak var personaDelegate : PersonaDelegate?
    var controller : UIViewController?
    
    func setDelegate(_ delegate : PersonaDelegate) {
        self.personaDelegate = delegate
    }
    
    func setController(_ controller : UIViewController) {
        self.controller = controller
    }
    
    func registerCell(_ exTable : UITableView) {
        let NibCell  = UINib(nibName: "PersonaTableViewCell", bundle: nil)
        exTable.register(NibCell, forCellReuseIdentifier: PersonaTableViewCell.CellID)
    }
    
    func RestData() {
        
        guard let uri : URL = URL(string: "http://localhost:8000/persona/") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
            
                let valePersonaList = try! PersonaList(data)
                
                self.personaDelegate?.LoadData(valePersonaList)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
        
    }
    
}
