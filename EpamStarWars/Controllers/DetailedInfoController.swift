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
    
    var name:String!
    
    var character:CharacterDTO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterName.text = name
        registerCell()
    }
    
    private func registerTableViewCells (){
        let cell = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            cell.nameLabel.text = character.name
            cell.typeLabel.text = "Name"
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Found: "
    }
    
    private func modelToMap(model:CharacterDTO){
    }
}
