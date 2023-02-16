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
    
   //Extra Challenge
    var formatCurrency: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code:  "USD" )
    }
   
    
    //Challenge 3
    let tipPercentages = Array(0..<101)
    
    var amountForCheck: Double {
        //Challenge 2
        return  (checkAmount / 100 * Double(tipPercentage)) + checkAmount
    }
    
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
                                formatCurrency)
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
                    //Challenge 3
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                //MARK: - TOTAL
                Section {
                    Text(totalAmount, format: formatCurrency)
                } header: {
                    //Challenge 1
                    Text("Amount per person")
                }
                
                //MARK: - AMOUNT FOR THE CHECK
                //Challenge 2
                Section {
                    // Challenge ViewsAndModifiers
                    checkAmount == 0.0 ? Text("$0.0") : Text(amountForCheck, format: formatCurrency)
                } header: {
                    Text("total amount for the check")
                    // Challenge ViewsAndModifiers
                        .foregroundColor(tipPercentage == 0 ? .red : .teal)
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
