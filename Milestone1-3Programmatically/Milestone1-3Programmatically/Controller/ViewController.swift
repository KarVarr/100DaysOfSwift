//
//  ViewController.swift
//  Milestone1-3Programmatically
//
//  Created by Karen Vardanian on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let countriesFlag = Countries()
    let tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        addView()
        settings()
        layout()
        
    }
    
    
    func addView () {
        countriesFlag.country += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
            
        view.addSubview(tableView)
    }
    func settings() {
        title = "Countries Flag"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        tableView.sectionIndexBackgroundColor = .yellow
        
    }
    func layout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesFlag.country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { fatalError("The TableView not dequeue a TableViewCell aka CustomCell in ViewController")}
        
        let images = countriesFlag.country[indexPath.row]
        guard let image = UIImage(named: images) else {
            fatalError("Unable to load image named \(images)")
        }
        
        cell.settings(with: image, and: countriesFlag.country[indexPath.row])
        cell.backgroundColor = .yellow
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let newVC = DetailController()
        newVC.imageForFlag.flagImage = UIImageView(image: UIImage(named: countriesFlag.country[indexPath.row]))
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    
}

