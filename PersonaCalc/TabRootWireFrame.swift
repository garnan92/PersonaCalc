//
//  TabRootWireFrame.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit


class TabRootWireFrame {
    
    static func buildModule() -> UIViewController {
        let view = UIStoryboard(name: "TabRoot", bundle: nil).instantiateViewController(identifier: "TabRoot") as UITabBarController
        return view
    }
    
}
