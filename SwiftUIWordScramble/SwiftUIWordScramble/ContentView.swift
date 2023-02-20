//
//  ContentView.swift
//  SwiftUIWordScramble
//
//  Created by Karen Vardanian on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(usedWords, id: \.self) {
                        Text ($0)
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit {addNewWords()}
    }
    
    
    func addNewWords() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines )
        guard answer.count > 0 else {return}
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
