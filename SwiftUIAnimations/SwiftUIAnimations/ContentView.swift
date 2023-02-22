//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Karen Vardanian on 21.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.black, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 8 , x: 4, y: 4)
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{dragAmount = $0.translation}
                
                    .onEnded{_ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
