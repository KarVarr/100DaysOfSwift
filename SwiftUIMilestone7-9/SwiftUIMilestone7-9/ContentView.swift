//
//  ContentView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddHabitsView = false
    @ObservedObject var habitsArray = Habits()
    
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                VStack {
                    List {
                        ForEach(habitsArray.activities) { index in
                            NavigationLink(destination: DetailView()) {
                                VStack (alignment: .leading) {
                                    Text(index.title.capitalized)
                                    Text(index.description)
                                        .foregroundColor(.gray)
                                    Text("Completed \(0) times")
                                }
                            }
                        }
                        .listRowBackground(Color(red: 1.00, green: 0.92, blue: 0.64))
                    }
                    .listStyle(.plain)
                    .background(Color(red: 1.00, green: 0.92, blue: 0.64))
                    
                    Image("girls")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: geometry.size.width)
                }
            }
            .foregroundColor(.black)
            .background(Color(red: 1.00, green: 0.92, blue: 0.64))
            .navigationTitle("Habits")
            
            .toolbar {
                Button {
                    showingAddHabitsView = true 
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddHabitsView) {
                    HabitsView(habitsArray: habitsArray)
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
