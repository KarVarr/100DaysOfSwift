//
//  ContentView.swift
//  SwiftUIDrawing
//
//  Created by Karen Vardanian on 28.02.2023.
//

import SwiftUI
//Challenge 1
struct Rectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

//Challenge 1
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 350))
        path.addLine(to: CGPoint(x: 300, y: 350))
        path.addLine(to: CGPoint(x: 300, y: 350))
        path.addLine(to: CGPoint(x: 150, y: 100))
        path.addLine(to: CGPoint(x: 0, y: 350))
        return path
    }
}

struct ContentView: View {
    @State private var lineThickness = 10.0
    
    var body: some View {
        VStack {
            //Challenge 1
            Triangle()
                .stroke(.mint, style: StrokeStyle(lineWidth: lineThickness , lineCap: .round, lineJoin: .round))
               
            
                .frame(width: 300, height: 300)
            //Challenge 1
            Rectangle()
                .stroke(.mint, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 300)
            //Challenge 2
            Slider(value: $lineThickness, in: 3...10)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
