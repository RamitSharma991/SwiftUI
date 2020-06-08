//
//  FilteredList.swift
//  CoreDataAppl
//
//  Created by Ramit sharma on 11/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList: View {
    
    var fetchRequest: FetchRequest<Movie>
    var singers: FetchedResults<Movie> {
        fetchRequest.wrappedValue
    }
 
 var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\() \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Movie>(entity: Movie.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filter: <#String#>)
//    }
//}
