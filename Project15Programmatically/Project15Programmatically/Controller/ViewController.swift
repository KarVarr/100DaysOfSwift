//
//  ViewController.swift
//  Project15Programmatically
//
//  Created by Karen Vardanian on 28.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let imagePenguin = Image()
    let buttonTap = Button()
    
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setting()
        layout()
    }

    func addView() {
        view.addSubview(imagePenguin.myImage)
        view.addSubview(buttonTap.myButton)
    }
    
    func setting() {
        view.backgroundColor = .white
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imagePenguin.myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imagePenguin.myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
            buttonTap.myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTap.myButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            buttonTap.myButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            buttonTap.myButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
        ])
    }
    
    @objc func buttonTapped() {
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

