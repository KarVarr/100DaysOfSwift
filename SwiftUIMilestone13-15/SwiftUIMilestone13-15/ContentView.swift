//
//  ContentView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingPhotoView = false
    
    @State private var list = [
        "user1", "user2", "user3", "user4", "user5"
    ]

    
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.self) { user in
                    NavigationLink("Detail View") {
                        UserDetailView()
                    }
                }
            }
            .navigationTitle("MeetUP")
            .navigationViewStyle(.stack)
            .toolbar {
                Button {
                    showingPhotoView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingPhotoView) {
                    AddUserImage()
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
