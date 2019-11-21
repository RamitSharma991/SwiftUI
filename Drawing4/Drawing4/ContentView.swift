//
//  ContentView.swift
//  Drawing4
//
//  Created by Ramit sharma on 20/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, World!")
//        .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("grdnt"), scale: 0.2), width: 30)
//
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("grdnt"), scale: 0.2), lineWidth: 20)
            .frame(width: 300, height: 200, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
