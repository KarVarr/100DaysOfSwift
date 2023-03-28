//
//  TableViewController.swift
//  Project7Programmatically
//
//  Created by Karen Vardanian on 25.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var petitions = [Petition]()
    //Challenge 3
    var filteredPetitions = [Petition]()
    
    var filterWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        //Challenge 1
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "API", style: .plain, target: self, action: #selector(showingAPI))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterArray))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        
    }
    
    @objc func fetchJSON() {
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        performSelector(onMainThread: #selector(showingError), with: nil, waitUntilDone: false)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showingError), with: nil, waitUntilDone: false)
        }
    }
    
    @objc func showingError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
    }
    
    
    
    
    
    //Challenge 1
    @objc func showingAPI () {
        let ac = UIAlertController(title: "API", message: "Data comes from the 'We The People API of the Whitehouse'", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    //Challenge 3
    @objc func filterArray() {
        let ac = UIAlertController(title: "Filter title", message: "Find what you wont!", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addAction(UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
            self?.filterWord = ac?.textFields?[0].text ?? ""
            self?.filterData()
            self?.tableView.reloadData()
            
        })
        present(ac, animated: true)
    }
    //Challenge 3
    func filterData() {
        if filterWord.isEmpty {
            filteredPetitions = petitions
            navigationItem.leftBarButtonItem?.title = "Filter 1"
            return
        }
        
        navigationItem.leftBarButtonItem?.title = "Found \(filterWord)"
        
        filteredPetitions = petitions.filter() { petition in
            if let _ = petition.title.range(of: filterWord, options:  .caseInsensitive) {
                return true
            }
            if let _ = petition.body.range(of: filterWord, options: .caseInsensitive) {
                return true
            }
            
            return true
        }
    }
    
    
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let petition = petitions[indexPath.row]
        
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
