//
//  UserModel.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import Foundation

struct UserModel: Codable {
    let id: String
      let isActive: Bool
      let name: String
      let age: Int
      let company, email, address, about: String
      let registered: Date
      let tags: [String]
      let friends: [FriendsModel]
}
