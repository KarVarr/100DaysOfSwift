//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Karen Vardanian on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("delete") {}
                .buttonStyle(.automatic)
                .tint(.cyan)
            Button("delete") {}
                .tint(.brown)
                .buttonStyle(.bordered)
            Button {
                print("hello")
                    
            } label: {
                Text("tap tap")
                    .padding(10)
                    
                    .foregroundColor(.red)
                    .background(.black)
            }
        }
        
        
    }
    
    func deleteAction () {
        print("dele")
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
