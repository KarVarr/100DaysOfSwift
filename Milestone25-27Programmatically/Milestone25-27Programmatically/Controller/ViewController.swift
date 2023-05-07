//
//  ViewController.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit

class ViewController: UIViewController {
    var myImage = ImageView()
    let toolbarView = ToolbarView()
    var topTextButton = ButtonView()
    var bottomTextButton = ButtonView()
    var addImage = ButtonView()
    
    let horizontalStackViewToolbar = HorizontalStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        addView()
        setting()
        layout()
    }
    
    //MARK: - SETTINGS
    
    func addView() {
        view.addSubview(myImage.customImageView)
        view.addSubview(toolbarView.customView)
        toolbarView.customView.addSubview(horizontalStackViewToolbar.customStack)
        
        horizontalStackViewToolbar.customStack.addArrangedSubview(topTextButton.customButton)
        horizontalStackViewToolbar.customStack.addArrangedSubview(bottomTextButton.customButton)
        horizontalStackViewToolbar.customStack.addArrangedSubview(addImage.customButton)
    }
    
    func setting() {
        title = "Meme Generator"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMeme))
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        toolbarView.customView.backgroundColor = .black
        toolbarView.customView.layer.cornerRadius = 40
        
        topTextButton.customButton.setTitle("Top Text", for: .normal)
        topTextButton.customButton.addTarget(self, action: #selector(addTopText), for: .touchUpInside)
        
        bottomTextButton.customButton.setTitle("Bottom Text", for: .normal)
        bottomTextButton.customButton.addTarget(self, action: #selector(addBottomText), for: .touchUpInside)
        
        addImage.customButton.setImage(UIImage(systemName: "photo")?.withTintColor(.magenta, renderingMode: .alwaysOriginal), for: .normal)
        addImage.customButton.addTarget(self, action: #selector(addNewImage), for: .touchUpInside)
    }
    
    func layout() {
        let toolbar = toolbarView.customView
        let hStack = horizontalStackViewToolbar.customStack
        
        NSLayoutConstraint.activate([
                toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
                toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                toolbar.heightAnchor.constraint(equalToConstant: 80),
                
                hStack.topAnchor.constraint(equalTo: toolbar.topAnchor),
                hStack.bottomAnchor.constraint(equalTo: toolbar.bottomAnchor),
                hStack.leadingAnchor.constraint(equalTo: toolbar.leadingAnchor),
                hStack.trailingAnchor.constraint(equalTo: toolbar.trailingAnchor),
                
        ])
        
    }
    
    //MARK: - FUNCKION
    
    @objc func addTopText() {
        
    }
    
    @objc func addBottomText() {
        
    }
    
    @objc func addNewImage() {
        
    }
    
    @objc func shareMeme() {
        
    }
    
}

