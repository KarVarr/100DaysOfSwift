//
//  ContentView.swift
//  SwiftUIGuessTheFlag
//
//  Created by Karen Vardanian on 14.02.2023.
//

import SwiftUI
// Challenge ViewsAndModifiers
struct FlagImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 2, x: 0, y: 5)
            .scaledToFill()
            
    }
}

extension View {
    func flagImage() -> some View {
        modifier(FlagImage())
    }
}

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
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var showingScore = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    
    //Challenge 1
    @State private var score = 0
    
    //Challenge 3
    @State private var lastAnswer = 0
    @State private var showingAnswer = false
    
    //Challenge animation
    @State private var rotating = 0.0
    @State private var scale = 1.0
    @State private var opacityAmount = 1.0
    @State private var selectedButtonIndex: Int?
    
    var body: some View {
        ZStack {
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
                            //Challenge animation
                            selectedButtonIndex = number
                            withAnimation {
                                rotating += 360
                                scale -= 0.1
                                opacityAmount -= 0.75
                            }
                        } label: {
                            Image(countries[number])
                            // Challenge ViewsAndModifiers
                                .flagImage()
                            //Challenge 1 animation
                                .rotation3DEffect(.degrees(selectedButtonIndex == number ? rotating : 0.0), axis: (x: 0, y: 1, z: 0))
                            //Challenge 2 animation
                                .opacity(selectedButtonIndex == number ? 1.0 : opacityAmount)
                            //Challenge 3 animation
                                .scaleEffect(selectedButtonIndex == number ? 1.0 : scale)
                                .accessibilityLabel(labels[countries[number]] ?? "Unknown flag")
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
        .alert("The last question", isPresented: $showingAnswer) {
            Button("Ok", action: lastAttempt)
        } message: {
            Text("Your final score is \(score)")
        }
        
        
    }
    //MARK: - Function
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            //Challenge 2
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }
        lastAnswer += 1
        showingScore = true
        opacityAmount = 1.0
        if lastAnswer == 8 {
            showingAnswer = true
        }
    }
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        //Challenge animation
        opacityAmount = 1.0
        scale = 1.0
    }
    //Challenge 3
    func lastAttempt() {
        score = 0
        lastAnswer = 0
    }
    
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
