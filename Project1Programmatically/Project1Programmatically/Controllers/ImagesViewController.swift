//
//  ImagesViewController.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 02.03.2023.
//

import UIKit

class ImagesViewController: UIViewController {

    let myImage = MyImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        settings()
        addView()
        layout()
       
    }
    
    
    func settings() {
        myImage.image.translatesAutoresizingMaskIntoConstraints = false
        myImage.image = UIImageView(image: UIImage(named: "nssl0033"))
    }
    
    func addView () {
        view.addSubview(myImage.image)
    }
    
    func layout () {
        NSLayoutConstraint.activate([
            myImage.image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myImage.image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myImage.image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImage.image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}
