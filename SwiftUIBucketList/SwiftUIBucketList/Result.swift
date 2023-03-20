//
//  Result.swift
//  SwiftUIBucketList
//
//  Created by Karen Vardanian on 20.03.2023.
//

import Foundation

struct Result: Codable {
    let query: Query
}


struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
