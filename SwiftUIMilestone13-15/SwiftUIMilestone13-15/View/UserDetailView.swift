//
//  UserDetailView.swift
//  SwiftUIMilestone13-15
//
//  Created by Karen Vardanian on 22.03.2023.
//

import SwiftUI

struct UserDetailView: View {
    let name: String
    let image: Image
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black, radius: 5, x: 4, y: 4)
                
                Text(name)
                    .padding()
                    .background(Resources.AppColor.secondary.opacity(0.8))
                    .foregroundColor(.secondary)
                    .font(.largeTitle)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .fixedSize()
                
            }
            .padding(.horizontal)
            Spacer()
            
        }
        .padding(.top)
        .background(image.resizable().scaledToFill().blur(radius: 30))
        .background(Resources.AppColor.light)
    }
    
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(name: "User", image: Image(systemName: "questionmark.square"))
    }
}
