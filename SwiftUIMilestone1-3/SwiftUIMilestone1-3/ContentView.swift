//
//  ContentView.swift
//  SwiftUIMilestone1-3
//
//  Created by Karen Vardanian on 17.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pickRandom = "Paper"
    @State private var userAnswer = "Rock"
    @State private var winOrLose = "Win"
    
    @State private var userScore = 0
    let itemsForPick = ["Rock","Paper", "Scissors"]
    let itemsForWinOrLoose = ["Win", "Lose"]
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors")
                .font(.largeTitle)
            VStack (spacing: 30){
                Text("AI move!")
                Picker("Pick the peace", selection: $pickRandom) {
                    ForEach(itemsForPick, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Picker("Win Or Lose", selection: $winOrLose) {
                    ForEach(itemsForWinOrLoose, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
            }
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10 ))
            .padding(.top, 10.0)
            .padding(.horizontal)
            Spacer()
            
            
            VStack {
                Text("Tap your move!")
                Picker("User Answer", selection: $userAnswer) {
                    ForEach(itemsForPick, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Button("Press") {
                    buttonActionPress()
                }
                .frame(width: 150)
                .padding()
                .background(.cyan)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                Text("Your Score is : \(userScore)")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
            }
            .padding(.top, 50)
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            Spacer()
        }
    }
    
    func buttonActionPress () {
        if pickRandom == "Rock" && userAnswer == "Paper" && winOrLose == "Win" ||
            pickRandom == "Paper" && userAnswer == "Scissors" && winOrLose == "Win" ||
            pickRandom == "Scissors" && userAnswer == "Rock" && winOrLose == "Win" ||
            pickRandom == "Rock" && userAnswer == "Scissors" && winOrLose == "Lose" ||
            pickRandom == "Paper" && userAnswer == "Rock" && winOrLose == "Lose" ||
            pickRandom == "Scissors" && userAnswer == "Paper" && winOrLose == "Lose"
        {
            userScore += 1
            pickRandom = itemsForPick.randomElement()!
            winOrLose = itemsForWinOrLoose.randomElement()!
            
        } else {
            userScore -= 1
            pickRandom = itemsForPick.randomElement()!
            winOrLose = itemsForWinOrLoose.randomElement()!
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
