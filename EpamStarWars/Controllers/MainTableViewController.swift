//
//  MainTableViewController.swift
//  EpamStarWars
//
//  Created by Kezikov Boris  on 16.02.2020.
//  Copyright © 2020 epam. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var jsonData: [CharacterDTO] = []
    
    var filteredHeroes: [CharacterDTO]!
    
    var selectedRow: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        loadData()
        filteredHeroes = jsonData
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Star wars demo v 1.0"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        registerCell()
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "SearchCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "SearchCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell{
            cell.nameLabel.text = filteredHeroes[indexPath.row].name
            cell.typeLabel.text = "Char"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredHeroes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Found: "
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath
        performSegue(withIdentifier: "showHeroCard", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showHeroCard":
            let vc = segue.destination as! DetailedInfoController
            vc.character = filteredHeroes[selectedRow.row]
        default:
            break
        }
    }
    
    private func loadData() {
        let url = URL(string: "https://swapi.co/api/people")
        let task = URLSession.shared.dataTask(with: url!) {data, response,error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            self.jsonData = UtilsService.mapArray(json: data!)
        }
        task.resume()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredHeroes = searchText.isEmpty ? jsonData : jsonData.filter { (item: CharacterDTO) -> Bool in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    
}


