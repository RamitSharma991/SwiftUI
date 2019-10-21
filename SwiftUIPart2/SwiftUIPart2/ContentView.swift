//
//  ContentView.swift
//  SwiftUIPart2
//
//  Created by Ramit sharma on 21/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showGreeting = true
    @State var showDetails = false
    @State var birthdate = Date()
    var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {

        VStack {

//            DatePicker($birthdate, maximumDate: Date(), displayedComponents: .date)
//               Text("Date is \(birthdate, formatter: dateFormatter)")
        Button(action: {
            self.showDetails.toggle()
        }) {
            Text("Show/Hide Details")
        //    Image("g4").frame(width: 350, height: 200, alignment: .top)
        }
            if showDetails {
                Image("g4").frame(width: 100, height: 70, alignment: .top).padding().onTapGesture(count: 2) {
                    print("Image tapped muliple times")
                }
                Text("Follow me on twitter @guggusharma").font(.largeTitle).lineLimit(nil).onTapGesture {
                    print("tapped")
                }
            }
        Toggle(isOn: $showGreeting) {
            Text("Toggle switch").lineLimit(5).padding().foregroundColor(.white)

        if showGreeting {
            Text("Hello folks")
            }

            }


     }
  }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
        
    }
}
