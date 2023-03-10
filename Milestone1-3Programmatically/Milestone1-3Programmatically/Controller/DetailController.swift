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
        //imageForFlag.flagImage.layer.masksToBounds = true
        imageForFlag.flagImage.contentMode = .scaleAspectFill
        imageForFlag.flagImage.clipsToBounds = true
        imageForFlag.flagImage.layer.cornerRadius = 10
        imageForFlag.flagImage.layer.borderColor = UIColor.white.cgColor
        imageForFlag.flagImage.layer.borderWidth = 1
        imageForFlag.flagImage.layer.shadowColor = UIColor.red.cgColor
        imageForFlag.flagImage.layer.shadowOpacity = 1
        imageForFlag.flagImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageForFlag.flagImage.layer.shadowRadius = 8
        imageForFlag.flagImage.layer.shouldRasterize = true
        imageForFlag.flagImage.layer.zPosition = 1
        let radius = imageForFlag.flagImage.layer.cornerRadius
        imageForFlag.flagImage.layer.shadowPath = UIBezierPath(roundedRect: imageForFlag.flagImage.bounds, cornerRadius: radius).cgPath

    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageForFlag.flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageForFlag.flagImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageForFlag.flagImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imageForFlag.flagImage.widthAnchor.constraint(equalToConstant: 300),
            imageForFlag.flagImage.heightAnchor.constraint(equalToConstant: 200),
            
        ])
        imageForFlag.flagImage.layer.zPosition = 1
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
