//
//  UserDetailView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct UserDetailView: View {
    var body: some View {
        ZStack {
   
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .border(.red)
                
            
            Text("hello")
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
