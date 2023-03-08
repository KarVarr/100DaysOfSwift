//
//  ContentView.swift
//  SwiftUIBookworm
//
//  Created by Karen Vardanian on 07.03.2023.
//

import SwiftUI




struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
            ForEach (books) { book in
                NavigationLink {
                    DetailView(book: book)
                } label: {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.largeTitle)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
            }
            .onDelete(perform: deleteBooks)
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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            AddBookView()
        }
        
    }
}

func deleteBooks(at offsets: IndexSet) {
    for offset in offsets {
        let book = books[offset]
        moc.delete(book)
    }
    try? moc.save()
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
