//
//  DetailView.swift
//  SwiftUICupcakeCorner
//
//  Created by Karen Vardanian on 06.03.2023.
//

import SwiftUI

struct DetailView: View {
    let result: Result
    
    var body: some View {
        VStack {
                Text(result.trackName)
                    .font(.largeTitle)
            
                AsyncImage(url: URL(string: result.artworkUrl100)!)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
                HStack {
                    Text(result.country)
                        .padding()
                        .background(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(String(format: "%.2f", Double(result.trackTimeMillis) / 60000.0) )
                        .padding()
                        .background(.teal)
                        .clipShape(Circle())
                }
            }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(result: Result(trackId: 123, trackName: "test", collectionName: "testName", artworkUrl30: "https://example.com/image.jpg", artworkUrl100: "https://example.com/image.jpg", country: "US", trackTimeMillis: 240000))
    }
}
