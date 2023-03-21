//
//  ContentView.swift
//  SwiftUIMoonshot
//
//  Created by Karen Vardanian on 27.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingList = false
    @State private var showingModal = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            //Challenge 3
            ScrollView {
                if showingList {
                    ListLayout()
                } else {
                    GridLayout()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    withAnimation {
                        showingList.toggle()
                    }
                } label: {
                    Image(systemName: "list.dash")
                }
            }
            .toolbar {
                Button {
                    showingModal.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingModal) {
                    Text("Modal View")
                        .presentationDetents([.medium])
                }
            }
        }
        .accessibilityLabel("Moonshot")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
