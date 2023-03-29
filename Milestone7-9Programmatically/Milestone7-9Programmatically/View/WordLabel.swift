//
//  WordLabel.swift
//  Milestone7-9Programmatically
//
//  Created by Karen Vardanian on 29.03.2023.
//

import UIKit

class WordLabel {
    var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey, press Start"
        label.font = UIFont(name: "BradleyHandITCTT-Bold", size: 40)
        label.textColor = .systemPink
        
        return label
    }()
    
    var attempts: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🫵"
        label.font = UIFont(name: "BradleyHandITCTT-Bold", size: 40)
        label.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        return label
    }()
}
