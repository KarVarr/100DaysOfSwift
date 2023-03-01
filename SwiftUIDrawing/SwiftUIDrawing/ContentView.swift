//
//  ContentView.swift
//  SwiftUIDrawing
//
//  Created by Karen Vardanian on 28.02.2023.
//

import SwiftUI

struct Triangle: Shape {
    var insertAmount: Double
    var animatableData: Double {
        get {insertAmount}
        set {insertAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
    
    
}

struct ContentView: View {
    @State private var insertAmount = 50.0
    
    var body: some View {
            Triangle(insertAmount: insertAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    insertAmount = Double.random(in: 10...90)
                }
            }
       
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
