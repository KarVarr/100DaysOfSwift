//
//  AddBookView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 08.03.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller", "Other", "Unknown"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section {
                    ZStack(alignment: .leading) {
                        if review.isEmpty {
                            Text("Write something")
                                .foregroundColor(.gray)
                        }
                        TextEditor(text: $review)
                    }
                    
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save") {
                        //Challenge 1
                        if title == "" || author == "" || genre == "" {
                            showingAlert = true
                        } else {
                            let newBook = Book(context: moc)
                            newBook.id = UUID()
                            newBook.title = title
                            newBook.author = author
                            newBook.rating = Int16(rating)
                            newBook.genre = genre
                            newBook.review = review
                            try? moc.save()
                            dismiss()
                        }
                    }
                    
                }
            }
            .navigationTitle("Add Book")
            .alert("No data", isPresented: $showingAlert) {
                Button("OK", action: {})
            } message: {
                Text("Enter title, author and genre !")
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
