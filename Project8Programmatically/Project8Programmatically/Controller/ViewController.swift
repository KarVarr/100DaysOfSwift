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
    let btnView = ButtonsView()
    
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
        view.addSubview(btnView.buttonsView)
    }
    
    func settingsView() {
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        btnView.buttonsView.backgroundColor = .orange
        btnView.buttonsView.layer.cornerRadius = 10
        btnView.buttonsView.layer.shadowOpacity = 0.5
        btnView.buttonsView.layer.shadowColor = UIColor.black.cgColor
        btnView.buttonsView.layer.shadowRadius = 3
        btnView.buttonsView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                
                btnView.buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }

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
            
            button.clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            button.clear.centerYAnchor.constraint(equalTo: button.submit.centerYAnchor),
            button.clear.heightAnchor.constraint(equalToConstant: 44),
            
            btnView.buttonsView.widthAnchor.constraint(equalToConstant: 750),
            btnView.buttonsView.heightAnchor.constraint(equalToConstant: 320),
            btnView.buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnView.buttonsView.topAnchor.constraint(equalTo: button.submit.bottomAnchor, constant: 20),
            btnView.buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
       
    }
    
   

}

