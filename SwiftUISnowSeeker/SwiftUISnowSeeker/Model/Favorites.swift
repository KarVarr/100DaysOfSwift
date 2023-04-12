//
//  Favorites.swift
//  SwiftUISnowSeeker
//
//  Created by Karen Vardanian on 11.04.2023.
//

import Foundation


class Favorites: ObservableObject {
    
    private var resorts: Set<String>
    private let saveKey = "Favorites"

    init() {
        //Challenge 2
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
                return
            }
        }
            
        resorts = []
    }

  
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        //Challenge 2
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
