//
//  Buttons.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit


struct Buttons {
    var submit: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SUBMIT", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        return button
    }()
    
    var clear: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CLEAR", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.4
        return button
    }()
    

}
