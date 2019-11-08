//
//  ContentView.swift
//  LongShot
//
//  Created by Ramit sharma on 07/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct customText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new customtext")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        

        VStack {
            
            NavigationView {
                List(0..<100) { row in
                    NavigationLink(destination: Text("Detail \(row)")) {
                        Text("Row \(row)")
                    }
                }
         
            }
            .navigationBarTitle("Pictures")

            GeometryReader { geo in
            Image("pic1")
                .frame(width: geo.size.width)
                .aspectRatio(contentMode: .fit)
            .clipped()
            }
            ScrollView(.horizontal) {
                VStack(spacing: 10) {
                    ForEach(0..<100) {
                        customText("Item \($0)")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity)
        
            }
            Button("Decode") {
                let ip = """
 {
                    "name": "Numpty poots", "address": "653, Parrot Rd", "City": "NumptyShire"


            }
   
 }
 """
                struct User: Codable {
                    var name: String
                    var address: Address
                }
                struct Address: Codable {
                    var street: String
                    var city: String
                }
                
                let data = Data(ip.utf8)
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
            
            
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
