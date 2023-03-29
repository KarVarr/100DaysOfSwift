//
//  KeyboardView.swift
//  Milestone7-9Programmatically
//
//  Created by Karen Vardanian on 29.03.2023.
//

import UIKit

class KeyboardView {
    var keyboardView: UIView = {
        let key = UIView()
        key.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        key.translatesAutoresizingMaskIntoConstraints = false
        key.layer.cornerRadius = 30
        key.layer.shadowColor = UIColor.black.cgColor
        key.layer.shadowRadius = 6
        key.layer.shadowOpacity = 0.5
        key.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return key
    }()
    
   
}
