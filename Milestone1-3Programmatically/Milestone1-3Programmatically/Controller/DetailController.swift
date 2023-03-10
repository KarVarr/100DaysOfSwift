//
//  DetailController.swift
//  Milestone1-3Programmatically
//
//  Created by Karen Vardanian on 10.03.2023.
//

import UIKit

class DetailController: UIViewController {
    
    let imageForFlag = ImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addView()
        settings()
        layout()
    }
    
    func addView() {
        view.addSubview(imageForFlag.flagImage)
    }

    func settings() {
        view.backgroundColor = .systemMint
        imageForFlag.flagImage.translatesAutoresizingMaskIntoConstraints = false
        imageForFlag.flagImage.contentMode = .scaleAspectFit
        imageForFlag.flagImage.clipsToBounds = true
        imageForFlag.flagImage.layer.cornerRadius = 10
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageForFlag.flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageForFlag.flagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageForFlag.flagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageForFlag.flagImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            imageForFlag.flagImage.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            imageForFlag.flagImage.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
    }
}
