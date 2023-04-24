//
//  ImageViewController.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ImageViewController: UIViewController {
    var image = ImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
    }
    
    
    func addView() {
        view.addSubview(image.showingImage)
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        title = "Unknown place"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Caption", style: .plain, target: self, action: #selector(captionImage))
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            image.showingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.showingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.showingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            image.showingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            image.showingImage.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            image.showingImage.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
        ])
    }

    @objc func captionImage() {
        
    }
    
}
