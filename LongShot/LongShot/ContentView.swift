//
//  ContentView.swift
//  LongShot
//
//  Created by Ramit sharma on 07/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
            Image("pic1")
                .frame(width: geo.size.width)
                .aspectRatio(contentMode: .fit)
            .clipped()
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
