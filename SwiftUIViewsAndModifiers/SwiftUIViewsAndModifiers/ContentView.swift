//
//  ContentView.swift
//  SwiftUIViewsAndModifiers
//
//  Created by Karen Vardanian on 16.02.2023.
//

import SwiftUI

struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
            .frame(width: 250, height: 80)
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 5, x: 4, y: 4)
    }
}

extension View {
    func largeTitle() -> some View {
        modifier(Title())
    }
}



struct ContentView: View {
    var body: some View {
        VStack {
           Text("heheheheh")
                .largeTitle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
