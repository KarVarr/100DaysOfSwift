//
//  Button.swift
//  Project28Programmatically
//
//  Created by Karen Vardanian on 08.05.2023.
//

import UIKit

class Button {
    let customButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Authentication", for: .normal)
        return button
    }()
}
