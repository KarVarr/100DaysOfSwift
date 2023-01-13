//
//  ViewController.swift
//  Project15
//
//  Created by Karen Vardanian on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = view.center
        view.addSubview(imageView)
    }


    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        
        //UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0 :
                //self.imageView.transform = CGAffineTransform(rotationAngle: 350)
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
               //self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
               //self.imageView.transform = CGAffineTransform(translationX: 0, y: 0)
                break
            case 1 :
                self.imageView.transform = .identity
            case 2 :
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3 :
                self.imageView.transform = .identity
            case 4 :
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5 :
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .magenta
            case 7 :
                self.imageView.alpha = 1.0
                self.imageView.backgroundColor = .clear
            default: break
            }
        }) {finished in
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}

