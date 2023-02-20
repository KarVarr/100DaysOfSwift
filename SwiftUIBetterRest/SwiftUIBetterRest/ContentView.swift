//
//  ContentView.swift
//  SwiftUIBetterRest
//
//  Created by Karen Vardanian on 19.02.2023.
//
import CoreML
import SwiftUI


struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    //Challenge 2
    @State private var itemsForCoffeeAmount = (1...20)
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    var body: some View {
        
        NavigationView {
            //Challenge 1
            VStack {
                
                
                Form {
                    Section {
                        Text("When do you want to wake up?")
                        DatePicker("Please enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .background(.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
                    .padding()
                    
                    Section {
                        Text("Desired amount of sleep")
                        Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
                    .padding()
                    
                    Section {
                        Text("Daily coffee intake")
                        //Challenge 2
                        Picker("Number of cups", selection: $coffeeAmount) {
                            ForEach(itemsForCoffeeAmount, id: \.self) {
                                Text($0 == 1 ? "1 cup" : "\($0) cups")
                            }
                        }
                        //Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
                    .padding()
                }
                
                .scrollContentBackground(.hidden)
                .background(.mint)
                .font(.headline)
                .navigationTitle("Better Rest")
                //.toolbar {
                //    Button("Calculate", action: calculateBedtime)
                // }
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") {}
                } message: {
                    Text(alertMessage)
                }
                Text("Recommended bedtime: ")
                Text("\(alertMessage)")
                    .foregroundColor(.brown)
            }
         
            
        }
        
        
    }
    func calculateBedtime() -> String {
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
        return alertMessage
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
