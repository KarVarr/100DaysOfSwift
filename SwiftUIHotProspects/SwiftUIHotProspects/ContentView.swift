//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI



struct ContentView: View {
  
    var body: some View {
        Image("images")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.mint)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
