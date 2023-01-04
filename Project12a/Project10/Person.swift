//
//  Person.swift
//  Project10
//
//  Created by Karen Vardanian on 30.12.2022.
//

import UIKit

class Person: NSObject, NSCoding {
    
    var name : String
    var image : String
    
    internal init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(name, forKey: "iamge")
        
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        image = coder.decodeObject(forKey: "image") as? String ?? ""
    }
}
