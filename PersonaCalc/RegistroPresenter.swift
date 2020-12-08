//
//  RegistroPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 07/12/20.
//

import Foundation
import UIKit
import TextFieldFloatingPlaceholder

class RegistroPresenter {
    
    var users = Users()
    
    weak var registroDelegate : RegistroDelegate?
    
    func setRegistroDelegate(_ delegate : RegistroDelegate) {
        self.registroDelegate = delegate
    }
    
    func setSettings(_ textField : TextFieldFloatingPlaceholder) {
        
        textField.floatingPlaceholderColor = .white

        textField.validationTrueLineEditingColor = .white
        textField.validationFalseLineEditingColor = .white
        
        textField.validationFalseLineColor = .white
        textField.validationTrueLineColor = .white
        
        textField.textColor = .white
    }
    
    func AddUser(_ user : String, _ pass : String) {
        
        /*let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let users = Users(context: context)
        
        users.username = user
        users.password = pass
        
        do {
            try context.save()
            //sendSuccesAlert(with: name)
            print("se guado usuario")
        } catch let error as NSError {
            print("No se puede guardar el usuario. Eror:\(error.userInfo)")
        }*/
        
    }
    
}
