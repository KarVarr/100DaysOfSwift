//
//  DataController.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 13.03.2023.
//
import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataMilestone10-12")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
