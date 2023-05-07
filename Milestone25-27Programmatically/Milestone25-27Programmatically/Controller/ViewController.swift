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
    
    var topLabel = LabelView()
    var bottomLabel = LabelView()
    
    let horizontalStackViewToolbar = HorizontalStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigation()
        addView()
        setting()
        layout()
    }
    
    //MARK: - SETTINGS
    
    func addView() {
        view.addSubview(myImage.customImageView)
        view.addSubview(toolbarView.customView)
        myImage.customImageView.addSubview(topLabel.customLabel)
        myImage.customImageView.addSubview(bottomLabel.customLabel)
        toolbarView.customView.addSubview(horizontalStackViewToolbar.customStack)
        
        horizontalStackViewToolbar.customStack.addArrangedSubview(topTextButton.customButton)
        horizontalStackViewToolbar.customStack.addArrangedSubview(bottomTextButton.customButton)
        horizontalStackViewToolbar.customStack.addArrangedSubview(addImage.customButton)
    }
    
    func setting() {
        view.backgroundColor = .systemOrange
        
        myImage.customImageView.image = UIImage(systemName: "plus")
        
        
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
        let mainImage = myImage.customImageView
        let toolbar = toolbarView.customView
        let hStack = horizontalStackViewToolbar.customStack
        let topLabel = topLabel.customLabel
        let bottomLabel = bottomLabel.customLabel
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainImage.bottomAnchor.constraint(equalTo: toolbar.topAnchor, constant: -10),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            topLabel.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 30),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 10),
            topLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -10),
            
            bottomLabel.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -30),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor, constant: 10),
            bottomLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: -10),
            
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
    
    func navigation() {
        title = "Meme Generator"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareMeme))
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - FUNCKION
    
    @objc func addTopText() {
        let ac = UIAlertController(title: "Add text to Top", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            
            self?.topLabel.customLabel.text = text.capitalized
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        
    }
    
    @objc func addBottomText() {
        let ac = UIAlertController(title: "Add text to the Bottom", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            
            self?.bottomLabel.customLabel.text = text
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func addNewImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func shareMeme() {
        guard let image = myImage.customImageView.image?.jpegData(compressionQuality: 1) else {return}
        
        
    
        let vc = UIActivityViewController(activityItems: [image, topLabel.customLabel.text ?? "Unknown"], applicationActivities: [])
        present(vc, animated: true)
    }
    
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        
        dismiss(animated: true)
        myImage.customImageView.image = image
    }
}
