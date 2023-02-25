//
//  ContentView.swift
//  SwiftUIiExpense
//
//  Created by Karen Vardanian on 25.02.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row at \($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                Button ("Add Rows"){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .padding()
//            .navigationTitle("Title")
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRow(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
