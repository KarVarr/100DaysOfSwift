//
//  ImageViewController.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
    }
    
    
    func addView() {
        
    }
    
    func settings() {
        view.backgroundColor = .systemPink
        
        title = "Unknown place"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            
        ])
    }


    
}
