//
//  Labels.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit

struct Labels {
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "Score: 0"
        return label
    }()
    
    var cluesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "CLUES"
        label.numberOfLines = 0
        return label
    }()
    
    var answersLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "ANSWERS"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
}
