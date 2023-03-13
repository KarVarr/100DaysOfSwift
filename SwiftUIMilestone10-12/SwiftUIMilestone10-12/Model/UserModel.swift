//
//  UserModel.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import Foundation

struct UserModel: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company, email, address, about: String
    var registered: String
    var tags: [String]
    var friends: [FriendsModel]
    
    var formattedRegisteredDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: registered) {
            dateFormatter .dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return registered
        }
    }
}
