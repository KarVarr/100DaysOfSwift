//
//  TableViewController.swift
//  Project4Programmatically
//
//  Created by Karen Vardanian on 13.03.2023.
//



import UIKit

//Challenge 3
class TableViewController: UITableViewController {

    let websites = WebsiteModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    
    }
    
    func setting() {
        tableView.register( UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        title = "WebSites TableView"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        websites.websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = websites.websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let newVC = ViewController()
        newVC.site = websites.websites[indexPath.row]
        navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    
  

}
