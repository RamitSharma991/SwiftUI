//
//  ContentView.swift
//  Animations2
//
//  Created by Ramit sharma on 30/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false

    var body: some View {
        Button("Tap Me"){
            self.enabled.toggle()
            
        }
            //order of animations matter
        .frame(width: 200, height: 200, alignment: .center)
        .background(enabled ? Color.red : Color.blue)
        .animation(.default)
            .foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
