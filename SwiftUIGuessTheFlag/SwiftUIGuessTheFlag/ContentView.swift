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
//            LinearGradient(gradient: Gradient(colors: [ .cyan, .green, .black, .orange, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
            RadialGradient(stops:[
                .init(color: .mint, location: 0.1),
                .init(color: Color(red: 0, green: 0, blue: 0, opacity: 0.98), location: 0.7),
                .init(color: .pink, location: 0.7)
            ],
                           center: .top, startRadius: 500, endRadius: 150)
            .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .padding(.top, 10)
                    .foregroundColor(.yellow)
                VStack (spacing: 30){
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
                                .aspectRatio(contentMode: .fill)
                            //.renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 2, x: 0, y: 5)
                                .scaledToFill()
                        }
                    }
                    Spacer()
                }
                .padding(.top, 40)
                ZStack {
                    
                    Spacer()
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                    Text("Score: \(score)")
                        .padding(10)
                        .foregroundStyle(.black)
                }
                
            }
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
