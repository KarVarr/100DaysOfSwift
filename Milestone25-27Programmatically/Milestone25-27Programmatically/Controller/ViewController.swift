//
//  ViewController.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    func addView() {
        
    }
    
    func setting() {
        title = "Meme Generator"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMeme))
    }
    
    func layout() {
        
    }
    
    @objc func shareMeme() {
        
    }

}

