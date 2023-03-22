//
//  UserDetailView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct UserDetailView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .border(.red)
                
                Text("hello")
                    .padding()
                    .background(.black.opacity(0.5))
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                
            }
            Spacer()
            
        }
        .padding(.top)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
