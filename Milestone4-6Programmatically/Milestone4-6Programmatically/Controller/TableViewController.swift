//
//  TableViewController.swift
//  Milestone4-6Programmatically
//
//  Created by Karen Vardanian on 16.03.2023.
//

import UIKit

class TableViewController: UITableViewController {
    let arr = ["1","2","3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()

        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addView() {
        
    }
    
    func settings() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    func layout() {
        
    }
    
    
    
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

  

        return cell
    }



}
