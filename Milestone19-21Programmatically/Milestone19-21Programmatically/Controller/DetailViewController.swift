//
//  ViewController.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    let customViewForComposeButton = CustomToolbarViewForComposeButton()
    let customViewForDeleteButton = CustomToolbarViewForDeleteButton()
    let composeButton = ComposeButtonView()
    let deleteButton = DeleteButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        addView()
        setting()
        layout()
//        toolBarAndNavigationViewSetting()
    }
    
    func addView() {
        view.addSubview(customViewForComposeButton.myView)
        view.addSubview(customViewForDeleteButton.myView)
        view.addSubview(composeButton.button)
        view.addSubview(deleteButton.button)
    }
    
    func setting() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
       
        customViewForComposeButton.myView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.5145705342, blue: 1, alpha: 1)
        customViewForComposeButton.myView.layer.cornerRadius = 30
        customViewForComposeButton.myView.layer.shadowOffset = .zero
        customViewForComposeButton.myView.layer.shadowOpacity = 0.25
        customViewForComposeButton.myView.layer.shadowColor = UIColor.black.cgColor
        customViewForComposeButton.myView.layer.shadowRadius = 3
        
        
        customViewForDeleteButton.myView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        customViewForDeleteButton.myView.layer.cornerRadius = 30
        customViewForDeleteButton.myView.layer.shadowOffset = .zero
        customViewForDeleteButton.myView.layer.shadowOpacity = 0.25
        customViewForDeleteButton.myView.layer.shadowColor = UIColor.black.cgColor
        customViewForDeleteButton.myView.layer.shadowRadius = 3
        
    }
    
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
        ])
    }
    
    func toolBarAndNavigationViewSetting() {
        title = "Detail"
        navigationItem.largeTitleDisplayMode = .never
        
        let deleteButton = UIBarButtonItem(image: UIImage(systemName: "xmark.bin"), style: .plain, target: self, action: #selector(deleteItem))
        let composeButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(composeItem))
        
        let leftSpacerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        let leftSpace = UIBarButtonItem(customView: leftSpacerView)
        
        let rightSpacerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
        let rightSpace = UIBarButtonItem(customView: rightSpacerView)
        
        toolbarItems = [leftSpace,deleteButton, UIBarButtonItem.flexibleSpace(), composeButton, rightSpace]
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.backgroundColor = .cyan
        navigationController?.toolbar.layer.cornerRadius = 10
        
        
    }
    
    @objc func deleteItem() {
        
    }
    
    @objc func composeItem() {
        
    }


}

