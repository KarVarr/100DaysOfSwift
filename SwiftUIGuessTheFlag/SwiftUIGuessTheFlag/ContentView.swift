//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Karen Vardanian on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        Button ("Show Alert") {
            showingAlert = true
        }
        .alert("This is Alert", isPresented: $showingAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Ok") {}
            
        } message: {
            Text("You can read this?")
        }
        
    }
 
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
