//
//  SkillViewController.swift
//  PersonaCalc
//
//  Created by Ricardo Pacheco on 08/12/20.
//

import Foundation
import UIKit
import PersonaSkill

class SkillViewController : UIViewController {
    
    var id : Int?
    var skills : PersonaSkills = []
    
    var skillPresenter = SkillPresenter()
    
    @IBOutlet weak var exTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skillPresenter.setDelegate(self)
        exTable.delegate = self
        exTable.dataSource = self
        
        let NibCell  = UINib(nibName: "SkillCellView", bundle: nil)
        exTable.register(NibCell, forCellReuseIdentifier: SkillCellView.CellID)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        skillPresenter.loadSkillRest(id!)
    }
    
}

extension SkillViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SkillCellView = exTable.dequeueReusableCell(withIdentifier: SkillCellView.CellID, for: indexPath) as! SkillCellView
        
        cell.skillLabel.text = "Skill: \(skills[indexPath.row].skill?.name ?? "")"
        cell.costLabel.text = "Cost: \(skills[indexPath.row].skill?.cost ?? "")"
        cell.effectLabel.text = "Effect: \(skills[indexPath.row].skill?.efect ?? "")"
        cell.levelLabel.text = "Level: \(skills[indexPath.row].skill?.level ?? "")"
        
        return cell
    }
    
}

extension SkillViewController : SkillDelegate {
    
    func LoadSkillData(_ skills: PersonaSkills) {
        self.skills = skills
        exTable.reloadData()
    }
    
}
