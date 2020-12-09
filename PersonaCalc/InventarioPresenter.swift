//
//  InventarioPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import PersonaId
import CoreData
import Alamofire

class InventarioPresenter {
    
    
    weak var inventarioDelegate : InventarioDelegate?
    
    func setDelegate(_ delegate: InventarioDelegate){
        self.inventarioDelegate = delegate
    }
    
    func registerCell(_ exTable : UITableView) {
        let NibCell  = UINib(nibName: "PersonaTableViewCell", bundle: nil)
        exTable.register(NibCell, forCellReuseIdentifier: PersonaTableViewCell.CellID)
    }
    
    func LoadRestInventario(){
        
        var personaData: [NSManagedObject] = []
        
        let user = UserDefaults.standard.string(forKey: "user")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest = Persona.fetchRequest()
        
        do {
            let result = try context.fetch(request)
            personaData = result as [NSManagedObject]
        } catch let error as NSError {
            print("Error, no ha sido posible cargar user: \(error.userInfo)")
        }
        
        var num = 0
        
        for per in personaData {
            
            if per.value(forKey: "username") as? String == user {
                
                let id_persona = per.value(forKey: "id_persona") as! Int
                
                LoadInventario(id_persona)
                
                num+=1
                
            }
            
        }
        
        if num == 0 {
            print("no hay datos de personas en inventario")
        }
        
    }
    
    func LoadInventario(_ id:Int){
        
        guard let uri : URL = URL(string: "http://localhost:8000/persona/\(id)") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
            
                let valePersona = try! PersonaId(data)
                
                self.inventarioDelegate?.LoadData(valePersona)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
        
    }
    
}
