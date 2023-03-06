//
//  AddressView.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: ClassOrder
    var body: some View {
        List {
            Section {
                TextField("Name", text: $order.structOrder.name)
                TextField("Street Address", text: $order.structOrder.streetAddress)
                TextField("City", text: $order.structOrder.city)
                TextField("Zip", text: $order.structOrder.zip)
                    .keyboardType(.numberPad)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.structOrder.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: ClassOrder(structOrder: Order()))
        }
    }
}
