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
        settings()
        
    }
    //background and text color for navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func navigation() {
        title = "Shopping list"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareList))
        navigationItem.rightBarButtonItems = [addButton, shareButton]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(newItems))
        
        //Spacing between navigationBar and tableview cell
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
       
    }
    
    
    func settings() {
        tableView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
    
    
    
    
    //MARK: - Functions
    
    @objc func shareList () {
        let list = list.newItemArray.joined(separator: "\n")
        
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @objc func newItems () {
        list.newItemArray.removeAll()
        tableView.reloadData()
    }
    
    @objc func addNewItem () {
        let ac = UIAlertController(title: "New item", message: "Add a new item to the list", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Add +", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text?.uppercased() else {return}
            self?.submit(item)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
        guard item != "" else {return}
        list.newItemArray.append(item)
        
        let indexPath = IndexPath(row: list.newItemArray.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.newItemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            fatalError("The TableView not dequeue a CustomCell")
        }
        
        
        cell.configure(numberOf: list.newItemArray.count, row: list.newItemArray[indexPath.row])
        
        cell.contentView.backgroundColor = #colorLiteral(red: 0.5656551123, green: 0.8747014403, blue: 0.6658728719, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}
