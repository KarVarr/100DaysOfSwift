//
//  ContentView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<109) { row in
                NavigationLink {
                    Text("detail \(row)")
                } label: {
                    Text("Label button \(row)")
                }
                
                .navigationTitle("SwiftUI NV")
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
