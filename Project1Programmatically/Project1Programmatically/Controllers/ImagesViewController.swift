//
//  ImagesViewController.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 02.03.2023.
//

import UIKit

class ImagesViewController: UIViewController {

    var myImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        settings()
        addView()
        layout()
       
    }
    
    
    func settings() {
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        myImage.layer.cornerRadius = 10
        myImage.clipsToBounds = true 
    }
    
    func addView () {
        view.addSubview(myImage)
    }
    
    func layout () {
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myImage.widthAnchor.constraint(equalToConstant: 200),
            myImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }


}
