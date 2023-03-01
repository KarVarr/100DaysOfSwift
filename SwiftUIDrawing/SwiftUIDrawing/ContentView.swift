//
//  ContentView.swift
//  SwiftUIDrawing
//
//  Created by Karen Vardanian on 28.02.2023.
//

import SwiftUI

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


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 350))
        path.addLine(to: CGPoint(x: 300, y: 350))
        path.addLine(to: CGPoint(x: 300, y: 350))
        path.addLine(to: CGPoint(x: 150, y: 100))
        return path
    }
}

struct ContentView: View {
    @State private var insertAmount = 50.0
    
    var body: some View {
        VStack {
            Triangle()
                .frame(width: 300, height: 300)
                
            Rectangle()
                .frame(width: 100, height: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
