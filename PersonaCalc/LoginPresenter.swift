//
//  LoginPresenter.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit
import TextFieldFloatingPlaceholder

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
        
        let tabRoot = TabRootWireFrame.buildModule()
        tabRoot.modalPresentationStyle = .fullScreen
        controller?.show(tabRoot, sender: nil)
        
    }
    
    
}
