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
    
    var selectedImage: String?
    let myImage = ImagesViewController()
    
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
        navigationItem.largeTitleDisplayMode = .always
        title = "Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.yellow
        ]
        //Challenge 2 for UIActiveVeiwController
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Recommend", style: .plain, target: self, action: #selector(recommendApp))
        
        
        
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
    //Challenge 2 for UIActiveVeiwController
    @objc func recommendApp () {
        let appLink = "https://www.google.com"
        let image = UIImage(named: "nssl0033")
        let appText = "Check out my new app!"
        
        let vc = UIActivityViewController(activityItems: [appText, appLink, image].compactMap{$0}, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
        //Challenge 2 .sorted(by: >)
        cell.configure(with: image, and: pictures.sorted(by: <)[indexPath.row], numberOf: indexPath.row + 1)
        cell.backgroundColor = #colorLiteral(red: 0.5656551123, green: 0.8747014403, blue: 0.6658728719, alpha: 1)
        cell.accessoryType = .disclosureIndicator
        cell.contentView.backgroundColor = #colorLiteral(red: 0.5656551123, green: 0.8747014403, blue: 0.6658728719, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let newVC = ImagesViewController()
        newVC.myImage.image = UIImage(named: pictures[indexPath.row] )
        //Challenge 3
        newVC.ImageTitle = "Picture \(indexPath.row + 1) of \(pictures.count)"
        navigationController?.pushViewController(newVC, animated: true)
        
    }
    
}
