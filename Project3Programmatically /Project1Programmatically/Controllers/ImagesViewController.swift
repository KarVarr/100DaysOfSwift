//
//  ImagesViewController.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 02.03.2023.
//

import UIKit

class ImagesViewController: UIViewController {

    var myImage = UIImageView()
    var ImageTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = ImageTitle
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        settings()
        addView()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    //MARK: - Functions
    
    
    @objc func shareTapped() {
        guard let image = myImage.image?.jpegData(compressionQuality: 1) else {
            print("no image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
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
