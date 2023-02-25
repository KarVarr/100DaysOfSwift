//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var count = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        VStack {
            Button("You tapped \(count) times") {
                count += 1
                UserDefaults.standard.set(count, forKey: "Tap")
            }
        }
    }
      
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
