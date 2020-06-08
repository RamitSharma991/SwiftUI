//
//  Movie+CoreDataProperties.swift
//  CoreDataAppl
//
//  Created by Ramit sharma on 05/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

    var wrappedLastName: String {
        lastName ?? "Unknown"
    }

    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}
