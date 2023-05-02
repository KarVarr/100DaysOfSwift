//
//  ViewController.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    
    let note = [Notes]()
    
    
    var titleLabel = TitleLabel()
    var textField = TextEditorLabel()
    let placeholderLabel = TitleLabel()
    
    
    let customViewForComposeButton = CustomToolbarViewForComposeButton()
    let customViewForDeleteButton = CustomToolbarViewForDeleteButton()
    let composeButton = ComposeButtonView()
    let deleteButton = DeleteButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setting()
        layout()
        
        if !textField.textEditor.text.isEmpty  {
            deleteButton.button.isEnabled = true
        } else {
            deleteButton.button.isEnabled = false
        }
    }
    
    
    //MARK: - ADD VIEWS
    func addView() {
        view.addSubview(customViewForComposeButton.myView)
        view.addSubview(customViewForDeleteButton.myView)
        
        view.addSubview(composeButton.button)
        view.addSubview(deleteButton.button)
        
        view.addSubview(titleLabel.titleLabel)
        view.addSubview(textField.textEditor)
        
        textField.textEditor.addSubview(placeholderLabel.titleLabel)
        
        
    }
    
    //MARK: - SETTINGS
    func setting() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareNoteButton))
        
        titleLabel.titleLabel.font = UIFont(name: "GillSans-Bold", size: 32)
        composeButton.button.addTarget(self, action: #selector(composeItem), for: .touchUpInside)
        deleteButton.button.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        
        
        
        placeholderLabel.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.titleLabel.text = "Write something here..."
        placeholderLabel.titleLabel.textColor = .lightGray
        
        textField.textEditor.delegate = self
        textField.textEditor.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        textViewDidChange(textField.textEditor)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - LAYOUT
    func layout() {
        NSLayoutConstraint.activate([
            customViewForComposeButton.myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            customViewForComposeButton.myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            customViewForComposeButton.myView.heightAnchor.constraint(equalToConstant: 60),
            customViewForComposeButton.myView.widthAnchor.constraint(equalToConstant: 60),
            
            customViewForDeleteButton.myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            customViewForDeleteButton.myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customViewForDeleteButton.myView.heightAnchor.constraint(equalToConstant: 60),
            customViewForDeleteButton.myView.widthAnchor.constraint(equalToConstant: 60),
            
            composeButton.button.topAnchor.constraint(equalTo: customViewForComposeButton.myView.topAnchor, constant: 5),
            composeButton.button.bottomAnchor.constraint(equalTo: customViewForComposeButton.myView.bottomAnchor, constant: -5),
            composeButton.button.leadingAnchor.constraint(equalTo: customViewForComposeButton.myView.leadingAnchor, constant: 5),
            composeButton.button.trailingAnchor.constraint(equalTo: customViewForComposeButton.myView.trailingAnchor, constant: -5),
            
            deleteButton.button.topAnchor.constraint(equalTo: customViewForDeleteButton.myView.topAnchor, constant: 5),
            deleteButton.button.bottomAnchor.constraint(equalTo: customViewForDeleteButton.myView.bottomAnchor, constant: -5),
            deleteButton.button.leadingAnchor.constraint(equalTo: customViewForDeleteButton.myView.leadingAnchor, constant: 5),
            deleteButton.button.trailingAnchor.constraint(equalTo: customViewForDeleteButton.myView.trailingAnchor, constant: -5),
            
            titleLabel.titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.textEditor.topAnchor.constraint(equalTo: titleLabel.titleLabel.bottomAnchor, constant: 10),
            textField.textEditor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.textEditor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.textEditor.bottomAnchor.constraint(equalTo: customViewForDeleteButton.myView.topAnchor, constant: -20),
            
            placeholderLabel.titleLabel.topAnchor.constraint(equalTo: textField.textEditor.topAnchor, constant: 8),
            placeholderLabel.titleLabel.leadingAnchor.constraint(equalTo: textField.textEditor.leadingAnchor, constant: 16),
            
        ])
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.titleLabel.isHidden = !textView.text.isEmpty
    }
    
    //MARK: - HIDE KEYBOARD
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textField.textEditor.resignFirstResponder()
            deleteButton.button.isEnabled = true
            return false
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func deleteItem() {
        if !textField.textEditor.text.isEmpty {
            let ac = UIAlertController(title: "Delete all text?", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Delete", style: .default) { [weak self] _ in
                self?.textField.textEditor.text = ""
                self?.placeholderLabel.titleLabel.isHidden = false
            })
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(ac, animated: true)
        }
    }
    
    @objc func composeItem() {
        let ac = UIAlertController(title: "Change title", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Ok", style: .default) {[weak self] _ in
            guard let newTitle = ac.textFields?[0].text else { return }
            self?.titleLabel.titleLabel.text = newTitle
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func shareNoteButton() {
        
    }
    
    
}

