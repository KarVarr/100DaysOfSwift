//
//  ContentView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<UserData>
    
    
    @Environment(\.dismiss) var dismiss
    @State private var showingPhotoView = false
    
    @State private var list = [
        "user1", "user2", "user3", "user4", "user5"
    ]

    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView()) {
                        Image(systemName: "questionmark.square")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100,height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing)
                        Text(user as! DateInterval)
                        
                    }
                }
                .listRowBackground(Color.orange.opacity(0.8))
            }
            .listStyle(.plain)
            .background(.orange.opacity(0.7))
            .navigationTitle("MeetUP")
            
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
