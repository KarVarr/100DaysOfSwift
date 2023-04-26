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
    
    var places = [Place]()
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        settings()
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let data = UserDefaults.standard.data(forKey: "placeData") {
            let decoder = JSONDecoder()
            do {
                let place = try decoder.decode(Place.self, from: data)
                caption.label.text = place.caption
               
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func addView() {
        view.addSubview(image.showingImage)
        view.addSubview(caption.label)
    }
    
    func settings() {
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
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
            
            caption.label.topAnchor.constraint(equalTo: image.showingImage.bottomAnchor, constant: 30),
        ])
    }
    
    @objc func captionImage() {
        let ac = UIAlertController(title: "Add caption", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self, weak ac] _ in
            guard let newCaption = ac?.textFields?[0].text else { return }
            
            self?.caption.label.text = newCaption
            

            // Encode the Place instance to Data
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self?.place)
                UserDefaults.standard.set(data, forKey: "placeData")
            } catch {
                print(error.localizedDescription)
            }

           

        })
        
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
//    func save() {
//        let jsonEncoder = JSONEncoder()
//        if let savedData = try? jsonEncoder.encode(places) {
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: "places")
//        } else {
//            print("Failed to save people.")
//        }
//    }
}
