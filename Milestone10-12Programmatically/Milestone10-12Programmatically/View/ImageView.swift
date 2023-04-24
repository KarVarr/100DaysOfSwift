//
//  ImageView.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import UIKit

class ImageView {
    let showingImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        
        return image
    }()
}
