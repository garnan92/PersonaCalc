//
//  LoginControllerWireFrame.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit

class LoginControlelrWireFrame {
    
    static func buildModule() -> UIViewController {
        
        let view = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(identifier: "Login") as UIViewController
        return view
    }
    
}
