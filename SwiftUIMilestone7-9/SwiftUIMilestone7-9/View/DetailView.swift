//
//  DetailView.swift
//  SwiftUIMilestone7-9
//
//  Created by Karen Vardanian on 04.03.2023.
//

import SwiftUI

struct DetailView: View {
    @State private var title = "Title"
    @State private var description = "Description"
    @State private var picker = 0
    
    var body: some View {
        NavigationView {
            
            List {
                TextField("", text: $title)
                TextField("", text: $description)
                Stepper(picker == 1 ? "Competed \(picker) time" : "Competed \(picker) times", value: $picker)
                
            }
            .navigationTitle("Details")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
