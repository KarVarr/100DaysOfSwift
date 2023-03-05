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
                            NavigationLink(destination: DetailView( activity: Activity(title: index.title, description: index.description))) {
                                VStack (alignment: .leading) {
                                    Text(index.title.capitalized)
                                        .font(.largeTitle)
                                        .foregroundColor(.teal)
                                    Text(index.description)
                                        .foregroundColor(.gray)
                                    Text("Completed \(index.completedTimes) times")
                                        .font(.caption)
                                        .foregroundColor(.brown)
                                }
                            }
                        }
                        .onDelete(perform: removeItem)
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
            .fontDesign(.monospaced)
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    //MARK: - Functions
    func removeItem(at offsets: IndexSet) {
        habitsArray.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
