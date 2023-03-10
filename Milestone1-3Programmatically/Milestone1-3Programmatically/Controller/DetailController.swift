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
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageForFlag.flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageForFlag.flagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageForFlag.flagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            imageForFlag.flagImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            imageForFlag.flagImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageForFlag.flagImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
