//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Karen Vardanian on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 0.0
    
    var body: some View {
        
        Button("Tap") {
            withAnimation(.interpolatingSpring(stiffness: 20, damping: 2)) {
                scale += 360
            }
        }
        .padding(30)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .mint, radius: 2, x: 2, y: 2)
        .rotation3DEffect(.degrees(scale), axis: (x: 0, y: 1, z: 0) )
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
