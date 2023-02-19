//
//  ContentView.swift
//  SwiftUIBetterRest
//
//  Created by Karen Vardanian on 19.02.2023.
//
import CoreML
import SwiftUI


struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    
    var body: some View {
        NavigationView {
            VStack (spacing: 30){
              Text("When do you want to wake up?")
                DatePicker("Please enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .background(.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("Desired amount of sleep")
                Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12)
                
                Text("Daily coffee intake")
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
            }
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .foregroundColor(.white)
            .font(.headline)
            
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                 Text(alertMessage)
            }
        }
        
        
    }
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
