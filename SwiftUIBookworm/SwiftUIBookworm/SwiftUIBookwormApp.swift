//
//  SwiftUIBookwormApp.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI

@main
struct SwiftUIBookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
