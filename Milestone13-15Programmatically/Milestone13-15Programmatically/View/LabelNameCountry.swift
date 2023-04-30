//
//  LabelNameCountry.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import UIKit


class  LabelNameCountry {
    let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 18)
        return label
    }()
}
