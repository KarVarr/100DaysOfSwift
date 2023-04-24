//
//  ImageViewController.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ImageViewController: UIViewController {
    var image = ImageView()
    var caption = CaptionView()
    let utility = Utility()
    
    var places = [Place]()
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
        if let savedData = UserDefaults.standard.data(forKey: "places") {
               let jsonDecoder = JSONDecoder()
               if let loadedPlaces = try? jsonDecoder.decode([Place].self, from: savedData) {
                   places = loadedPlaces
               }
           }
           
           if let loadedPlace = place {
               caption.label.text = loadedPlace.caption
           }
        
    }
    
    
    func addView() {
        view.addSubview(image.showingImage)
        view.addSubview(caption.label)
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        title = place?.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Caption", style: .plain, target: self, action: #selector(captionImage))
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            image.showingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.showingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.showingImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            image.showingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            image.showingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            image.showingImage.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
            image.showingImage.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            
            
            caption.label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            caption.label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func captionImage() {
        let ac = UIAlertController(title: "Add caption", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] _ in
            guard let newCaption = ac?.textFields?[0].text else { return }
            
            self?.caption.label.text = newCaption
            self?.save()
        })
        
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(places) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "places")
        } else {
            print("Failed to save people.")
        }
    }
}
