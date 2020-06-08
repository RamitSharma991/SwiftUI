//
//  ContentView.swift
//  Flashzilla
//
//  Created by Ramit sharma on 04/05/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI
import CoreHaptics

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}


struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibiltyEnabled
    @State private var cards = [Card](repeating: Card.example, count: 10)
    @State private var isActive = true
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        ZStack{
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                )
                ZStack {
                    ForEach(0..<cards.count, id: \.self) {
                        index in CardView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCards(at: index)
                            }
                        }
                            .stacked(at: index, in: self.cards.count)
                        .allowsHitTesting(index == self.cards.count - 1)
                        .accessibility(hidden: index < self.cards.count - 1)
                        
                        
                    }
                }
            .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start Again", action:  resetCards)
                    .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                    .clipShape(Capsule())
                }
            }
            
            if differentiateWithoutColor || accessibiltyEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.removeCards(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        
                        .accessibility(label: Text("Wrong"))
                        .accessibility(hint: Text("Mark your answer as incorrect."))

                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.removeCards(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Correct"))
                        .accessibility(hint: Text("Marj your answer as being incorrect"))
                    }

                    .foregroundColor(.white)
                    .font(.largeTitle)
                .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
            
            }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
            self.isActive = true
            
            }
        }
        
    }
    func removeCards(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        
        if cards.isEmpty {
            isActive = false
        } else {
            
        }
    }
    
    func resetCards() {
        cards = [Card](repeating: Card.example, count: 10)
        timeRemaining = 100
        isActive = true
    }
}





    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView() }
    }

//struct ContentView: View {
//
////    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//
//    @Environment(\.accessibilityReducedMotion) var reducedMotion
//    @State private var scale: CGFloat = 1
//
//    @State private var engine: CHHapticEngine?
//    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
//
//
//    //Core Haptics vibrations, parameter curves
//    var body: some View {
//
////
////        HStack{
////            if differentiateWithoutColor {
////                Image(systemName: "checkmark.circle")
////            }
////            Text("Success")
////        }
////        .padding()
////        .background(differentiateWithoutColor ? Color.black : Color.green)
////        .foregroundColor(Color.white)
////        .clipShape(Capsule())
//
//
//        Text("Hello")
//
//            .onTapGesture(perform: prepareHaptics)
//            .onTapGesture(perform: complexSuccess)
//        // .onTapGesture(perform: simpleSuccess)
//
//
//
// //Triggering events repeatedly using a timer
//
//
////            .onReceive(timer) { time in
////                if self.counter == 5
////                self.timer.upstream.connect().cancel()
////        }  else {
////                    print("The time is now \(time)")
////                }
//
//
//    }
//    func simpleSuccess() {
//        let generator = UINotificationFeedbackGenerator()
//        generator.notificationOccurred(.success)
//    }
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        do {
//            self.engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There was an error creating the engine \(error.localizedDescription)")
//        }
//    }
//    func complexSuccess() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        var events = [CHHapticEvent]()
//
//        //
//        //                let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        //                let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        //                let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//
//            events.append(event)
//
//        }
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//
//            events.append(event)
//
//        }
//
//
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription)")
//
//        }
//
//    }
//
//    //Gestures Code
//
//    //  @State private var currentAmount: Angle = .degrees(0)
//    //  @State private var finalAmount: Angle = .degrees(0)
//    //    @State private var offset = CGSize.zero
//    //    @State private var isDragging = false
//    //
//    //
//    //    var body: some View {
//    //        VStack {
//    //            Text("Hello")
//    //                .onTapGesture {
//    //                    print("Text Tapped")
//    //            }
//    //        }.onLongPressGesture {
//    //            print("Vstack long tapped")
//    //        }
//    //    .highPriorityGesture(
//    //        TapGesture()
//    //            .onEnded{ _ in
//    //                print("Yeah")
//    //            }
//    //    .simultaneously(with: TapGesture()
//    //
//    //        )
//    //        )
//    //
//    //        let dragGesture = DragGesture()
//    //            .onChanged { (value) in
//    //                self.offset = value.translation
//    //        }
//    //        .onEnded { (_) in
//    //            withAnimation {
//    //                self.offset = .zero
//    //                self.isDragging = false
//    //            }
//    //
//    //            let pressGesture = LongPressGesture()
//    //                .onEnded { (value) in
//    //                    withAnimation {
//    //                        self.isDragging = true
//    //
//    //                    }
//    //            }
//    //            let combined = pressGesture.sequenced(before: dragGesture)
//    //
//    //            return Circle()
//    //                .fill(Color.red)
//    //                .frame(width: 64, height: 64)
//    //                .scaleEffect(isDragging ? 1.5 : 1)
//    //                .offset(offset)
//    //                .gesture(combined)
//    //        }
//    //    }
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView() }
//    }
//}
