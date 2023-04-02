//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var colors = Color.red
    var body: some View {
        List {
            Text("Hi")
                .swipeActions {
                    Button {
                        print("Hey hey")
                    } label: {
                        Label("Hey", systemImage: "message")
                    }
                    
                }
                .tint(.mint)
            
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        print("pin")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                }
                .tint(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
