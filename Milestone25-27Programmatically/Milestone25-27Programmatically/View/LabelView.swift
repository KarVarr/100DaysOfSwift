//
//  LabelView.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit


class LabelView {
    let customLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "GillSans-UltraBold", size: 32)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}
