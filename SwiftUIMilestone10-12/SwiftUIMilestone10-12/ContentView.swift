//
//  ContentView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataModel = DataModel()
    @State var colors: [Color] = [.yellow, .red, .green, .pink, .indigo, .teal, .mint, .orange, .blue, .purple]
    
    private var adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns ,spacing: 30) {
                    ForEach(dataModel.userData, id: \.id) { item in
                        NavigationLink(destination: DetailView()) {
                            VStack(alignment: .leading) {
                                Text("\(item.name)")
                                    .font(.system(size: 30, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Age \(item.age)")
                                    .font(.system(size: 38, weight: .light, design: .serif))
                                    .foregroundColor(.black)
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
            .navigationTitle("Friends 😛")
        }
    }
    
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
