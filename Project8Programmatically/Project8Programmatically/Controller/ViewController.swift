//
//  ViewController.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let labels = Labels()
    
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
//    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    
    override func loadView() {
        addView()
        settingsView()
        layoutView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }

    func addView() {
        view = UIView()
        view.addSubview(labels.scoreLabel)
        view.addSubview(labels.cluesLabel)
        view.addSubview(labels.answersLabel)
    }
    
    func settingsView() {
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            labels.scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            labels.scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            labels.cluesLabel.topAnchor.constraint(equalTo: labels.scoreLabel.bottomAnchor),
            labels.cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 100),
            labels.cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            
            labels.answersLabel.topAnchor.constraint(equalTo: labels.scoreLabel.bottomAnchor),
            labels.answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            labels.answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            labels.answersLabel.heightAnchor.constraint(equalTo: labels.cluesLabel.heightAnchor),
        ])
    }

}

