    //
    //  ContentView.swift
    //  Animation
    //
    //  Created by Ramit sharma on 25/10/19.
    //  Copyright © 2019 Ramit sharma. All rights reserved.
    //
    
    import SwiftUI
    
    struct ContentView: View {
        @State private var dragAmount = CGSize.zero
        @State private var enabled = false
        @State private var animationAmount: CGFloat = 1
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 700)
                .offset(dragAmount)
                .gesture(
            DragGesture()
                .onChanged{ self.dragAmount = $0.translation }

                .onEnded{_ in withAnimation(.spring()){
                    self.dragAmount = .zero
                    }}
            )
                    
            print(animationAmount)
            return VStack {
                
            
                Stepper("Scale Amount", value:  $animationAmount.animation(), in: 1...10)
                Button("Tap Here") {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                       
                    self.animationAmount += 360
                    //
                    }
                    
                }
                    .padding(50).background(Color.pink).foregroundColor(.blue).clipShape(Circle()).rotation3DEffect(.degrees(Double(animationAmount)), axis: (x: 1, y: 1, z: 0)).overlay(
                    Circle()
                        .stroke(Color.red).scaleEffect(animationAmount).opacity(Double(2 - animationAmount)).blur(radius: (animationAmount - 1) * 3).animation(
                            //.interpolatingSpring(stiffness: 50, damping: 1)
                            Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)
                    )
                    
                )
                    .onAppear() {
                        self.animationAmount = 2
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
