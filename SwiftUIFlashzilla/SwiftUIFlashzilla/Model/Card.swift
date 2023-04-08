//
//  Card.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 07.04.2023.
//

import Foundation


struct Card: Codable, Identifiable {
    let id: UUID
    let prompt: String
    let answer: String
    
    static let example = Card(id: UUID(), prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
