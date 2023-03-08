//
//  DetailView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 08.03.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    var book: Book
    
    var body: some View {
        GeometryReader { geo in
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
                    //Challenge 3
                    Text(Date.now, format: .dateTime.hour().minute().day().month().year())
                        .padding(5)
                        .background(.black.opacity(0.70))
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.light)
                        .clipShape(Capsule())
                        .offset(x: -geo.size.width/2 - 45, y: -5)
                }
                Text(book.title ?? "Unknown title")
                    .font(.largeTitle)
                    .foregroundColor(.white.opacity(0.8))
                    .padding()
                Text(book.review ?? "Not review")
                    .padding()
                    .foregroundColor(.white)
                
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                
                
                    .navigationTitle(book.title ?? "unknown title")
                    .navigationBarTitleDisplayMode(.inline)
                    .alert("Delete Book?", isPresented: $showingAlert)  {
                        Button("Delete",role: .destructive, action: deleteBook)
                        Button("Cancel", role: .cancel, action: {})
                    } message: {
                        Text("Are you sure?")
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingAlert = true
                            } label: {
                                Label("Delete book", systemImage: "trash")
                            }
                        }
                    }
            }
            .background(
                ZStack {
                    Image(book.genre ?? "Fantasy")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 20)
                        .ignoresSafeArea()
                    
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                }
            )
        }
    }
    
    func deleteBook () {
        moc.delete(book)
        
        try? moc.save()
    }
}
