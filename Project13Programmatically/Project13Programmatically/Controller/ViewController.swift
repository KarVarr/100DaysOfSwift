//
//  ViewController.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let myView = ViewForImage()
    let myImage = ImageView()
    let myLabel = LabelView()
    let mySlider = SliderView()
    let myButtonFilter = ButtonViewFilter()
    let myButtonSave = ButtonViewSave()
    let myStackViewHorizontalForSlider = StackViewHorizontalForSlider()
    let myStackViewHorizontalForButtons = StackViewHorizontalForButtons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        settings()
        layout()
    }
    
    
    func addViews() {
        view.addSubview(myView.uiView)
        view.addSubview(myImage.uiImageView)
        view.addSubview(myLabel.uiLabel)
        view.addSubview(mySlider.uiSlider)
        view.addSubview(myButtonFilter.uiButton)
        view.addSubview(myButtonSave.uiButton)
        view.addSubview(myStackViewHorizontalForSlider.stackView)
        view.addSubview(myStackViewHorizontalForButtons.stackView)
        
    }

    func settings() {
        title = "Hello"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        
    }

    func layout() {
        NSLayoutConstraint.activate([
            myView.uiView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            myView.uiView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            myView.uiView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            myView.uiView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            myImage.uiImageView.topAnchor.constraint(equalTo: myView.uiView.topAnchor, constant: 10),
            myImage.uiImageView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myImage.uiImageView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
            myImage.uiImageView.bottomAnchor.constraint(equalTo: myView.uiView.bottomAnchor, constant: -10),
            
            myStackViewHorizontalForSlider.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackViewHorizontalForSlider.stackView.topAnchor.constraint(equalTo: myView.uiView.bottomAnchor, constant: 10),
            myStackViewHorizontalForSlider.stackView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myStackViewHorizontalForSlider.stackView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
            
            myStackViewHorizontalForButtons.stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackViewHorizontalForButtons.stackView.topAnchor.constraint(equalTo: myStackViewHorizontalForSlider.stackView.bottomAnchor, constant: 10),
            myStackViewHorizontalForButtons.stackView.leadingAnchor.constraint(equalTo: myView.uiView.leadingAnchor, constant: 10),
            myStackViewHorizontalForButtons.stackView.trailingAnchor.constraint(equalTo: myView.uiView.trailingAnchor, constant: -10),
        
            
            myButtonFilter.uiButton.widthAnchor.constraint(equalToConstant: 120),
            myButtonFilter.uiButton.heightAnchor.constraint(equalToConstant: 44),
            
            myButtonSave.uiButton.widthAnchor.constraint(equalToConstant: 60),
            myButtonSave.uiButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}

