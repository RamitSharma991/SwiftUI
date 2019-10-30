//
//  ContentView.swift
//  Animations3
//
//  Created by Ramit sharma on 30/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
          @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200, alignment:  .top)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture (
                DragGesture()
                    .onChanged{ self.dragAmount = $0.translation }
                               .onEnded{ _ in
                                withAnimation(.spring()) { self.dragAmount = .zero
                                    
                                }
                                
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
