//
//  Blur.swift
//  Drawing6
//
//  Created by Ramit sharma on 21/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct Blur: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            Image("1a")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .saturation(Double(amount))
            .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
