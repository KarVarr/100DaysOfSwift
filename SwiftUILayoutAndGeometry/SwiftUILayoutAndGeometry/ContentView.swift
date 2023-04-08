//
//  ContentView.swift
//  SwiftUILayoutAndGeometry
//
//  Created by Karen Vardanian on 08.04.2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    let totalHueRange: CGFloat = 0.8
        let saturation: CGFloat = 0.7
        let brightness: CGFloat = 0.9
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        let hue = Double(geo.frame(in: .global).minY / fullView.size.height) * Double(self.totalHueRange)
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
                        //Challenge 3
                            .background(Color(hue: hue, saturation: self.saturation, brightness: self.brightness))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        //Challenge 1
                            .opacity(max(0, 2 - Double(geo.frame(in: .global).minY - 300) / -80))
                        //Challenge 2
                            .scaleEffect(max(0.2, 1.6 - Double(geo.frame(in: .global).minY) / Double(fullView.size.height)))
                            
                    }
                    .frame(height: 40)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
