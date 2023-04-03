//
//  ContentView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 03.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmountScale = 0.0
    @State private var finalAmountScale = 1.0
    
    var body: some View {
        Text("Hello world!")
            .scaleEffect(finalAmountScale + currentAmountScale)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmountScale = amount - 1
                    }
                    .onEnded { amount in
                        finalAmountScale += currentAmountScale
                        currentAmountScale = 0
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
