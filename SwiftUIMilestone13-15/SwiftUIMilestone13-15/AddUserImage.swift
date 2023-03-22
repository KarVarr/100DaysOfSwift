//
//  AddUserImage.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct AddUserImage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .border(.red)
                .frame(width: .infinity, height: 400)
                .padding()
            Text("User name")
                .padding()
            Spacer()
        }
        .navigationTitle("Add your photo")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddUserImage_Previews: PreviewProvider {
    static var previews: some View {
        AddUserImage()
    }
}
