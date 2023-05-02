//
//  Notes.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import UIKit


class Notes: Codable {
   
    
    var title: String
    var note: String
    var id: UUID
    
    init(title: String, note: String, id: UUID) {
        self.title = title
        self.note = note
        self.id = id
    }
}
