//
//  ViewController.swift
//  Project5Programmatically
//
//  Created by Karen Vardanian on 13.03.2023.
//

import UIKit

class ViewController: UITableViewController {
    let cl = ["hello", "world", "i'm", "coder"]
    
    override init(style: UITableView.Style) {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Project 5"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .yellow
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Word")
        //let myTableViewController = UITableViewController(style: .grouped)
    }


}

extension ViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cl.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cl[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
