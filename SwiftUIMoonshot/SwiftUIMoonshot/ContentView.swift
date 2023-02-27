//
//  ContentView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 20) {
                ForEach(0..<100) {
                    Text("Hello \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
