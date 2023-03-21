//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI




struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            
            List {
                //Challenge 3
                Section(header: Text("Business Expenses").foregroundColor(.black)) {
                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name.capitalized)
                                    .font(.headline)
                                Text(item.type)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                //Challenge 1
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                //Challenge 2
                                    .foregroundColor(item.amount <= 10 ? . green : item.amount <= 100 ? .orange : .red)
                            }
                        }
                        //Challenge Accessibility 2
                        .accessibilityElement()
                        .accessibilityLabel("Name \(item.name) and value \(item.amount)")
                        .accessibilityHint(String(item.type))
                        
                    }
                    .onDelete(perform: removeItem)
                    .listRowBackground(Color.black)
                    
                }
                
                //Challenge 3
                Section(header: Text("Personal Expenses").foregroundColor(.black)) {
                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name.capitalized)
                                    .font(.headline)
                                Text(item.type)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack {
                                //Challenge 1
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                //Challenge 2
                                    .foregroundColor(item.amount <= 10 ? . green : item.amount <= 100 ? .orange : .red)
                            }
                        }
                        
                    }
                    .onDelete(perform: removeItem)
                    .listRowBackground(Color.black)
                }
                
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            }
            .toolbar {
                EditButton()
            }
            
        }
        .foregroundColor(Color.blue)
        .scrollContentBackground(.hidden)
        
    }
    
    
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
