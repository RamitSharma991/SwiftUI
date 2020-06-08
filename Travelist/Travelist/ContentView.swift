//
//  ContentView.swift
//  Travelist
//
//  Created by Ramit sharma on 03/03/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI


//struct LoadingView: View {
//    VAR body: some View {
//        Text("Loading...")
//    }
//}
//struct SuccessView: View {
//    VAR body: some View {
//        Text("Success...")
//    }
//}
//struct FailedView: View {
//    VAR body: some View {
//        Text("Failed...")
//    }
//}

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
   // let values = [1, 5, 3, 6, 2, 9].sorted()
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
        ].sorted {
            $0.lastName < $1.lastName
    }
    
    var body: some View {
//        List(users) { user in
//            Text("\(user.lastName), \(user.firstName)")
//        }
//
//
//        enum LoadingState {
//            case loading, success, failed
//        }
        
  //      car loadingState = LoadingState.loading
//
//        Group {
//            if Bool.random() {
//                Rectangle()
//            } else {
//                Circle()
//            }
//        }
//
//        Group {
//            if loadingState = LoadingState.loading
        //    LoadingView()
//        } else if loadingState == .success {
//        SuccessView()
 //   } else if loadingSTate == .failed {
//      FailedView()
//
        Text("Hello World!")
            .onTapGesture {
                let str = "Test Message"
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
