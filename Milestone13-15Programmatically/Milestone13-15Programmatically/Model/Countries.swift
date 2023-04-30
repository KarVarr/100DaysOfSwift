//
//  Countries.swift
//  Milestone13-15Programmatically
//
//  Created by Karen Vardanian on 30.04.2023.
//

import Foundation

// MARK: - Countries
struct Countries: Codable {
    let name: Name
    let region: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
}



