//
//  ContentView.swift
//  DesignerApp
//
//  Created by Ramit sharma on 16/10/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // some is an opaque ret type: means it returns some sort of viewbut swiftui doesnt need to know/care
        // return something conforming to the view protocol
        // view body MUST return exactly one child view

        VStack(alignment: .center, spacing: 50){
            ZStack(alignment: .center) {
                Image("grdnt").frame(width: 400, height: 150, alignment: .center).clipped()
                Text("just trying new things").padding()
                    .font(.largeTitle).background(Color.black).foregroundColor(.white)
                
            }
            Text("Hello World").padding().foregroundColor(.white).background(Image("grdnt2").aspectRatio(contentMode: .fill).frame(width: 200, height: 50, alignment: .center).clipped().cornerRadius(13.0))
            Divider()

            Text("Welcome SwiftUI").bold().foregroundColor(.white).background(Image("grdnt2").aspectRatio(contentMode: .fill).frame(width: 200, height: 50, alignment: .center).clipped().cornerRadius(13.0))

            Image(systemName: "cloud.heavyrain.fill").foregroundColor(.pink).font(.largeTitle)

        }

        
    }
    
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#endif 
