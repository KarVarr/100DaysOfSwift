//
//  MyCollectionViewCell.swift
//  Project25Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        
        
        settings()
        addView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addView() {
        addSubview(imageView)
    }
    
    func settings() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        imageView.layer.borderWidth = 2
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: "plus")
        imageView.tag = 1000
        imageView.clipsToBounds = true
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 145),
            imageView.heightAnchor.constraint(equalToConstant: 145),
        ])
    }
}
