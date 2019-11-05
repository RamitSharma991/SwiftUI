//
//  ContentView.swift
//  iexpense
//
//  Created by Ramit sharma on 01/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct secondView: View {
    @Environment(\.presentationMode)
    var presentationMode
    var name: String
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

class User {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}


struct NewView: View {
    @State private var showingSheet = false
var body: some View {
    Button("Show Sheet"){
    self.showingSheet.toggle()
    }
    .sheet(isPresented: $showingSheet) {
        secondView()
    }
    
    }
}
struct ContentView: View {
    @State private var user = User()
    var body: some View {
        VStack {
          
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("FirstName", text: $user.firstName)
                        TextField("FirstName", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
            // Once a value inside a Struct changes, the entire struct changes
            // Structs ha ve Unique owners,in  classes mutiple things point to the same value
            // Classes dont need Mutating keyword before methods to change properties
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
