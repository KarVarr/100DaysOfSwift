//
//  ButtonView.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit

class ButtonView {
    let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Copperplate", size: 18)
        button.titleLabel?.tintColor = .cyan
        return button
    }()
}
