//
//  ContentView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    private var arr = ["a", "b", "c", "d", "e", "f", "g"]
    
    private var adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns ,spacing: 30) {
                    ForEach(arr, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text("name \(item)")
                            Text("email \(item)")
                        }
                        .frame(minWidth: 170, maxWidth: 170, minHeight: 170, maxHeight: 170)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
            }
            .navigationTitle("Friends 😛")
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
