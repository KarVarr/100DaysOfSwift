//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SamplePackage
import SwiftUI


struct ContentView: View {
    let random = Array(1...60)
    var body: some View {
        VStack {
            Text(result)
        }
    }
    var result: String {
        let selected = random.random(8).sorted()
        let strings = selected.map{String($0)}
        return strings.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
