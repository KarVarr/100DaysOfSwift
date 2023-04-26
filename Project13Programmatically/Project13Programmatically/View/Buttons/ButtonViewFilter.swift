//
//  ButtonViewFilter.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 26.04.2023.
//

import UIKit

class ButtonViewFilter {
    let uiButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Filter", for: .normal)
        
        return button
    }()
}

