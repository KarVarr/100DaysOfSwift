//
//  SwiftUIMilestone10_12App.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

@main
struct SwiftUIMilestone10_12App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
