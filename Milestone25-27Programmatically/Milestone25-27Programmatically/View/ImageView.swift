//
//  ImageView.swift
//  Milestone25-27Programmatically
//
//  Created by Karen Vardanian on 07.05.2023.
//

import UIKit

class ImageView {
    var customImageView: UIImageView = {
       var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}
