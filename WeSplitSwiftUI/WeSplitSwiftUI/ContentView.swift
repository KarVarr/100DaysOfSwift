//
//  ContentView.swift
//  WeSplitSwiftUI
//
//  Created by Karen Vardanian on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        Text("Count \(tapCount)")
        Button("plus") {
            if tapCount < 0 {
                tapCount = 0
            } else {
                tapCount += 1
            }
        }
        Button("minus") {
            if tapCount <= 0 {
                tapCount = 0
            } else {
                tapCount -= 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
