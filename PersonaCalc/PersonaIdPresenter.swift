//
//  PersonaIdPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import PersonaId
import PersonaResistance
import PersonaFusion
import Alamofire
import CoreData

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
                
                let personaResistance = try! PersonaResistance(data)
                
                self.personaIdDelegate?.LoadResistance(personaResistance)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
        
    }
    
    func LoadFusionData(_ id: Int) {
        guard let uri : URL = URL(string: "http://localhost:8000/persona/\(id)/fusiones") else {
            return
        }
        
        AF.request(uri,method: .get,encoding: JSONEncoding.default).responseJSON { response in
                        
            switch response.result {
            case .success(_):
                
                guard let data = String(data: response.data!,encoding: .utf8) else {
                    return
                }
                
                let personaFusion = try! PersonaFusion(data)
                
                self.personaIdDelegate?.LoadFusiones(personaFusion)
                
            case .failure(_):
                print("error al procesar datos")
            }
            
        }
    }
    
    func registerCell(_ exTable : UITableView){
        let NibCell  = UINib(nibName: "FusionViewCell", bundle: nil)
        exTable.register(NibCell, forCellReuseIdentifier: FusionViewCell.CellID)
    }
    
    func Status(_ id : Int) -> Bool {
        
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
        
        
        for per in personaData {
            
            if per.value(forKey: "username") as? String == user && per.value(forKey: "id_persona") as! Int == id {
                
                return false
                
            }
            
        }

        return true
        
    }
    
    func AgregarPersona(_ id : Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let perso = Persona(context: context)
        
        perso.id_persona = Int64(id)
        perso.username = UserDefaults.standard.string(forKey: "user")
        
        do {
            try context.save()
            //sendSuccesAlert(with: name)
            print("se guardo persona")
        } catch let error as NSError {
            print("No se puede guardar el usuario. Eror:\(error.userInfo)")
        }
    }
    
    func QuiterPersona(_ id : Int){
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
        
        for per in personaData {
            
            if per.value(forKey: "username") as? String == user && per.value(forKey: "id_persona") as! Int == id {
                
                context.delete(per)
                
            }
            
        }

        
        do {
            try context.save()
            //sendSuccesAlert(with: name)
            print("se quito persona")
        } catch let error as NSError {
            print("No se puede guardar el usuario. Eror:\(error.userInfo)")
        }
        
        
    }
    
}
