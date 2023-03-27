//
//  ViewController.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let score = Labels()
    
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
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
        view.addSubview(score.scoreLabel)
    }
    
    func settingsView() {
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            score.scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            score.scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }

}

