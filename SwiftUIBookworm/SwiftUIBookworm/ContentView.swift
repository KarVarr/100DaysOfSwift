//
//  ContentView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI




struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("notes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
