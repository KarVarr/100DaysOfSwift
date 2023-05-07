//
//  HorizontalStackView.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit


class HorizontalStackView {
    let customStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
}
