//
//  DetailView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct DetailView: View {
    let user: UserModel
    let friends: FriendsModel
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text(user.name)
                        .font(.headline)
                    Text("Age: \(user.age)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("Registered: \(user.formattedRegisteredDate)")
                    ScrollView(.horizontal) {
                        HStack {
                            Text("Tags:")
                            ForEach(user.tags, id: \.self) {tag in
                                Text("#\(tag)")
                                    .padding(10)
                                    .background(.black.opacity(0.5))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                } header: {
                    Text("About user")
                }
                .listRowBackground(Color.mint.opacity(0.2))
                
                Section {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(user.friends, id: \.id) {friend in
                                Text(friend.name)
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding(10)
                                    .background(.pink.opacity(0.7))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                } header: {
                    Text("Friends")
                }
                .listRowBackground(Color.mint.opacity(0.2))
                
                Section {
                    Text("\(user.about)")
                } header:  {
                    Text("Live style")
                }
                .listRowBackground(Color.mint.opacity(0.2))
            }
            .listStyle(.plain)
            .background(.mint.opacity(0.1))
        }
        .navigationTitle("\(user.name) is: \(user.isActive ? "Online" : "Offline")")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(user: UserModel(id: "1", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: "2015-11-10T01:47:18-00:00", tags: ["cillum","consequat","deserunt","nostrud","eiusmod","minim","tempor"], friends: [FriendsModel(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")]), friends: FriendsModel(id: "1", name: "name")
                   
        )
        
    }
}
