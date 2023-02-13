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
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let people = Double(numberOfPeople + 2)
        let percent = checkAmount / 100 * Double(tipPercentage)
        let sum = percent + checkAmount
        
        return sum / people
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: "USD" ))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.navigationLink)
                       
                }
                
                //MARK: - PERSENT
                Section {
                    Picker("Persent", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                //MARK: - TOTAL
                Section {
                    Text(totalAmount, format: .currency(code: "USD" ))
                } header: {
                    Text("Total sum of each person")
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.indigo)
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard, content: {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                })
            }
            
            
        }
        .foregroundColor(.teal)
        
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
