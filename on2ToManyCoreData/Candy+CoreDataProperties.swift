//
//  Candy+CoreDataProperties.swift
//  on2ToManyCoreData
//
//  Created by Ramit sharma on 12/02/20.
//  Copyright © 2020 Ramit sharma. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}
