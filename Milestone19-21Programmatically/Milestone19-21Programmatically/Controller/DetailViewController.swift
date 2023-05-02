//
//  ViewController.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleLabel = TitleLabel()
    
    let note = [Notes]()
    
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
        view.addSubview(titleLabel.titleLabel)
    }
    
    func setting() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        
        composeButton.button.addTarget(self, action: #selector(composeItem), for: .touchUpInside)
        
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
            
            titleLabel.titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
//    func toolBarAndNavigationViewSetting() {
//        title = "Detail"
//        navigationItem.largeTitleDisplayMode = .never
//
//        let deleteButton = UIBarButtonItem(image: UIImage(systemName: "xmark.bin"), style: .plain, target: self, action: #selector(deleteItem))
//        let composeButton = UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(composeItem))
//
//        let leftSpacerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
//        let leftSpace = UIBarButtonItem(customView: leftSpacerView)
//
//        let rightSpacerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
//        let rightSpace = UIBarButtonItem(customView: rightSpacerView)
//
//        toolbarItems = [leftSpace,deleteButton, UIBarButtonItem.flexibleSpace(), composeButton, rightSpace]
//        navigationController?.isToolbarHidden = false
//        navigationController?.toolbar.backgroundColor = .cyan
//        navigationController?.toolbar.layer.cornerRadius = 10
//    }
    
    
    
    @objc func deleteItem() {
        
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


}

