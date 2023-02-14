//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Karen Vardanian on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        LinearGradient(gradient: Gradient(colors: [.red,.teal]), startPoint: .leading, endPoint: .bottom)
        //            .ignoresSafeArea()
        //    }
        //        LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .indigo, location: 0.3), Gradient.Stop(color: .cyan, location: 0.3)]), startPoint: .trailing, endPoint: .top)
        //            .ignoresSafeArea()
//        VStack(spacing: 0) {
//            RadialGradient(gradient: Gradient(colors: [.indigo, .pink]), center: .bottomLeading, startRadius: 200, endRadius: 201)
//            RadialGradient(gradient: Gradient(colors: [.black, .green]), center: .topTrailing, startRadius: 200, endRadius: 201)
//
//        }
        AngularGradient(colors: [.red, .black, .pink, .blue, .yellow,], center: .top)
        .ignoresSafeArea()
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
