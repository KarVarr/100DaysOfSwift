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
    @State private var userAnswer = ""
    
    @State private var questionsArray = [5,10,20]
    @State private var buttons = [1,2,3,4,5,6,7,8,9]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
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
                                .font(.title)
                                .foregroundColor(.brown)
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    
                    VStack(alignment: .center) {
                        
                        VStack(alignment: .center) {
                            Text("What is  \(multiplicationTable) * 5 ")
                            TextField("Write your answer", text: $userAnswer)
                                .frame(width: 300)
                                .border(.red)
                                .padding(.bottom, 30)
                                .keyboardType(.decimalPad)
                        }
                        .font(.largeTitle)
                        
                        
                        VStack {
                            ForEach(0..<3) {_ in
                                HStack {
                                    ForEach(0..<3) {_ in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 30)
                                                .fill(.green)
                                                .frame(width: 100,height: 50)
                                            ForEach (0..<10) { num in
                                                Button ("1") {}
                                                   
                                            }
                                        }
                                    }
                                }
                            }
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.green)
                                        .frame(width: 100,height: 50)
                                    
                                    Button ("del") {}
                                        .foregroundColor(.white)
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.green)
                                        .frame(width: 100,height: 50)
                                    
                                    Button ("0") {}
                                        .foregroundColor(.white)
                                    
                                }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.green)
                                        .frame(width: 100,height: 50)
                                    
                                    Button ("Submit") {}
                                        .foregroundColor(.white)
                                    
                                }
                                
                            }
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
