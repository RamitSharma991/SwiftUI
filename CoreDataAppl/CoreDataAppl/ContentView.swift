//
//  ContentView.swift
//  CoreDataAppl
//
//  Created by Ramit sharma on 03/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
 //   @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@" ,"Star Wars")) var ships: FetchedResults<Ship>
    
    @State private var lastNameFilter = "A"
    
    //NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    //NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
    //NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e"))



    
//    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
//
//
    var body: some View {
        VStack {
            // list of matching singers
            
            FilteredList(filter: lastNameFilter)


            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
//        VStack {
//              List(ships, id: \.self) { ship in
//                            Text(ship.name ?? "Unknown name")
//                        }
//
//                        Button("Add Examples") {
//                            let ship1 = Ship(context: self.moc)
//                            ship1.name = "Enterprise"
//                            ship1.universe = "Star Trek"
//
//                            let ship2 = Ship(context: self.moc)
//                            ship2.name = "Defiant"
//                            ship2.universe = "Star Trek"
//
//                            let ship3 = Ship(context: self.moc)
//                            ship3.name = "Millennium Falcon"
//                            ship3.universe = "Star Wars"
//
//                            let ship4 = Ship(context: self.moc)
//                            ship4.name = "Executor"
//                            ship4.universe = "Star Wars"
//
//                            try? self.moc.save()
//                        }
//                    }
                }
            }
            
            
            
            
            
            
            
            
            
            
            
            
//        VStack {
//        List(wizards, id: \.self) { wizard in
//
//            Text(wizard.name ?? "Unknown")
//        }
//            Button("Add") {
//                let  wizard = Wizard(context: self.moc)
//                wizard.name = "Harry Potter"
//
//            }
//            Button("Save") {
//                do {
//                    try self.moc.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//        Button("Save") {
//            if self.moc.hasChanges {
//                try? self.moc.save()
//            }
//        }


//struct Student: Hashable {
//
//    let name : String
//}
//struct ContentView: View {
//    let students = [Student(name: "Harry Potter"), Student(name: "Hermoine Granger")]
//    var body: some View {
//        List(students, id: \.self) { student in
//            Text(student.name)
//
//
//////        List {
//////            ForEach([12, 4, 6, 8, 10], id: \.self) {
////                Text("\($0) is even")
////            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
