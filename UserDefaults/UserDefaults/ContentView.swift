//
//  ContentView.swift
//  UserDefaults
//
//  Created by Ramit sharma on 05/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
