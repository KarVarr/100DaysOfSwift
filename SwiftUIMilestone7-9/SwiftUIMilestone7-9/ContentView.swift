//
//  ContentView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddHabitsView = false
    
    
    
    let arr = ["walk", "run", "eat", "sleep"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(arr, id: \.self) {
                    Text($0)
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddHabitsView = true 
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddHabitsView) {
                    HabitsView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
