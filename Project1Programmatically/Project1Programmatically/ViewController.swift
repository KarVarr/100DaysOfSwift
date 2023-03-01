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
        view.backgroundColor = .cyan
        
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

