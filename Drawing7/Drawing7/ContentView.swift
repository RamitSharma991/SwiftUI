//
//  ContentView.swift
//  Drawing7
//
//  Created by Ramit sharma on 22/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI


struct Trapeziod: Shape {
    
    var animatableData: CGFloat {
        get { insetAmount }
        set { self.insetAmount = newValue}
    }
    var insetAmount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct ContentView: View {
    
    
    @State private var insetAmount: CGFloat = 50
    var body: some View {
        Trapeziod(insetAmount: insetAmount)
        .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
