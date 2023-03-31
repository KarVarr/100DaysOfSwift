//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI

@MainActor class DeleyedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ContentView: View {
   @StateObject private var update = DeleyedUpdater()
    var body: some View {
        VStack{
            Text("second \(update.value)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
