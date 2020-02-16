//
//  MainTableViewController.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 16.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var heroes_V2: [CharacterDTO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Star wars demo v 1.0"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        registerCell()
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            cell.nameLabel.text = heroes_V2[indexPath.row].name
            cell.typeLabel.text = "Сharacter"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes_V2.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Found: "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showHeroCard", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showHeroCard":
            let vc = segue.destination as! DetailedInfoController
            vc.name = heroes_V2[1].name
        default:
            break
        }
    }
    
    private func getData() {
        let url = URL(string: "https://swapi.co/api/people")
        let task = URLSession.shared.dataTask(with: url!) {data, response,error in
            if error != nil {
                print("Problem")
            }
            self.heroes_V2 = self.mapArray(json: data!)
            print(self.heroes_V2)
        }
        task.resume()
    }
    
    private func mapArray(json:Data)-> [CharacterDTO]{
        var hero:[CharacterDTO] = []
        do{
            let jsonDencoder = JSONDecoder()
            let resp = try jsonDencoder.decode(ApiResponse.self, from: json)
            hero = resp.characters
        }
        catch let error as DecodingError{
            print(error)
        }
        catch{
            
        }
        return hero
        
        
    }
}
