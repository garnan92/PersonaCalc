//
//  RegistroViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 07/12/20.
//

import Foundation
import UIKit
import TextFieldFloatingPlaceholder

class RegistroViewController : UIViewController {
    
    var registroPresenter : RegistroPresenter = RegistroPresenter()
    
    @IBOutlet weak var userTextField: TextFieldFloatingPlaceholder!
    
    @IBOutlet weak var passTextField: TextFieldFloatingPlaceholder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registroPresenter.setSettings(userTextField)
        registroPresenter.setSettings(passTextField)
    }
    
    @IBAction func ResgistrarPressed(_ sender: Any) {
        
        guard let user = userTextField.text else {
            print("falto usuario")
            return
        }
        
        guard let pass = passTextField.text else {
            print("falto contraseña")
            return
        }
        
        registroPresenter.AddUser(user,pass)
    }
    
    
}
