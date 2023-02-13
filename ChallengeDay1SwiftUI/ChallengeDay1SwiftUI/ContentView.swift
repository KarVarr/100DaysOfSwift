//
//  ContentView.swift
//  ChallengeDay1SwiftUI
//
//  Created by Karen Vardanian on 13.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var temp = "Celsius"
    @State private var numberOfTemp = 10.0
    
    let temperatures = ["Celsius", "Fahrenheit"]
    
    var temperature: Double {
        var currentTemp = 0.0
        if temp == "Celsius" {
            currentTemp = (numberOfTemp * 1.8) + 32.0
        }
        if temp == "Fahrenheit" {
            currentTemp = (numberOfTemp - 32.0) * 0.5556
        }
        
        return currentTemp
    }
     
    @State private var result = 0.0
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Temperature", selection: $temp) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                        
                  
                } header: {
                    Text("Fahrenheit or Celsius")
                }
                
                Section {
                    TextField("Enter celsius", value: $numberOfTemp, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Enter temperature")
                }
                
                Section {
                    Text("\(temperature, specifier: "%.1f" )")
                } header: {
                    Text("Result")
                        
                }
                
              
            }
            .navigationTitle("Temperature conversion")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
