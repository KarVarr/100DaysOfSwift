//
//  ContentView.swift
//  SwiftUIMilestone4-6
//
//  Created by Karen Vardanian on 23.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplicationTable = 1
    @State private var questions = 5
    @State private var randomNumberForQuestions = Array(0...20)
    @State private var randomNumber = 1
    @State private var userAnswer = ""
    @State private var userResult = 0
    @State private var count = 0
    @State private var isDisabled = true
    @State private var showingResult = false
    @State private var showingResultFalse = false
    
    @State private var questionsArray = [5,10,20]
    @State private var buttons = [1,2,3,4,5,6,7,8,9]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.purple
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        
                        Form {
                            Section {
                                Stepper("\(multiplicationTable)", value: $multiplicationTable, in: 1...9)
                                    .font(.largeTitle)
                                    .foregroundColor(.brown)
                            } header: {
                                Text("Choose a multiplication number: ")
                            }
                            Section {
                                Picker("How many questions?", selection: $questions) {
                                    ForEach (questionsArray, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                                .pickerStyle(.navigationLink)
                                .font(.title2)
                                .foregroundColor(.brown)
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    
                    VStack(alignment: .center) {
                        
                        VStack(alignment: .center) {
                            Text(count == questions  ? "Your result is: \(userResult)" : "What is \(multiplicationTable) * \(randomNumber) ")
                                .padding(20)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.bottom, 20)
                            TextField("Write Your Answer", text: $userAnswer)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
                                .disabled(isDisabled)
                        }
                        .font(.largeTitle)
                        
                        
                        VStack {
                            ForEach(0...2, id: \.self) {i in
                                HStack {
                                    ForEach(1...3, id:\.self) {j in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(.mint)
                                                .frame(width: 110,height: 50)
                                            Button (action: {buttonNumber(text: "\(j + i * 3)") }) {
                                                Text("\(j + i * 3)")
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                            }
                                            .disabled(count == questions ? true : false )
                                            
                                        }
                                    }
                                }
                            }
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.red)
                                        .frame(width: 110,height: 50)
                                    
                                    Button ("Del") {
                                        userAnswer = ""
                                    }
                                    .disabled(count == questions ? true : false )
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.mint)
                                        .frame(width: 110,height: 50)
                                    
                                    Button ("0") {buttonNumber(text: "0")}
                                        .disabled(count == questions ? true : false )
                                    
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.green)
                                        .frame(width: 110,height: 50)
                                    
                                    Button ("Submit") {
                                        buttonSubmit()
                                    }
                                    .disabled(count == questions ? true : false )
                                    
                                    
                                }
                                
                            }
                            .foregroundColor(.white)
                            .font(.title)
                        }
                    }
                }
                
                
                
                
            }
            //MARK: - NavigationTitle
            .navigationTitle("Multiplication")
            .foregroundColor(.yellow)
            .toolbar(content: {
                Text("Result: \(userResult)")
                    .foregroundColor(.white)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Restart", action: {restart()})
                        .foregroundColor(.green)
                }
            }
            
            .alert("Result", isPresented: $showingResult) {
                Button("OK", action: {})
            
            } message: {
                Text("Correct!!!")
            }
            
            .alert("Wrong!", isPresented: $showingResultFalse) {
                Button("OK", action: {})
            } message: {
                Text("This is wrong answer! Correct is \(multiplicationTable * randomNumber)")
            }
        }
        
    }
    //MARK: - Functions
    func restart() {
        count = 0
        randomNumber = 1
        userResult = 0
        multiplicationTable = 1
        questions = 5
    }
    
    func buttonNumber(text: String) {
        userAnswer += text
    }
    
    func buttonSubmit() {
       let result = multiplicationTable * randomNumber
        if result == Int(userAnswer) {
            showingResult = true
            count += 1
            userAnswer = ""
            userResult += 1
            if randomNumber <= questions {
                randomNumber += 1
            } else {
                randomNumber = 1
                userResult = 0
            }
        } else {
            count += 1
            userAnswer = ""
            showingResultFalse = true
            userResult -= 1
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
