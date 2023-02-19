//
//  ContentView.swift
//  SwiftUIBetterRest
//
//  Created by Karen Vardanian on 19.02.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var count = 8.0
    @State private var dateAndTime = Date.now
    var body: some View {
        VStack {
            Stepper(String(format: "%.1f" ,count), value: $count, in: 4...12, step: 0.5)
                .labelsHidden()
            DatePicker("Choose you BD", selection: $dateAndTime, in: ...Date.now, displayedComponents: .date)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
