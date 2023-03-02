//
//  ViewController.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5960784314, green: 0.8666666667, blue: 0.7921568627, alpha: 1)
        title = "Main View"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)
        ]
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
    }
    
    
}

