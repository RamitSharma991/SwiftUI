//
//  ContentView.swift
//  LongshotApp
//
//  Created by Ramit sharma on 08/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts = Bundle.main.decode("as.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
