//
//  ContentView.swift
//  SwiftUIWordScramble
//
//  Created by Karen Vardanian on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List (0..<5){
            Text("hello me \($0)")
        }
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
