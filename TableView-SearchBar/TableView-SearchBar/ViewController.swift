//
//  ViewController.swift
//  TableView-SearchBar
//
//  Created by Gamze Akyüz on 12.01.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    
    var country: [String] = [String]()
    var resultCountry:[String] = [String]()
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        search.delegate = self
        
        country = ["Turkey","Abd","Japan","Korea","Thailand","France","İtaly","Germany","England"]
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if searching {
            cell.textLabel?.text = resultCountry[indexPath.row]
        }else {
            cell.textLabel?.text = country[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return resultCountry.count
        }else {
            return country.count
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searching {
            print("Country : \(resultCountry[indexPath.row])")
        }else {
            print("Country: \(country[indexPath.row])")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search Result : \(searchText)")
        
        if searchText == "" {
            searching = false
        }else {
            searching = true
            
            resultCountry = country.filter({$0.lowercased().contains(searchText.lowercased())})

        }
        tableView.reloadData()
    }

}

