//
//  MyCollectionViewCell.swift
//  Project10Programmatically
//
//  Created by Karen Vardanian on 18.04.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var label = UILabel()
    var image = UIImageView()
    
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
        addSubview(image)
    }
    
    func settings() {
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.frame = bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .brown
        image.layer.cornerRadius = 20
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            image.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    
}
