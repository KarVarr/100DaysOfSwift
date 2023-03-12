//
//  DetailView.swift
//  SwiftUIMilestone10-12
//
//  Created by Karen Vardanian on 12.03.2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject var dataModel = DataModel()
    var body: some View {
        ScrollView {
            Text("hello\(dataModel.userData.count)")
            List {
                ForEach(dataModel.userData, id: \.id) { user in
                    Section {
                        Text("Name ")
                            .foregroundColor(.black)
                    } 
                }
            }.task {
                await dataModel.loadData()
            }
            
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
