//
//  Place.swift
//  Milestone10-12Programmatically
//
//  Created by Karen Vardanian on 24.04.2023.
//

import Foundation


class Place: Codable {
    let image: String
    let name: String
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
}
