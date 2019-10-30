//
//  ContentView.swift
//  Animations5
//
//  Created by Ramit sharma on 30/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}
struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 300)
                    .transition(.pivot)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
