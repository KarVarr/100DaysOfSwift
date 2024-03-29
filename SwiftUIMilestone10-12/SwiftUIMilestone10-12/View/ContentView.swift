//
//  ContentView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    
    @StateObject var dataModel = DataModel()
    @State var colors: [Color] = [.yellow, .red, .green, .pink, .indigo, .teal, .mint, .orange, .blue, .purple]

    
    private var adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                VStack {
                    List {
                        ForEach(users, id: \.id) { user in
                            Text("hello :\(user.unwrappedNameUser)")
                        }
                    }
                }
                
                Text("Total users: \(dataModel.userData.count)")
                    .font(.system(size: 22,weight: .light, design: .monospaced))
                
                LazyVGrid(columns: adaptiveColumns ,spacing: 30) {
                    ForEach(dataModel.userData, id: \.id) { item in
                        NavigationLink(destination: DetailView(user: item, friends: FriendsModel(id: "3", name: "3"))) {
                            VStack(alignment: .leading) {
                                Text("\(item.name)")
                                    .font(.system(size: 26, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Age \(item.age)")
                                    .font(.system(size: 20, weight: .light, design: .serif))
                                    .foregroundColor(.black)
                                HStack{
                                    Text("User is ")
                                        .foregroundColor(.black.opacity(0.7))
                                    Text("\(item.isActive ? "Online" : "Offline" )")
                                        .foregroundColor(item.isActive ? .green : .red)
                                        .font(.headline)
                                    
                                }
                                .padding(4)
                                .background(.black.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            .padding(.all, 15)
                            .frame(width: 170, height: 170, alignment: .topLeading)
                            .background(colors.randomElement())
                            
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                        
                    }
                }
                .task {
                    await dataModel.loadData()
                }
            }
            .background(.yellow.opacity(0.2))
            .navigationTitle("Friends 🤓")
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
