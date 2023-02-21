//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Karen Vardanian on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var enable = false
    
    var body: some View {
        
        Button("Tap") {
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .foregroundColor(.white)
        .background(enable ? .indigo : .mint)
        .animation(.easeOut, value: enable)
        .clipShape(RoundedRectangle(cornerRadius: enable ? 50 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enable)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
