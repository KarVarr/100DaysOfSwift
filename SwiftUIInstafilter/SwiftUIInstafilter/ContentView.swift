//
//  ContentView.swift
//  SwiftUIInstafilter
//
//  Created by Karen Vardanian on 17.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .frame(width: 300, height: 300)
                .background(backgroundColor)
                .onTapGesture {
                    showingConfirmation = true
                }
                .confirmationDialog("Change color", isPresented: $showingConfirmation) {
                    Button("Red") {backgroundColor = .red}
                    Button("Green") {backgroundColor = .green}
                    Button("Mint") {backgroundColor = .mint}
                    Button("Cancel", role: .cancel){}
                } message: {
                    Text("Change text color")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
