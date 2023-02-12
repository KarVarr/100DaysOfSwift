//
//  ContentView.swift
//  WeSplitSwiftUI
//
//  Created by Karen Vardanian on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    let users = ["Ron", "Harry", "Malfoy", "Elisabet", "Jack", "Bob"]
    @State private var currentUser = "Harry"
    
    var body: some View {
        NavigationView {
            Picker("Choose the Player", selection: $currentUser) {
                ForEach(users, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.automatic)
            .foregroundColor(.red)
            .navigationTitle("Users")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
