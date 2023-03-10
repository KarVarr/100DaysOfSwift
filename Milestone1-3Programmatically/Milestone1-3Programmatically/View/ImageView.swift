//
//  ImageView.swift
//  Milestone1-3Programmatically
//
//  Created by Karen Vardanian on 10.03.2023.
//

import UIKit

class ImageView {
    var flagImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "questionmark.app")
        return image
    }()
}


