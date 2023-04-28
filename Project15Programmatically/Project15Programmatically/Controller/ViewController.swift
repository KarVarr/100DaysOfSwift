//
//  ViewController.swift
//  Project15Programmatically
//
//  Created by Karen Vardanian on 28.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let imagePenguin = Image()
    let buttonTap = Button()
    
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setting()
        layout()
    }

    func addView() {
        view.addSubview(imagePenguin.myImage)
        view.addSubview(buttonTap.myButton)
    }
    
    func setting() {
        view.backgroundColor = .white
        
        buttonTap.myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imagePenguin.myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imagePenguin.myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
            buttonTap.myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTap.myButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            buttonTap.myButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            buttonTap.myButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
        ])
    }
    
    @objc func buttonTapped() {
        buttonTap.myButton.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 0.3, initialSpringVelocity: 5,
            animations: {
            switch self.currentAnimation {
            case 0:
                self.imagePenguin.myImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                self.imagePenguin.myImage.transform = .identity
            case 2:
                self.imagePenguin.myImage.transform = CGAffineTransform(translationX: -100, y: -100)
            case 3:
                self.imagePenguin.myImage.transform = .identity
            case 4:
                self.imagePenguin.myImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case 5:
                self.imagePenguin.myImage.transform = .identity
            case 6:
                self.imagePenguin.myImage.alpha = 0.5
                self.imagePenguin.myImage.backgroundColor = .orange
            case 7:
                self.imagePenguin.myImage.alpha = 1
                self.imagePenguin.myImage.backgroundColor = .clear
            default:
                break
            }
            
        }) { finished in
            self.buttonTap.myButton.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

