//
//  DeleteButtonView.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class DeleteButtonView {
    let button: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.bin"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
}
