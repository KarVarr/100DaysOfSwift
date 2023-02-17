//
//  ContentView.swift
//  SwiftUIMilestone1-3
//
//  Created by Karen Vardanian on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pickRandom = "Paper"
    @State private var winOrLose = "Win"
    let itemsForPick = ["Rock","Paper", "Scissors"]
    let itemsForWinOrLoose = ["Win", "Lose"]
    
    var body: some View {
        VStack {
            VStack (spacing: 30){
                Picker("Pick the peace", selection: $pickRandom) {
                    ForEach(itemsForPick, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Picker("Win Or Lose", selection: $winOrLose) {
                    ForEach(itemsForWinOrLoose, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
            }
            
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10 ))
            .padding(.horizontal)
            
            VStack {
                Text("heel")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
