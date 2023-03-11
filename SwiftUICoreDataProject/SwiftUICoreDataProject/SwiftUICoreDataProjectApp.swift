//
//  SwiftUICoreDataProjectApp.swift
//  SwiftUICoreDataProject
//
//  Created by Karen Vardanian on 10.03.2023.
//

import SwiftUI

@main
struct SwiftUICoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

