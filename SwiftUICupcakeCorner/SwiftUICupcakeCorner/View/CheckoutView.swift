//
//  CheckoutView.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: ClassOrder
    
    //Challenge 2
    @State private var alertTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                //Challenge Accessibility 1
                .accessibilityElement()
                .accessibilityHidden(true)
                
                Text("Your total is \(self.order.structOrder.cost, format: .currency(code: "USD"))")
                Button {
                    Task {
                        await placeOrder()
                    }
                } label: {
                    Text("Order")
                }
                .padding()
            }
            
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }
    }
    
    
    func  placeOrder () async {
        guard let encoded = try? JSONEncoder().encode(order.structOrder) else {
            print("Failed to encode order")
            
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decoderOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decoderOrder.quantity)x \(Order.types[decoderOrder.type].lowercased()) cupcakes is on its way!"
            alertTitle = "Thank you!"
            showingConfirmation = true
        } catch  {
            //Challenge 2
            alertTitle = "There is no internet!"
            confirmationMessage = "Check your internet connection or call your provider! "
            showingConfirmation = true
            print("Checkout failed")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: ClassOrder(structOrder: Order()))
        }
    }
}
