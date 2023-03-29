//
//  ViewController.swift
//  Milestone7-9Programmatically
//
//  Created by Karen Vardanian on 29.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var allWords = [String]()

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
        print(allWords)
        if allWords.isEmpty {
            allWords = ["HELLO"]
        }
    }
    
    


}

extension ViewController {
    func addViews() {
        
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        title = "Hangman Game ⚗︎"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func layoutViews() {
        
    }
}
