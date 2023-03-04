//
//  DetailView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 04.03.2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject var habitsArray = Habits()
    @State private var title = "title"
    @State private var description = "Description"
    @State private var picker = 0
    
    
    
    var body: some View {
        VStack {
            List {
                Text("Title")
                    .listRowBackground(Color(red: 0.22, green: 0.68, blue: 0.62))
                Text("Description")
                    .listRowBackground(Color(red: 0.22, green: 0.68, blue: 0.62))
                Stepper(picker == 1 ? "Competed \(picker) time" : "Competed \(picker) times", value: $picker)
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
        DetailView()
    }
}
