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
    @State private var randomNumberForQuestions = Array(1...20)
    @State private var userAnswer = "Write your answer"
    
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
                            Text("What is \(multiplicationTable) * \(randomNumberForQuestions[1]) ")
                                .padding(20)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text(userAnswer)
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
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
                                            Button (action: {}) {
                                                Text("\(j + i * 3)")
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                            }
                                            
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
                                        userAnswer = "Write your answer"
                                    }
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.mint)
                                        .frame(width: 110,height: 50)
                                    
                                    Button ("0") {}
                                    
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.green)
                                        .frame(width: 110,height: 50)
                                    
                                    Button ("Submit") {
                                        
                                    }
                                    
                                    
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
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
