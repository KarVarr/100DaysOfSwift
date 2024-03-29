//
//  CardView.swift
//  SwiftUIFlashzilla
//
//  Created by Karen Vardanian on 07.04.2023.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    let card: Card
    var removal: (() -> Void)? = nil
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(
                    differentiateWithoutColor
                    ? .yellow
                    : .yellow
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
           
                .background(
                    differentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 40, style: .continuous)
                    //Challenge 2
                        .fill(backgroundColor(offset))
                        
                )
                
                .shadow(color: .black.opacity(0.4),radius: 10)
            
            
            VStack {
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                
            }
            .padding(.top, 20)
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: 450)
        .rotationEffect(.degrees(Double(offset.width / 3)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                    feedback.prepare()
                })
                .onEnded({ _ in
                    if abs(offset.width) > 100 {
                        if offset.width < 0 {
                            feedback.notificationOccurred(.error)
                        }
                        removal?()
                    } else {
                        offset = .zero
                    }
                })
        )
        .padding(.horizontal, 20)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
    
    func backgroundColor(_ offset: CGSize) -> Color {
        if offset.width > 0 {
            return .green
        }
        if offset.width < 0 {
            return .red
        }
        
        return .white
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
