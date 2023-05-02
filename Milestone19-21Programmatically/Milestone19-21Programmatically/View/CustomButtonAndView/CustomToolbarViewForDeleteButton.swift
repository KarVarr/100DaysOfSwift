//
//  CustomToolbarViewForDeleteButton.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class CustomToolbarViewForDeleteButton {
    let myView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        view.layer.cornerRadius = 30
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 3
        return view
    }()
}
