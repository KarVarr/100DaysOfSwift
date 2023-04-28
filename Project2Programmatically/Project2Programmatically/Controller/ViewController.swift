//
//  ViewController.swift
//  Project2Programmatically
//
//  Created by Karen Vardanian on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var allCountries = Countries()
    
    var countries: [String]!
    var score = 0
    var correctAnswer = 0
    var count = 0
    
    var buttonFlag1 = UIButton()
    var buttonFlag2 = UIButton()
    var buttonFlag3 = UIButton()
    
    
    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Guess the flag, score: \(score)"
        addView()
        askQuestion()
        allSettings()
        layout()
    }
    
    //MARK: - Functions
    func askQuestion (action: UIAlertAction! = nil) {
        countries = allCountries.countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
        
        settings(to: buttonFlag1, with: 0)
        buttonFlag1.setBackgroundImage(UIImage(named: countries[0]), for: .normal)
        settings(to: buttonFlag2, with: 1)
        buttonFlag2.setBackgroundImage(UIImage(named: countries[1]), for: .normal)
        settings(to: buttonFlag3, with: 2)
        buttonFlag3.setBackgroundImage(UIImage(named: countries[2]), for: .normal)
        //Challenge 2
        if count == 10 {
            showResult()
        }
        
        
        
        
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
        
        
        //Challenge 3 Project 15
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
            button.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
    }
    
    func allSettings() {
        view.backgroundColor = .yellow
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //Challenge 3 for UIActivityViewController
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //Challenge 1
        titleLabel.text = "Choose the flag of \(countries[correctAnswer])!"
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
    
    //Challenge 3 for UIActivityViewController
    @objc func showScore () {
        let vc = UIActivityViewController(activityItems: ["Your score is: \(score)"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    func showResult () {
        let showingResult = UIAlertController(title: "Finish", message: "Your final score is \(score)", preferredStyle: .alert)
        showingResult.addAction(UIAlertAction(title: "OK", style: .default))
        present(showingResult, animated: true)
        
    }
    @objc func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        //Challenge 3 Project 15
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "And this is the correct answer. \(score)"
            score += 1
            count += 1
        } else {
            title = "Wrong"
            //Challenge 3
            message = "Wrong! That’s the flag of \(countries[sender.tag])"
            score -= 1
            count += 1
        }
        
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        
        
    }
    
    
    
}

