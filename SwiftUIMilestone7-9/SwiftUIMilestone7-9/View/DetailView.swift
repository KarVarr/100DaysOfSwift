//
//  DetailView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 04.03.2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject var stepper = StepperView()
    @ObservedObject var habitArray = Habits()
    @State private var title = "title"
    @State private var description = "Description"
    @State private var picker = 0
    
    let activity: Activity
   
    var body: some View {
        VStack {
            List {
                Text(activity.title)
                        .listRowBackground(Color(red: 0.22, green: 0.68, blue: 0.62))
                    Text(activity.description)
                        .listRowBackground(Color(red: 0.22, green: 0.68, blue: 0.62))
                Stepper(stepper.completedTimes == 1 ? "Competed \(stepper.completedTimes) time" : "Competed \(stepper.completedTimes) times", value: $stepper.completedTimes, in: 0...100, step: 1)
                        .listRowBackground(Color(red: 0.22, green: 0.68, blue: 0.62))
                
            }
            .listStyle(.plain)
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            
            Image("woman")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
        }
        .background(Color(red: 0.22, green: 0.68, blue: 0.62))
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let activity = Activity(title: "title", description: "description", completedTimes: 0)
        DetailView(activity: activity)
    }
}
