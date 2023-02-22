//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Karen Vardanian on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingFrame = false
    
    var body: some View {
        VStack {
            Button("Tap") {
                withAnimation {
                    showingFrame.toggle()
                }
            }
            if showingFrame {
                Rectangle ()
                    .fill(.indigo)
                    .frame(width: 300, height: 300)
                    //.transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .scale))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
