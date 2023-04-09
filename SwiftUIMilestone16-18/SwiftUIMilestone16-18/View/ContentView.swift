//
//  ContentView.swift
//  SwiftUIMilestone16-18
//
//  Created by Karen Vardanian on 09.04.2023.
//

import SwiftUI

struct ContentView: View {
    let dice1 = DiceWithNumber1()
    let dice2 = DiceWithNumber2()
    let dice3 = DiceWithNumber3()
    let dice4 = DiceWithNumber4()
    let dice5 = DiceWithNumber5()
    let dice6 = DiceWithNumber6()
    
    
    let randomNumber: [Int] = Array(1...6)
    
    @State private var scoreAI = 0
    @State private var scoreUser = 0
    @State private var result = 0
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Your score: \(scoreUser)")
                        .frame(width: 130)
                        .padding()
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .foregroundColor(.white)
                        .font(.title3)
                    Text("AI score: \(scoreAI)")
                        .frame(width: 130)
                        .padding()
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                Text("Win : \(resultOfWin(scoreUser, scoreAI)) !")
                    .frame(width: geo.size.width)
                    .truncationMode(.tail)
                      .shadow(color: .purple, radius: 4, x: 5, y: 5)
                    .padding()
                    .background(.black)
                    .foregroundColor(.purple)
                    .font(.largeTitle)
                    .shadow(radius: 6, x: 0, y: 10)
                
                Spacer()
                
                ZStack {
                    switch result {
                    case 1: dice1
                    case 2: dice2
                    case 3: dice3
                    case 4: dice4
                    case 5: dice5
                    case 6: dice6
                    default:
                        dice5
                    }
                }
                
                Spacer()
                
                Button("Roll the Dice", action: rollDice)
                    .padding()
                    .background(.mint)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .frame(width: geo.size.width)

        }
    }
    
    func rollDice() {
        result = randomNumber.randomElement() ?? 5
        scoreAI = randomNumber.randomElement() ?? 5
        scoreUser = result
    }
    
    func resultOfWin(_ user: Int, _ ai: Int) -> String {
        if user > ai {
            return "USER"
        } else if user == ai {
            return "DRAW"
        }
        return "AI"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
