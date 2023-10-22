//
//  AddBookView.swift
//  Bookworm
//
//  Created by 褚宣德 on 2023/10/20.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genere = "Fantasy" // Day56 Challenge 1
    @State private var review = ""
    // Day56 Challenge 1
    var haveValidBookData: Bool {
        if title.isEmpty || author.isEmpty || genere.isEmpty || review.isEmpty {
            return true
        } else if  title.hasPrefix(" ") || author.hasPrefix(" ") || review.hasPrefix(" ") {
            return true
        } else if author.count < 1 || review.count < 5 {
            return true
        }
        return false
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller","Inspiration"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genere) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genere
                        newBook.review = review
                        // Day56 Challenge 3
                        newBook.date = Date.now
                        
                        try? moc.save()
                        dismiss()
                        
                    }
                    .disabled(haveValidBookData)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
