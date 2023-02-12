//
//  ContentView.swift
//  WeSplitSwiftUI
//
//  Created by Karen Vardanian on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
        
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
