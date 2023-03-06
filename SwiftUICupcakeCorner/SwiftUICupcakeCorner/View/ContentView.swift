//
//  ContentView.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = ClassOrder(structOrder: Order())
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Select your cake type", selection: $order.structOrder.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.structOrder.quantity)", value: $order.structOrder.quantity, in: 3...20)
                }
                
                Section {
                    
                    Toggle("Any special request?", isOn: $order.structOrder.specialRequestEnabled.animation())
                    if order.structOrder.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.structOrder.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.structOrder.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
