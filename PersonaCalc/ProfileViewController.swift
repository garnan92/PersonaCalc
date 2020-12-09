//
//  ProfileViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    
    @IBOutlet weak var profileText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileText.text = UserDefaults.standard.string(forKey: "user")
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        UserDefaults.standard.set("no user", forKey: "user")
        
        let login = LoginControlelrWireFrame.buildModule()
        login.modalPresentationStyle = .fullScreen
        present(login, animated: true, completion: nil)
    }
    
    
}
