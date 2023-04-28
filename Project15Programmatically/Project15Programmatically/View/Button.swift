//
//  Button.swift
//  Project15Programmatically
//
//  Created by Karen Vardanian on 28.04.2023.
//

import UIKit

class Button {
    let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        return button
    }()
}
