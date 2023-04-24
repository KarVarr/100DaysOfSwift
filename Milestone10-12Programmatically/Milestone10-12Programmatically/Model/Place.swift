//
//  Place.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import Foundation


class Place: Codable {
    var image: String
    var name: String
    var caption: String
    
    
    init(image: String, name: String, caption: String) {
        self.image = image
        self.name = name
        self.caption = caption
    }
}
