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
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(name: user.name ?? "Unknown", image: Image(uiImage: UIImage(data: user.userPhoto ?? Data()) ?? UIImage(systemName: "questionmark.square")!))) {
                        Image(systemName: "questionmark.square")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100,height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.trailing)
                        Text(user.name ?? "Unknown")
                        
                    }
                }
                .onDelete(perform: deleteUsers)
                .listRowBackground(Color.orange.opacity(0.8))
            }
            .listStyle(.plain)
            .background(.orange.opacity(0.7))
            .navigationTitle("MeetUP")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        showingPhotoView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingPhotoView) {
                        AddUserImage()
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            
            
        }
        
    }
    
    
    func deleteUsers(at offsets: IndexSet) {
        for offset in offsets {
            let user = users[offset]
            moc.delete(user)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
