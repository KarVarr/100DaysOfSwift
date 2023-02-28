//
//  ContentView.swift
//  SwiftUIDrawing
//
//  Created by Karen Vardanian on 28.02.2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}


struct ContentView: View {
    
    var body: some View {
        VStack {
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.indigo, lineWidth: 40)
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(Double(180)), clockwise: true)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(.red)
                .padding()
                .frame(width: 50, height: 50)
            
            
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .fill(.mint)
            
                .frame(width: 250, height: 250)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
