//
//  PythonWireFrame.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import UIKit

class PythonWireFrame {
    
    
    static func buildModule() -> UIViewController {
        let view = UIStoryboard(name: "TabRoot", bundle: nil).instantiateViewController(identifier: "python") as UIViewController
        return view
    }
    
}
