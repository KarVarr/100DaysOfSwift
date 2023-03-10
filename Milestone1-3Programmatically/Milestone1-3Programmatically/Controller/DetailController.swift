//
//  DetailController.swift
//  Milestone1-3Programmatically
//
//  Created by Karen Vardanian on 10.03.2023.
//

import UIKit

class DetailController: UIViewController {
    
    let imageForFlag = ImageView()
    var detailTitle: String?
    
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
        
        title = detailTitle
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addActionTapped))
        
        
        imageForFlag.flagImage.translatesAutoresizingMaskIntoConstraints = false
        imageForFlag.flagImage.layer.masksToBounds = true
        imageForFlag.flagImage.contentMode = .scaleAspectFill
        imageForFlag.flagImage.clipsToBounds = true
        imageForFlag.flagImage.layer.cornerRadius = 10
        imageForFlag.flagImage.layer.borderColor = UIColor.white.cgColor
        imageForFlag.flagImage.layer.borderWidth = 1
      
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageForFlag.flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageForFlag.flagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageForFlag.flagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageForFlag.flagImage.widthAnchor.constraint(equalToConstant: 300),
            imageForFlag.flagImage.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    @objc func addActionTapped () {
        guard let images = imageForFlag.flagImage.image?.jpegData(compressionQuality: 1) else {
            print("There is no image")
            return
        }
        let vc = UIActivityViewController(activityItems: [images, detailTitle ?? "Unknown flag"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
