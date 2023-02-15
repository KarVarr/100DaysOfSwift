//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Karen Vardanian on 14.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia",
                                    "France",
                                    "Germany",
                                    "Ireland",
                                    "Italy",
                                    "Nigeria",
                                    "Poland",
                                    "Russia",
                                    "Spain",
                                    "UK",
                                    "US" ].shuffled()
    @State private var showingScore = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var score = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [ .cyan, .green,  .black, .orange, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack (spacing: 20){
                
                VStack {
                    Text("Tap the flag of")
                        .font(.subheadline.monospaced().weight(.bold))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.monospaced().weight(.light))
                    
                }
                .foregroundColor(.black)
                
                Spacer()
                ForEach(0..<3) {number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        //.renderingMode(.original)
                            .clipShape(Circle())
                            .shadow(color: .black, radius: 2, x: 5, y: 5)
                            .scaledToFill()
                        
                        
                    }
                }
                
                Spacer()
                
            }
            .padding(.top, 30)
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!"
            score -= 1
        }
        showingScore = true
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
