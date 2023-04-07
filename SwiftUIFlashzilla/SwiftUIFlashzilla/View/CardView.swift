//
//  CardView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 07.04.2023.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var isShowingAnswer = false
    
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(.yellow)
                .shadow(color: .gray.opacity(0.4),radius: 5, x: 10, y: 10)
            
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                    
            }
            .padding(.top, 20)
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: .infinity, height: 450)
        .padding(.horizontal, 20)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
