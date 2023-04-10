//
//  WelcomeView.swift
//  SwiftUISnowSeeker
//
//  Created by Karen Vardanian on 10.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
                   Text("Welcome to SnowSeeker!")
                       .font(.largeTitle)

                   Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
                       .foregroundColor(.secondary)
               }
        .padding()
        .multilineTextAlignment(.center)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
