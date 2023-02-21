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
        VStack {
            Spacer()
            Stepper("Choose value", value: $scale.animation(
                .interpolatingSpring(stiffness: 40, damping: 2)
            ), in: 1...10)
            Spacer()
            Button("Tap") {
                scale += 1.0
            }
            .padding(30)
            .background(.mint)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(scale)
//            .overlay {
//                Circle()
//                    .stroke()
//                    .foregroundColor(.red)
//                    .scaleEffect(scale)
//                    .opacity(2 - scale)
//                    .animation(.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                               , value: scale)
//            }
            
        }
//        .onAppear {
//            scale = 2
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
