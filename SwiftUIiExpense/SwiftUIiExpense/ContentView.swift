//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI

class User: ObservableObject {
   @Published var FName = "Bilbo"
   @Published var LName = "Begins"
}

struct ContentView: View {
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            Text("My name is \(user.FName) \(user.LName)")
            TextField("YOur name", text: $user.FName )
            TextField("YOur name", text: $user.LName )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
