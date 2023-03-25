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
                if users.isEmpty {
                    Section {
                        Image("handPoint")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(.degrees(-15))
                        Text(Resources.String.ContentView.newFriend)
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Resources.AppColor.main)
                } else {
                    ForEach(users, id: \.id) { user in
                        let imageConvert = Image(uiImage: UIImage(data: user.userPhoto ?? Data()) ?? UIImage(systemName: "questionmark.square")!)
                        
                        NavigationLink(destination: UserDetailView(name: user.name ?? Resources.String.ContentView.unknown, image: imageConvert)) {
                            Image(uiImage: UIImage(data: user.userPhoto ?? Data() ) ?? UIImage())
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100,height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing)
                            Text(user.name ?? Resources.String.ContentView.unknown)
                            
                        }
                    }
                    .onDelete(perform: deleteUsers)
                    .listRowBackground(Resources.AppColor.secondary)
                }
            }
                    .listStyle(.plain)
                    .background(Resources.AppColor.main)
                    .navigationTitle(Resources.String.ContentView.mainTitle)
                
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
                        if !users.isEmpty {
                            ToolbarItem(placement: .navigationBarLeading) {
                                EditButton()
                            }
                        }
                    }
            
            
            
            
        }
        .preferredColorScheme(.light)
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
