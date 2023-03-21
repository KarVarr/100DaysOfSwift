//
//  ContentView.swift
//  SwiftUIAccessebilitySandbox
//
//  Created by Karen Vardanian on 21.03.2023.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    var body: some View {
        ZStack {
            Image(decorative: pictures[2])
                .resizable()
                .scaledToFill()
                .blur(radius: 20)
                .accessibilityHidden(true)
                .ignoresSafeArea()
            VStack {
                Image(pictures[selectedPicture])
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        selectedPicture = Int.random(in: 0...3)
                    }
                    .accessibilityLabel(labels[selectedPicture])
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRemoveTraits(.isImage)
                Text("\(pictures[selectedPicture])")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
