//
//  Activity.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 04.03.2023.
//

import Foundation


struct Activity: Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
}
