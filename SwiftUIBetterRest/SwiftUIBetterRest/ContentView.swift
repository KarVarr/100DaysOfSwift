//
//  ContentView.swift
//  SwiftUIBetterRest
//
//  Created by Karen Vardanian on 19.02.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var count = 8.0
    var body: some View {
        Stepper(String(format: "%.1f" ,count), value: $count, in: 4...12, step: 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
