//
//  ContentView.swift
//  ChallengeDay1SwiftUI
//
//  Created by Karen Vardanian on 13.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var celsius = 0.0
    @State private var fahrenheit = 0.0
     
    @State private var result = 0.0
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter celsius", value: $celsius, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Celsius")
                }
                
                Section {
                    Text("Kelvin")
                } header: {
                    Text("Fahrenheit")
                }
                
                Section {
                    Text("RESULT")
                } header: {
                    Text("Fahrenheit")
                }
            }
            .navigationTitle("Temperature conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
