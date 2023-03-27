//
//  TextField.swift
//  Project8Programmatically
//
//  Created by Karen Vardanian on 27.03.2023.
//

import UIKit


struct TextField {
    var currentAnswer: UITextField = {
       let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Tap letters to guess"
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 44)
        text.isUserInteractionEnabled = false
        return text
    }()
}
