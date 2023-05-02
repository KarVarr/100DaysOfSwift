//
//  Storage.swift
//  Milestone19-21Programmatically
//
//  Created by Karen Vardanian on 02.05.2023.
//

import Foundation


class Storage {
    let userDefaultKey = "note"
    
    static func load() -> [Notes] {
        let defaults = UserDefaults.standard
        var note = [Notes]()
        
        if let savedNote = defaults.object(forKey: Storage().userDefaultKey) as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                note = try jsonDecoder.decode([Notes].self, from: savedNote)
            } catch {
                print("Failed to load note!")
            }
            
        }
        return note
    }
    
    static func save(note: [Notes]) {
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(note) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: Storage().userDefaultKey)
        } else {
            print("Failed to save people!")
        }
    }
}
