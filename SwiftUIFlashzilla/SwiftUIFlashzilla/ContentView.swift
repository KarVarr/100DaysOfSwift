//
//  ContentView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 03.04.2023.
//
import CoreHaptics
import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    var text = "Hello main screen"
    
    var body: some View {
        Text(text)
            .onChange(of: scenePhase) { newValue in
                if newValue == .active {
                    print("Active")
                } else if newValue == .inactive {
                    print("Inactive")
                } else if newValue == .background {
                    print("Background")
                    
                }
            }
      }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
