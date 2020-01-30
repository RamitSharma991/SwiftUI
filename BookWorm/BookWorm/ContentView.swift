//
//  ContentView.swift
//  BookWorm
//
//  Created by Ramit sharma on 20/12/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI
import CoreData

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
    .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
    .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    
    @Environment( \.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true), NSSortDescriptor(keyPath: \Book.author, ascending: true)]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    
    
    
    var body: some View {
        NavigationView {
//            Text("Count: \(books.count)")
            List {
                ForEach(books, id: \.self) { book in
//                    NavigationLink(destination: Text(book.title ?? "Unknown Title")) {
                    
                      NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            .onDelete(perform: deletebooks)
            }
        .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            
                .sheet(isPresented: $showingAddScreen) { AddView().environment(\.managedObjectContext, self.moc)
            }
        }
    }

//    var body: some View {
//        VStack {
//            List {
//                ForEach(students, id: \.id) { student in
//                    Text(student.name ?? "Unknown")
//
//                }
//            }
//            Button("Add") {
//                let firstNames = ["John","Bran", "Arya", "Sansa", "Balerion"]
//                let lastNames = ["Snow", "Stark", "Horseface", "Alaynestone", "Dread"]
//
//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
//
//                let student = Student(context: self.moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
//
//                try? self.moc.save()
//            }
//        }
//    }
//    @State private var rememberMe = false
//    var body: some View {
//        VStack {
//            PushButton(title: "Remember", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//    }
    
    
    func deletebooks(at offsets: IndexSet) {
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
