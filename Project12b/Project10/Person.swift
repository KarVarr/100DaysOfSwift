//
//  Person.swift
//  Project10
//
//  Created by Karen Vardanian on 30.12.2022.
//

import UIKit

class Person: NSObject, Codable {
    var name : String
    var image : String
    
    internal init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
