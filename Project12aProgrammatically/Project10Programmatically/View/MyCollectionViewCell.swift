//
//  MyCollectionViewCell.swift
//  Project10Programmatically
//
//  Created by Karen Vardanian on 18.04.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var label = UILabel()
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
        addSubview(label)
        addSubview(imageView)
    }
    
    func settings() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        imageView.layer.borderWidth = 2
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    
}
