//
//  ViewController.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let labels = Labels()
    let textField = TextField()
    let button = Buttons()
    
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
        view.addSubview(textField.currentAnswer)
        view.addSubview(button.submit)
        view.addSubview(button.clear)
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
            
            textField.currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            textField.currentAnswer.topAnchor.constraint(equalTo: labels.cluesLabel.bottomAnchor, constant: 20),
            
            button.submit.topAnchor.constraint(equalTo: textField.currentAnswer.bottomAnchor),
            button.submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            button.submit.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

}

