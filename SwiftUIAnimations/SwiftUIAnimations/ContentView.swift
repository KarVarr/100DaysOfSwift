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
                //scale += 0.5
            }
        
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
           RoundedRectangle(cornerRadius: 10)
                .stroke(.indigo)
                .scaleEffect(scale)
                .opacity(2 - scale)
                .animation(
                    .easeIn(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: scale)
        )
        //.blur(radius: (scale - 1) * 2)
        //.animation(.interpolatingSpring(stiffness: 50, damping: 2), value: scale)
        .onAppear{
            scale = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
