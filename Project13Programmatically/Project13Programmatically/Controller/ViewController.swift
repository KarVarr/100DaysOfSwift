//
//  ViewController.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let myView = ViewForImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(myView.uiView)
    }

    func settings() {
        title = "Hello"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .red
        
    }

    func layout() {
        NSLayoutConstraint.activate([
            myView.uiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            myView.uiView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            myView.uiView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            myView.uiView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}

