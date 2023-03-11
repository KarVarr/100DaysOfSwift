//
//  DataController.swift
//  SwiftUICoreDataProject
//
//  Created by Karen Vardanian on 10.03.2023.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
}
