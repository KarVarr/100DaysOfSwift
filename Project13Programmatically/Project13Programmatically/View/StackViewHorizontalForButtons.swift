//
//  StackViewHorizontalForButtons.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 26.04.2023.
//

import UIKit

class StackViewHorizontalForButtons {
    let stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ButtonViewFilter().uiButton, ButtonViewSave().uiButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
}
