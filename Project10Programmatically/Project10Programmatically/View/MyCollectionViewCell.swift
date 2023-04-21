//
//  MyCollectionViewCell.swift
//  Project10Programmatically
//
//  Created by Karen Vardanian on 18.04.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel = {
       var label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.textAlignment = .center
        label.textColor = .orange
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame = bounds
        
        
        
        backgroundColor = .white
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
