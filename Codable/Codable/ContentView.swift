//
//  ContentView.swift
//  Codable
//
//  Created by Ramit sharma on 05/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI


struct User: Codable {
    var firtName: String
    var lastName: String
    
}

struct ContentView: View {
    @State private var user = User(firtName: "Gary", lastName: "Tosh")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
