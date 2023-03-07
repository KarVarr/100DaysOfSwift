//
//  ViewController.swift
//  Project2Programmatically
//
//  Created by Karen Vardanian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonFlag1 = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Guess the flag"
        addView()
        settings()
        layout()
        
    }
    
    func addView() {
        view.addSubview(buttonFlag1)
    }
    
    func settings() {
        buttonFlag1.translatesAutoresizingMaskIntoConstraints = false
        buttonFlag1.setTitle("button 1 ", for: .normal)
        buttonFlag1.backgroundColor = .systemMint
        buttonFlag1.layer.cornerRadius = 10
        buttonFlag1.setImage(UIImage(named: "US"), for: .normal)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            buttonFlag1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFlag1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            buttonFlag1.widthAnchor.constraint(equalToConstant: 200),
            buttonFlag1.heightAnchor.constraint(equalToConstant: 100),
        ])
    }


}

