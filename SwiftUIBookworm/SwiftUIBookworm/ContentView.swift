//
//  ContentView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColor = [Color.indigo, Color.mint]
    var offColor = [Color.green, Color.black]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColor : offColor, startPoint: .bottomLeading, endPoint: .topTrailing))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 5 : 1)
    }
}


struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
