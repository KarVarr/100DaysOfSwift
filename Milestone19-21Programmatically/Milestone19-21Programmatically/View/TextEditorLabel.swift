//
//  TextEditorLabel.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class TextEditorLabel {
    
    let textEditor: UITextView = {
        let textEditor = UITextView()
        textEditor.translatesAutoresizingMaskIntoConstraints = false
        textEditor.textColor = .black
        textEditor.textAlignment = .left
        textEditor.font = UIFont.systemFont(ofSize: 16)
        textEditor.autocapitalizationType = .sentences
        textEditor.returnKeyType = .done
        textEditor.layer.cornerRadius = 8
        textEditor.clipsToBounds = true
        return textEditor
    }()
}
