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
        label.text = "HELLO"
        label.font = UIFont(name: "BradleyHandITCTT-Bold", size: 40)
        label.textColor = .systemPink
        
        return label
    }()
    
    var attempts: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Attempt: 7"
        label.font = UIFont(name: "BradleyHandITCTT-Bold", size: 40)
        label.textColor = .white
        return label
    }()
}
