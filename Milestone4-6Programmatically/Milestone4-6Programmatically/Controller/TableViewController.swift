//
//  TableViewController.swift
//  Milestone4-6Programmatically
//
//  Created by Karen Vardanian on 16.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    let list = ListOfItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigation()
        addView()
        settings()
        layout()
        
    }
    
    func navigation() {
        title = "Shopping list"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
    }
    
    func addView() {
        
    }
    
    func settings() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
    }
    
    func layout() {
        
    }
    
    
    //MARK: - Functions
    
    @objc func addNewItem () {
        let ac = UIAlertController(title: "New item", message: "Add a new item to the list", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Add +", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else {return}
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        list.newItemArray.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.newItemArray.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = list.newItemArray[indexPath.row]
  

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }



}
