//
//  ViewController.swift
//  Project7
//
//  Created by Karen Vardanian on 20.12.2022.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(credits))
        
        performSelector(inBackground: #selector(fetchJSON), with: nil)
    }
    
    @objc func fetchJSON () {
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString =
            "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString =
            "https://api.whitehouse.gov/v1/petitions.json?signatureConuntFloor=10000&limit=199"
        }
        
        
        if let url = URL(string:  urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            } else {
                showError()
            }
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
        
    }
    
    @objc func credits () {
        let ac = UIAlertController(title: "Credits", message: "Petitions fee", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    
    
    
   @objc func showError() {
            let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        
    }
    
    func parse(json: Data)
    {
        let decoder = JSONDecoder()
        
        if let jsonPetitios = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitios.results
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

