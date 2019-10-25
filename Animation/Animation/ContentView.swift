//
//  ContentView.swift
//  Animation
//
//  Created by Ramit sharma on 25/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button("Tap Here") {
            self.animationAmount += 0.4
            //
        }.padding(50)
            .background(Color.pink).foregroundColor(.blue).clipShape(Circle()).scaleEffect(animationAmount).blur(radius: (animationAmount - 1) * 3).animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
