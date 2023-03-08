//
//  ContentView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI




struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink {
                    DetailView(book: book)
                } label: {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.headline)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.largeTitle)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
