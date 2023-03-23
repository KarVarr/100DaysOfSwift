//
//  SwiftUIMilestone13_15App.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

@main
struct SwiftUIMilestone13_15App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
