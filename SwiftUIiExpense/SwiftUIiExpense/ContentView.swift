//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI


struct ContentView: View {

    @AppStorage("count") private var count = 0
    
    var body: some View {
        VStack {
            Button("You tapped \(count) times") {

                count += 1
            }
        }
    }
      
    
       
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
