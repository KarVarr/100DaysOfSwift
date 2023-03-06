//
//  Order.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

//Challenge 3
class ClassOrder: ObservableObject {
    @Published var structOrder: Order
    
    init(structOrder: Order) {
        self.structOrder = structOrder
    }
}

struct Order: Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
     var type = 0
     var quantity = 3
    
     var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
     var extraFrosting = false
     var addSprinkles = false
    
     var name = ""
     var streetAddress = ""
     var city = ""
     var zip = ""
    
    
    var hasValidAddress: Bool {
        //Challenge 1
        let nameTrimmed =  name.trimmingCharacters(in: CharacterSet.whitespaces)
        let streetAddressTrimmed = streetAddress.trimmingCharacters(in: CharacterSet.whitespaces)
        let cityTrimmed = city.trimmingCharacters(in: CharacterSet.whitespaces)
        let zipTrimmed =  zip.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if nameTrimmed.isEmpty ||  streetAddressTrimmed.isEmpty  || cityTrimmed.isEmpty || zipTrimmed.isEmpty  {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
    
    
}

