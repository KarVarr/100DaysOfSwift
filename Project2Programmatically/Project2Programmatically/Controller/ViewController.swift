//
//  ViewController.swift
//  Project2Programmatically
//
//  Created by Karen Vardanian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var countries: [String]!
    var score = 0
    var correctAnswer = 0
    
    var buttonFlag1 = UIButton()
    var buttonFlag2 = UIButton()
    var buttonFlag3 = UIButton()
   
   
    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswer = Int.random(in: 0...2)
        countries = allCountries.shuffled()
        
        addView()
        allSettings()
        layout()
        askQuestion()
    }
    
    //MARK: - Functions
    func askQuestion () {
        settings(to: buttonFlag1, with: 0)
        buttonFlag1.setBackgroundImage(UIImage(named: countries[0]), for: .normal)
        settings(to: buttonFlag2, with: 1)
        buttonFlag2.setBackgroundImage(UIImage(named: countries[1]), for: .normal)
        settings(to: buttonFlag3, with: 2)
        buttonFlag3.setBackgroundImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func addView() {
        view.addSubview(buttonFlag1)
        view.addSubview(buttonFlag2)
        view.addSubview(buttonFlag3)
        
        view.addSubview(titleLabel)
    }
    
    func settings(to button: UIButton, with tag: Int) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 8
        button.layer.cornerRadius = 10
        button.tag = tag
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    
    }
    
    func allSettings() {
        view.backgroundColor = .yellow
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Guess the flag"
    
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Choose the flag of \(countries[correctAnswer]) !"
        titleLabel.textColor = .systemTeal
        titleLabel.font = UIFont.systemFont(ofSize: 22)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            buttonFlag1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonFlag1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
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
    @objc func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "And this is the correct answer."
            score += 1
        } else {
            title = "Wrong"
            message = "This is the wrong answer"
            score -= 1
        }
        print(sender.tag, correctAnswer)
        print(countries!)
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
       
      
    }

    

}

