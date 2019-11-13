//
//  Mission.swift
//  LongshotApp
//
//  Created by Ramit sharma on 08/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable { //Nested Structs
    let name: String
    let role: String
        
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
    "apollo\(id)"
    }
    
    var formattedlaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
            
        } else {
                return "N/A"
        }
    }
}
