//
//  ContentView.swift
//  Drawing6
//
//  Created by Ramit sharma on 21/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            ZStack {
                Image("1a")
                    
            
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
            
            Circle()
                .fill(Color.red)
            .frame(width: 200 * amount)
                .offset(x: -50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(Color.green)
            .frame(width: 200 * amount)
            .offset(x: 50, y: -80)
                .blendMode(.screen)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 200 * amount)
                .blendMode(.screen)
        }
    .frame(width: 300, height: 300)
        Slider(value: $amount)
        .padding()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    
}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
