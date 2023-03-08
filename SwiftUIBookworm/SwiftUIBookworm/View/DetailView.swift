//
//  DetailView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 08.03.2023.
//

import SwiftUI

struct DetailView: View {
    var book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFill()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .padding(5)
                    .background(.black.opacity(0.70))
                    .foregroundColor(.white)
                    .font(.caption)
                    .fontWeight(.light)
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.title ?? "Unknown title")
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.8))
                .padding()
            Text(book.review ?? "Not review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            
                .navigationTitle(book.title ?? "unknown title")
                .navigationBarTitleDisplayMode(.inline)
        }
        .background(
            Image(book.genre ?? "Fantasy")
                .resizable()
                .scaledToFill()
                .blur(radius: 20)
                .ignoresSafeArea()
                
        )
    }
}


