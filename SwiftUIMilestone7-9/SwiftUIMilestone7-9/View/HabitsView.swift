//
//  HabitsView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 03.03.2023.
//

import SwiftUI

struct HabitsView: View {
    @State private var habitsTitle = ""
    @State private var descriptionText = ""
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Sleep, Eat, Run...", text: $habitsTitle)
                } header: {
                    Text("Your Habits")
                }
                
                Section {
                    TextField("Describe your habit", text: $descriptionText)
                } header: {
                    Text("Description")
                }
                
                
            }
            .listStyle(PlainListStyle())
            
            Image("girl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: 400)
        }
    }
}

struct HabitsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsView()
    }
}
