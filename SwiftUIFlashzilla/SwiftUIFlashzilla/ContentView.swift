//
//  ContentView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 03.04.2023.
//
import CoreHaptics
import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5 on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text("Hello")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("Time is: \(time)")
                }
                counter += 1
            }
      }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
