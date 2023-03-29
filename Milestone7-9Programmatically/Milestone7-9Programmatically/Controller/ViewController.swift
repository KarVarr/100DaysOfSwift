//
//  ViewController.swift
//  Milestone7-9Programmatically
//
//  Created by Karen Vardanian on 29.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var allWords = [String]()
    
    var letterButtons = [UIButton]()
    let letter = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    
    let wordLabel = WordLabel()
    var keyboardView = KeyboardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        words()
        layoutViews()
    }
    
    func words() {
        if let startWordURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let startWord = try? String(contentsOf: startWordURL) {
                allWords = startWord.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["HELLO"]
        }
    }
    
    @objc func letterTapped (_ sender: UIButton) {
        print("\(sender)")
        if let letterTitle = sender.title(for: .normal) {
            wordLabel.label.text = letterTitle
        }
        
    }


}

//MARK: - Settings

extension ViewController {
    func addViews() {
        view.addSubview(keyboardView.keyboardView)
        view.addSubview(wordLabel.label)
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        title = "Hangman Game ⚗︎"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        let width = 50
        let height = 80
        
        for row in 0..<4 {
            for col in 0..<7 {
                let letterButton = UIButton(type: .system)
                let index = row * 7 + col
                if index < letter.count {
                    let letterTitle = letter[index]
                    letterButton.setTitle(letterTitle, for: .normal)
                } else {
                    letterButton.setTitle("", for: .normal)
                }
                letterButton.titleLabel?.font = UIFont(name: "BradleyHandITCTT-Bold", size: 28)
                letterButton.frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                keyboardView.keyboardView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            keyboardView.keyboardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            keyboardView.keyboardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardView.keyboardView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            keyboardView.keyboardView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            keyboardView.keyboardView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5),
            
            
            wordLabel.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            wordLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
