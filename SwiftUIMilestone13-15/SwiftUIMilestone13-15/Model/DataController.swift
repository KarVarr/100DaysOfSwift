//
//  DataController.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 23.03.2023.
//
import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "SwiftUIMilestone13")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
