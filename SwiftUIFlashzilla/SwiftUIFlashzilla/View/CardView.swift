//
//  CardView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 07.04.2023.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.orange)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
            }
        }
        .shadow(color: .black.opacity(0.4),radius: 1, x: 10, y: -10)
        .frame(width: 300, height: 250)
        .multilineTextAlignment(.center)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
