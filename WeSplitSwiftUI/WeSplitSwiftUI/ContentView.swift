//
//  ContentView.swift
//  WeSplitSwiftUI
//
//  Created by Karen Vardanian on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.identifier ))
                            .keyboardType(.decimalPad)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(0..<100) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.navigationLink)
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.identifier ))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
