//
//  TabRootWireFrame.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation
import UIKit


class TabRootWireFrame {
    
    static func buildModule() -> UITabBarController {
        let view = UIStoryboard(name: "TabRoot", bundle: nil).instantiateViewController(identifier: "TabRoot") as UITabBarController
        view.selectedIndex = 1
        return view
    }
    
}
