//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var colors = Color.red
    var body: some View {
        VStack {
            Text("HEy mother fucker")
                .padding()
                .background(colors)
            Text("Change color")
                .padding()
                .background(.mint)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .contextMenu {
                    Button(role: .destructive) {
                        colors = . mint
                    } label: {
                        Label("Mint", systemImage: "circle")
                    }
                    
                    Button {
                        colors = .blue
                    } label: {
                        Label("Blue", systemImage: "star")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
