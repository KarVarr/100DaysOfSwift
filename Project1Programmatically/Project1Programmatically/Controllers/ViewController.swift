//
//  ViewController.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings()
        addViews()
        layout()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    
    
    func settings () {
        title = "Pictures"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.5656551123, green: 0.8747014403, blue: 0.6658728719, alpha: 1)
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addViews() {
        
        
        view.addSubview(tableView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell  else {
            fatalError("The TableView not dequeue a CustomCell in ViewController")
        }
        
        let images = pictures[indexPath.row]
        guard let image = UIImage(named: images) else {
            fatalError("Unable to load image named \(images)")
        }
        
        cell.configure(with: image, and: pictures[indexPath.row])
        
        cell.contentView.backgroundColor = #colorLiteral(red: 0.5656551123, green: 0.8747014403, blue: 0.6658728719, alpha: 1)
        return cell
    }
    
    
}
