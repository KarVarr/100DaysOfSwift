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
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                 
                    image
                        .resizable()
                        .frame(maxWidth: geo.size.width, maxHeight: geo.size.height / 2.5)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black, radius: 5, x: 4, y: 4)
                        .padding(.horizontal, 10)
                    
                    Text(name)
                        .padding()
                        .background(Resources.AppColor.secondary.opacity(0.8))
                        .foregroundColor(.secondary)
                        .font(.largeTitle)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .fixedSize()
                    
                }
                Spacer()
                Text("Hello this is a map")
                
            }
            .padding(.top)
            .background(image.resizable().scaledToFill().blur(radius: 30))
            .background(Resources.AppColor.light)
            .preferredColorScheme(.light)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(name: "User", image: Image(systemName: "questionmark.square"))
    }
}
