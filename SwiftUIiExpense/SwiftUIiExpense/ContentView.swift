//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI


struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    
    var body: some View {
        VStack {
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
                    
            }
            
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
