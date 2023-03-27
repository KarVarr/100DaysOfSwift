//
//  ViewController.swift
//  Project7Programmatically
//
//  Created by Karen Vardanian on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var petitions = [Petition]()
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = .systemFont(ofSize: 22, weight: .black)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(titleLabel)
        
        titleLabel.text = "There are some news for you"
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
    
    
    
    
}




