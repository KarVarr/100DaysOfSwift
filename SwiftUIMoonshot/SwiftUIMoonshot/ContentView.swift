//
//  ContentView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
