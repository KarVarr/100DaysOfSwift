//
//  HabitsView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 03.03.2023.
//

import SwiftUI

struct HabitsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habitsTitle = ""
    @State private var descriptionText = ""
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geometry in
                    VStack {
                        List {
                            Section {
                                ZStack(alignment: .leading) {
                                    if habitsTitle.isEmpty {
                                        Text ("Sleep, Eat, Run...")
                                            .foregroundColor(.gray)
                                    }
                                    TextField("", text: $habitsTitle)
                                }
                            } header: {
                                Text("Your Habits")
                            }
                            
                            .listRowBackground(Color(red: 0.66, green: 0.81, blue: 0.56))
                            
                            Section {
                                ZStack(alignment: .leading) {
                                    if descriptionText.isEmpty {
                                        Text("Describe your habit")
                                            .foregroundColor(.gray)
                                    }
                                    TextField("", text: $descriptionText)
                                }
                            } header: {
                                Text("Description")
                            }
                            
                            .listRowBackground(Color(red: 0.66, green: 0.81, blue: 0.56))
                        }
                        .listStyle(PlainListStyle())
                        Spacer()
                        Image("girl")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(1 / 1, contentMode: .fit)
                            .frame( width: geometry.size.width - 100,alignment: .center)
                            .edgesIgnoringSafeArea(.all)
                    }
                 
                  
                        
               
                .foregroundColor(.black)
                .background(Color(red: 0.66, green: 0.81, blue: 0.56))
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward")
                    }
                }
            }
        }
        
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
