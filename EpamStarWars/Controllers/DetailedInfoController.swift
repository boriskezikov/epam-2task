//
//  DetailedInfoController.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 17.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import UIKit

class DetailedInfoController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var characterName: UILabel!
    
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterName.text = name
    }
   
    private func registerTableViewCells (){
               let cell = UINib(nibName: "SearchCell", bundle: nil)
               self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
           }
}
