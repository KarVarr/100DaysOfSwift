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
        VStack {
            HStack {
                Text("Your score: \(scoreUser)")
                Text("AI score: \(scoreAI)")
            }
            
            Text("Win :  \(scoreUser > scoreAI ? "USER" : "AI") !")
            
            Spacer()
            
            ZStack {
                dice5
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
    }
    
    func rollDice() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
