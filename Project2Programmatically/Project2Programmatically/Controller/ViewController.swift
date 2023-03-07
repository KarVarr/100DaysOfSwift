//
//  ViewController.swift
//  Project2Programmatically
//
//  Created by Karen Vardanian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    
    var buttonFlag1 = UIButton(type: .system)
    var buttonFlag2 = UIButton(type: .system)
    var buttonFlag3 = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Guess the flag"
        
        
        addView()
        settings(to: buttonFlag1, and: "UK")
        settings(to: buttonFlag2, and: "Germany")
        settings(to: buttonFlag3, and: "US")
        layout()
    }
    
    //MARK: - Functions
    func addView() {
        view.addSubview(buttonFlag1)
        view.addSubview(buttonFlag2)
        view.addSubview(buttonFlag3)
    }
    
    func settings(to button: UIButton, and name: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: name), for: .normal)
        button.layer.cornerRadius = 10
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            buttonFlag1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFlag1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            buttonFlag1.widthAnchor.constraint(equalToConstant: 200),
            buttonFlag1.heightAnchor.constraint(equalToConstant: 100),
            
            buttonFlag2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFlag2.topAnchor.constraint(equalTo: buttonFlag1.bottomAnchor, constant: 20),
            buttonFlag2.widthAnchor.constraint(equalToConstant: 200),
            buttonFlag2.heightAnchor.constraint(equalToConstant: 100),
            
            buttonFlag3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFlag3.topAnchor.constraint(equalTo: buttonFlag2.bottomAnchor, constant: 20),
            buttonFlag3.widthAnchor.constraint(equalToConstant: 200),
            buttonFlag3.heightAnchor.constraint(equalToConstant: 100),
        ])
    }


}

