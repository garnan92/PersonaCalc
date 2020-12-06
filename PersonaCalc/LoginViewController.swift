//
//  LoginViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import TextFieldFloatingPlaceholder

class LoginViewController : UIViewController {
    
    @IBOutlet weak var userTextField: TextFieldFloatingPlaceholder!
    @IBOutlet weak var passwordTextField: TextFieldFloatingPlaceholder!
    
    private let loginPresenter: LoginPresenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter.setTextfieldProperties(userTextField)
        loginPresenter.setTextfieldProperties(passwordTextField)
        loginPresenter.setController(self)
    }
    
    @IBAction func entrarDidLogin(_ sender: Any) {
        loginPresenter.LogIn(userTextField, passwordTextField)
    }
    
    @IBAction func registrarseDidPressed(_ sender: Any) {
        print("se quiere registrar")
    }
    
    
}
