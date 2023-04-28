//
//  ImageView.swift
//  Project13Programmatically
//
//  Created by Karen Vardanian on 26.04.2023.
//

import UIKit

class ImageView {
    let uiImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "defaultImage")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.alpha = 0
        return image
    }()
}
