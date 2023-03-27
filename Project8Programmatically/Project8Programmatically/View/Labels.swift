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
}
