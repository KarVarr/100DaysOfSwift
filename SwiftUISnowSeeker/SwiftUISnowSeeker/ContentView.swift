//
//  ContentView.swift
//  SwiftUISnowSeeker
//
//  Created by Karen Vardanian on 10.04.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var searchText = ""
    let names = ["Jacny", "Bob", "Jack", "Anna", "Diana", "DonDon", "Gone", "Hello", "Some name", "FWT", "Rat","Jacny", "Bob", "Jack", "Anna", "Diana", "DonDon", "Gone", "Hello", "Some name", "FWT", "Rat","Jacny", "Bob", "Jack", "Anna", "Diana", "DonDon", "Gone", "Hello", "Some name", "FWT", "Rat","Jacny", "Bob", "Jack", "Anna", "Diana", "DonDon", "Gone", "Hello", "Some name", "FWT", "Rat","Jacny", "Bob", "Jack", "Anna", "Diana", "DonDon", "Gone", "Hello", "Some name", "FWT", "Rat", ]
    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .automatic))
            .navigationTitle("hello")
        }
    }
    var filteredNames: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter{ $0.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
