//
//  Image.swift
//  Project15Programmatically
//
//  Created by Karen Vardanian on 28.04.2023.
//

import UIKit

class Image {
    let myImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "penguin")
        return image
    }()
}
