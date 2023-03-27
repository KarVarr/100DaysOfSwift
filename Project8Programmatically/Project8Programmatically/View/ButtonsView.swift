//
//  ButtonsView.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit


struct ButtonsView {
    var buttonsView: UIView = {
        let bView = UIView()
        bView.translatesAutoresizingMaskIntoConstraints = false
        bView.backgroundColor = .orange
        bView.layer.cornerRadius = 10
        bView.layer.shadowOpacity = 0.5
        bView.layer.shadowColor = UIColor.black.cgColor
        bView.layer.shadowRadius = 3
        bView.layer.shadowOffset = CGSize(width: 0, height: 2)
        return bView
    }()
}
