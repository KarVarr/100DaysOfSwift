//
//  ContentView.swift
//  SwiftUIBetterRest
//
//  Created by Karen Vardanian on 19.02.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    
    
    var body: some View {
        NavigationView {
            VStack (spacing: 30){
              Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12)
                Text("Daily coffee intake")
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
            }
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
        
        
    }
    func calculateBedtime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
