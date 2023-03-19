//
//  ContentView.swift
//  SwiftUIBucketList
//
//  Created by Karen Vardanian on 19.03.2023.
//

import SwiftUI

struct Users: Identifiable, Comparable {
    static func < (lhs: Users, rhs: Users) -> Bool {
        lhs.firstName < rhs.firstName
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    
    let users = [
       Users(firstName: "Colin", lastName: "Farel"),
       Users(firstName: "Monika", lastName: "Beluchi"),
       Users(firstName: "Bob", lastName: "Marley"),
    ].sorted(by: <)
    
    var body: some View {
        List(users) {user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
