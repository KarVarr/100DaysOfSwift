//
//  Habits.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 04.03.2023.
//

import Foundation


class Habits: ObservableObject {
    private var itemsKey = "Items"
    
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: itemsKey)
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: itemsKey) {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                activities =  decodedItems
                return
            }
        }
        activities = []
    }
    
    func addActivity(_ activity :Activity) {
        activities.append(activity)
    }
   
    
}
