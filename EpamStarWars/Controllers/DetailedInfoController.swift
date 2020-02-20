//
//  DetailedInfoController.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 17.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import UIKit

class DetailedInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var characterName: UILabel!
        
    var character:CharacterDTO!
    
    private var characterParamsLabels: [String] = []
    private var characterParamsValues: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        characterName.text = character.getParametersMap()["name"]
        registerCells()
        characterParamsLabels = character.getParametersMap().getKeysArray() as! [String]
        characterParamsValues = character.getParametersMap().getValuesArray() as! [String]
        
    }
    
    private func registerCells(){
        let cell  = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            cell.nameLabel.text = characterParamsValues[indexPath.row]
            cell.typeLabel.text = characterParamsLabels[indexPath.row]
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterParamsLabels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hero: "
    }
}

extension Dictionary{
    func getValuesArray()->Array<Any>{
        return Array(self.values)
    }
    
    func getKeysArray()->Array<Any>{
        return Array(self.keys)
    }
}


