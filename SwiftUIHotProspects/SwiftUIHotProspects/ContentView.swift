//
//  ContentView.swift
//  SwiftUIHotProspects
//
//  Created by Karen Vardanian on 31.03.2023.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            TextField("Name", text: $user.name)
        }
    }
}

struct DisplayName: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject var user = User()
    @State private var selectedName = "Edit"
    
    var body: some View {
        TabView(selection: $selectedName) {
                Text("Display name")
                    .onTapGesture {
                        selectedName = "Name"
                    }
                    .tabItem {
                        Label("Edit", systemImage: "paperplane.fill")
                    }
                    .tag("Edit")
                    .background(.gray)
              
            .edgesIgnoringSafeArea(.top)
            
                Text("Return main display")
                    .onTapGesture {
                        selectedName = "Edit"
                    }
                    .tabItem {
                        Label("Name", systemImage: "paperplane")
                    }
                    .tag("Name")
                    .background(.mint)
               
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
