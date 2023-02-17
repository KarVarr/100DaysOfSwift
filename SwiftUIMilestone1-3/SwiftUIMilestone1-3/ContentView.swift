//
//  ContentView.swift
//  SwiftUIMilestone1-3
//
//  Created by Karen Vardanian on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pickRandom = "Rock"
    
    
    
    var body: some View {
        VStack {
            VStack {
                Picker("Pick the peace", selection: $pickRandom) {
                    
                }
                .pickerStyle(.segmented)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
