//
//  Bundle-Decodable.swift
//  LongshotApp
//
//  Created by Ramit sharma on 08/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([Astronaut].self, from: data) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        return loaded
    }
}
