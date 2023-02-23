//
//  ContentView.swift
//  SwiftUIMilestone4-6
//
//  Created by Karen Vardanian on 23.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplicationTable = 1
    @State private var questions = 5
    
    @State private var questionsArray = [5,10,20]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Stepper("Choose a multiplication number: \(multiplicationTable)", value: $multiplicationTable, in: 1...9)
                    }
                    Section {
                        Picker("How many questions?", selection: $questions) {
                            ForEach (questionsArray, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                }
                
                
                
            }
            //MARK: - NavigationTitle
            .navigationTitle("Multiplication")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
