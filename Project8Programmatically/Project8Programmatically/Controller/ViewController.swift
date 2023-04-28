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
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0 {
        didSet {
            labels.scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    
    override func loadView() {
        addView()
        settingsView()
        layoutView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
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
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for col in 0..<5 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.frame = CGRect(x: col * width, y: row * height, width: width, height: height)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                btnView.buttonsView.addSubview(letterButton)
                letterButtons.append(letterButton)
            }
        }
        
        button.submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        button.clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        
        
    }
    
    func layoutView() {
        NSLayoutConstraint.activate([
            labels.scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40),
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
            
            button.submit.topAnchor.constraint(equalTo: textField.currentAnswer.bottomAnchor, constant: 20),
            button.submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            button.submit.heightAnchor.constraint(equalToConstant: 44),
            //Challenge 1
            button.submit.widthAnchor.constraint(equalToConstant: 80),
            
            button.clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            button.clear.centerYAnchor.constraint(equalTo: button.submit.centerYAnchor),
            button.clear.heightAnchor.constraint(equalToConstant: 44),
            //Challenge 1
            button.clear.widthAnchor.constraint(equalToConstant: 80),
            
            btnView.buttonsView.widthAnchor.constraint(equalToConstant: 750),
            btnView.buttonsView.heightAnchor.constraint(equalToConstant: 320),
            btnView.buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnView.buttonsView.topAnchor.constraint(equalTo: button.submit.bottomAnchor, constant: 20),
            btnView.buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        textField.currentAnswer.text = textField.currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        //Challenge project 15
        UIView.animate(withDuration: 1, delay: 0) {
            sender.alpha = 0
        }
//        sender.isHidden = true
    }
    
    @objc func submitTapped(_ sender: UIButton) {
        guard let answerText = textField.currentAnswer.text else { return }
        
        if let solutionPosition = solutions.firstIndex(of: answerText) {
            activatedButtons.removeAll()
            var splitAnswers = labels.answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            labels.answersLabel.text = splitAnswers?.joined(separator: "\n")
            
            textField.currentAnswer.text = ""
            score += 1
            //Challenge 3
            if noButtons() {
                let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        } else {
            //Challenge 2
            textField.currentAnswer.text = ""
            for btn in activatedButtons {
//                btn.isHidden = false
                btn.alpha = 1
            }
            let ac = UIAlertController(title: "Wrong!", message: "Your enters an incorrect", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
            //Challenge 3
            score -= 1
        }
    }
    //Challenge 3
    func noButtons() -> Bool {
        for button in letterButtons {
            if button.isHidden == false {
                return false
            }
        }
        return true
    }
    
    @objc func clearTapped(_ sender: UIButton) {
        textField.currentAnswer.text = ""
        
        for btn in activatedButtons {
//            btn.isHidden = false
            btn.alpha = 1
        }
        
        activatedButtons.removeAll()
        score = 0
    }
    
    
    //Challenge project 9 GCD
    func loadLevel() {
        DispatchQueue.global(qos: .userInitiated).async {
            
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
            if let levelFileURL = Bundle.main.url(forResource: "level\(self.level)", withExtension: "txt") {
            if let levelContents = try? String(contentsOf: levelFileURL) {
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    self.solutions.append(solutionWord)
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        
            DispatchQueue.main.async {
                
                self.labels.cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
                self.labels.answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterBits.shuffle()
        
                if letterBits.count == self.letterButtons.count {
            for i in 0..<self.letterButtons.count {
                self.letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    }
    }
    
    func levelUp(action: UIAlertAction) {
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons {
//            btn.isHidden = false
            btn.alpha = 1
        }
    }
    
    
    
}

