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
                        NavigationLink(destination: DetailView()) {
                            VStack(alignment: .leading) {
                                Text("name \(item)")
                                    .font(.system(size: 30, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("email \(item)")
                                    .font(.system(size: 24, weight: .light, design: .serif))
                                    .foregroundColor(.gray)
                            }
                            .border(.black)
                            .frame(minWidth: 170, minHeight: 170, alignment: .topLeading)
                            .background(.mint)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
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
