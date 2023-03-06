//
//  Result.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import Foundation



struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl30: String
    var artworkUrl100: String
    var country: String
    var trackTimeMillis: Int
}
