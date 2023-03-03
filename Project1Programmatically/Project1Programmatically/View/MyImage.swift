//
//  MyImage.swift
//  Project1Programmatically
//
//  Created by Karen Vardanian on 03.03.2023.
//

import UIKit

class MyImage {
    let imageName: String = ""
    var image: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img = UIImageView(image: UIImage(named: "nssl0033"))
        return img
    }()
    
    
}
