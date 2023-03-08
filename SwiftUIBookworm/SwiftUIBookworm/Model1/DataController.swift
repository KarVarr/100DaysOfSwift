//
//  DataController.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 08.03.2023.
//
import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed not load: \(error.localizedDescription)")
            }
        }
    }
}
