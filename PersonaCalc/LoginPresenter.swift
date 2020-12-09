//
//  LoginPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import TextFieldFloatingPlaceholder
import CoreData

class LoginPresenter {
    
    private var controller : UIViewController?
    
    func setController(_ controller : UIViewController) {
        self.controller = controller
    }
    
    func setTextfieldProperties(_ textField : TextFieldFloatingPlaceholder) {
        
        textField.floatingPlaceholderColor = .white

        textField.validationTrueLineEditingColor = .white
        textField.validationFalseLineEditingColor = .white
        
        textField.validationFalseLineColor = .white
        textField.validationTrueLineColor = .white
        
        textField.textColor = .white
        
    }
    
    
    func LogIn(_ user : TextFieldFloatingPlaceholder, _ pass: TextFieldFloatingPlaceholder) {
        
        var usrData: [NSManagedObject] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest = Users.fetchRequest()
        
        guard let usertext = user.text else {
            return
        }
        
        guard let passtext = pass.text else {
            return
        }
        
        do {
            let result = try context.fetch(request)
            usrData = result as [NSManagedObject]
        } catch let error as NSError {
            print("Error, no ha sido posible cargar user: \(error.userInfo)")
        }
        
        if !usrData.isEmpty {
            for u in usrData {
                print("datos \(u.value(forKey: "username") as? String ?? "")")
                if usertext ==  u.value(forKey: "username") as? String ?? "" && passtext == u.value(forKey: "password") as? String ?? ""{
                    entrarApp(usertext)
                }
            }
        }
        else {
            print("no hay datos")
        }
        
        /*let tabRoot = TabRootWireFrame.buildModule()
        tabRoot.modalPresentationStyle = .fullScreen
        controller?.show(tabRoot, sender: nil)*/
        
    }
    
    func entrarApp(_ user : String){
        
        UserDefaults.standard.set(user, forKey: "user")
        
        let tabRoot = TabRootWireFrame.buildModule()
        tabRoot.modalPresentationStyle = .fullScreen
        controller?.show(tabRoot, sender: nil)
        
    }
    
    func SingIn() {
        
        let registerView : RegistroViewController = RegistroViewController(nibName: "RegistroViewController", bundle: nil)
        controller?.show(registerView, sender: nil)
        
    }
    
    
}
