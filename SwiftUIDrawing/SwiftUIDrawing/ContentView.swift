//
//  ContentView.swift
//  SwiftUIDrawing
//
//  Created by Karen Vardanian on 28.02.2023.
//

import SwiftUI




struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
         Text("HEllo")
                Capsule()
                .strokeBorder(ImagePaint(image: Image("US"), scale: 0.3), lineWidth: 10)
                .frame(width: 200, height: 200)


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
