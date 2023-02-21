//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Karen Vardanian on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var scale = 1.0
    
    var body: some View {
            Button("Tap me"){
                scale += 0.5
            }
        
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(scale)
        .blur(radius: (scale - 1) * 2)
        .animation(.easeOut, value: scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
